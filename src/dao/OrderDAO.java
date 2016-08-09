package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import skymerch.entities.*;
import skymerch.enums.Shipping;
import skymerch.enums.Status;

public class OrderDAO {
	
	private final String DB_LOCATION = "jdbc:mysql://localhost:3306/skymerch_db?useSSL=false";
	private final String DB_USERNAME = "root";
	private final String DB_PASSWORD = "root";
	
	private Connection getConnection() {
		Connection con = null;

		try {
			// create a driver class
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(this.DB_LOCATION, this.DB_USERNAME, this.DB_PASSWORD);

			// TO DO: We should move this out to another class so if we want to change database we only
			// have to change it once in the code base. 
		} catch (Exception e) {
			e.printStackTrace();
		}

		return con;
	}
	
	private Order processOrder(ResultSet rs) throws SQLException{
		// This method takes a result set containing an order table entry and extracts the data,
		// storing it in an order object and returning it for further use
		
		// First, save each column to a relevant variable
		int orderId = rs.getInt(1);
		Date orderDate = rs.getDate(2);
		Shipping deliveryType = Shipping.valueOf(rs.getString(3).toUpperCase());
		Status orderStatus = Status.valueOf(rs.getString(4).toUpperCase());
		Double totalCost = rs.getDouble(5);
		List<OrderLine> lines = getOrderLines(orderId);

		// next, fill an order object's fields with these temporary variables
		Order order = new Order();
		order.setOrderId(orderId);
		order.setOrderTime(orderDate);
		order.setShippingType(deliveryType);
		order.setStatus(orderStatus);
		order.setTotalCost(totalCost);

		// return the completed order object
		return order;
	}
	
	private OrderLine processLine(ResultSet rs) throws SQLException{
		// This method takes a result set containing a order line table entry and extracts the data,
		// storing it in a order line object and returning it for further use
		
		// First, save each column to a relevant variable
		int productNo = rs.getInt(2);
		Double itemPrice = rs.getDouble(3);
		int quantityOrdered = rs.getInt(4);
		Double totalCost = rs.getDouble(5);
		
		// next, fill an order line object's fields with these temporary variables
		OrderLine orderLine = new OrderLine();
		ProductDAO pdao = new ProductDAO();
		orderLine.setProduct(pdao.findById(productNo));
		orderLine.setOrderLinePrice(totalCost);
		orderLine.setQuantity(quantityOrdered);
		orderLine.setItemPrice(itemPrice);

		// return the completed order line object
		return orderLine;
	}
	
	public List<OrderLine> getOrderLines(int orderNo){
		ArrayList<OrderLine> allLines = null;
		try {
			Connection con = this.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM order_line WHERE order_no = " + orderNo + "");
			while (rs.next()){
				OrderLine line = this.processLine(rs);

				if (allLines == null){
					allLines = new ArrayList<OrderLine>();

				}
				allLines.add(line);
			}
		} catch(Exception e){
			e.printStackTrace();
			/*
			 * add what will happen if a statement in the try block
			 *(e.g. a username is input incorrectly) fails. 
			 *TO DO: work on exception strategy
			 */
		}
		return allLines;
	}
	
	public Order findById(int orderNo){
		try {
			Connection con = this.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM customer_order WHERE order_no = " + orderNo + "");
			
			if (rs.next()) {
				return this.processOrder(rs);	
			} else {
				System.out.println("No order found for order number " + orderNo);
			}
		} catch(Exception e){
			e.printStackTrace();
			/*
			 * add what will happen if a statement in the try block
			 *(e.g. a username is input incorrectly) fails. 
			 *TO DO: work on exception strategy
			 */
		}
		return null;
	}

	
	
	public void addOrder(Order order){
		try {
			// this method makes a connection to the database, then runs the SQL stript to add a customer entry to the database
			
			// initialise connection
			Connection con = this.getConnection();
			
			// Next we generate the script string using a Prepared Statement. 
			// Syntax: each '?' is a placeholder for a value which will be subsequently added
			
			// initialise String for general structure
			String sql = " insert into customer_order (order_no, order_date, delivery_type, order_status, total_price)"
					+ " values (?, ?, ?, ?, ?)";
			
			// TEMPLATE - IGNORE //
			//String sql = "insert into customer(first_name, last_name, email, user_password, house_no, address_line1, city, country, postcode) values ('Adam','Morrison', 'adam.morrison', 'Apricot', '5', 'brimpsfield close abbeywood', 'london', 'UK', 'SE2 9LR')";
			
			// generate a prepared statement using sql string
			PreparedStatement stmt = con.prepareStatement(sql);

			// assign required String data to each slot in the prepared statement (each '?')
			stmt.setInt(1, order.getOrderId());
			stmt.setDate(2, order.getOrderTime());
			stmt.setString(3, order.getShippingType().toString().toLowerCase());
			stmt.setString(4, order.getStatus().toString().toLowerCase());
			stmt.setDouble(5, order.getTotalCost());
			
			// execute the prepared statement (run in SQL)
			stmt.execute();
			
			// add orderlines to database in a loop
			List<OrderLine> orderLines = order.getOrderLines();
			int length = orderLines.size();
			
			for (int i = 0; i < length; i++) {
				addOrderLine(orderLines.get(i), order.getOrderId());
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void addOrderLine(OrderLine orderLine, int orderNo){
		try {
			// this method makes a connection to the database, then runs the SQL stript to add a customer entry to the database
			
			// initialise connection
			Connection con = this.getConnection();
			
			// Next we generate the script string using a Prepared Statement. 
			// Syntax: each '?' is a placeholder for a value which will be subsequently added
			
			// initialise String for general structure
			String sql = " insert into order_line (order_no, product_id, item_price, quantity_ordered, total_price)"
					+ " values (?, ?, ?, ?, ?)";
			
			// generate a prepared statement using sql string
			PreparedStatement stmt = con.prepareStatement(sql);

			// assign required String data to each slot in the prepared statement (each '?')
			stmt.setInt(1, orderNo);
			stmt.setInt(2, orderLine.getProduct().getProdId());
			stmt.setDouble(3, orderLine.getItemPrice());
			stmt.setInt(4, orderLine.getQuantity());
			stmt.setDouble(5, orderLine.getOrderLinePrice());
			
			// execute the prepared statement (run in SQL)
			stmt.execute();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
