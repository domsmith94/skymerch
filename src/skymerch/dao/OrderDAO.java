package skymerch.dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.SortedSet;
import java.util.TreeSet;

import skymerch.entities.*;
import skymerch.enums.Category;
import skymerch.enums.Shipping;
import skymerch.enums.Status;

public class OrderDAO {

	private final String DB_LOCATION = "jdbc:mysql://localhost:3306/skymerch_db?useSSL=false";
	private final String DB_USERNAME = "root";
	private final String DB_PASSWORD = "root";

	private Connection connection;

	public OrderDAO(){
		Connection con = null;
		String DB_LOCATION = "jdbc:mysql://localhost:3306/skymerch_db?useSSL=false";
		String DB_USERNAME = "root";
		String DB_PASSWORD = "root";

		try{

			String dbName = System.getenv("RDS_DB_NAME");
			//String dbName = "skymerch_db";
			String userName = System.getenv("RDS_USERNAME");
			String password = System.getenv("RDS_PASSWORD");
			String hostname = System.getenv("RDS_HOSTNAME");
			String port = System.getenv("RDS_PORT");
			String jdbcUrl = "jdbc:mysql://" + hostname + ":" + port + "/" + dbName + "?user=" + userName + "&password=" + password;

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(jdbcUrl);

			//}

		} catch (Exception e){
			//e.printStackTrace();
			// create a driver class
			try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				con = DriverManager.getConnection(DB_LOCATION, DB_USERNAME, DB_PASSWORD);

			} catch (InstantiationException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (IllegalAccessException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		this.connection = con;
	}



	private Connection getConnection() {
		return this.connection;
	}

	private Order processOrder(ResultSet rs) throws SQLException{
		// This method takes a result set containing an order table entry and extracts the data,
		// storing it in an order object and returning it for further use

		// First, save each column to a relevant variable
		int orderId = rs.getInt(1);
		int custId = rs.getInt(2);
		java.sql.Timestamp sqlTimestamp = rs.getTimestamp(3);
		java.time.LocalDateTime goodDateTime = sqlTimestamp.toLocalDateTime();
		Shipping deliveryType = Shipping.valueOf(rs.getString(4).toUpperCase());
		Status orderStatus = Status.valueOf(rs.getString(5).toUpperCase());
		Double totalCost = rs.getDouble(6);
		String houseNameNum = rs.getString(7);
		String addrL1 = rs.getString(8);
		String addrL2 = rs.getString(9);
		String townCity = rs.getString(10);
		String postcode = rs.getString(11);
		List<OrderLine> lines = getOrderLines(orderId);

		// next, fill an order object's fields with these temporary variables
		Order order = new Order();
		Address address = new Address();
		order.setOrderId(orderId);
		order.setCustomerId(custId);
		order.setOrderTime(goodDateTime);
		order.setShippingType(deliveryType);
		order.setStatus(orderStatus);
		order.setTotalCost(totalCost);
		order.setOrderLines(lines);
		address.setHouseNameNum(houseNameNum);
		address.setAddressLineOne(addrL1);
		address.setAddressLineTwo(addrL2);
		address.setTownOrCity(townCity);
		address.setPostcode(postcode);
		order.setDeliveryAddress(address);

		// return the completed order object
		return order;
	}
	
	private Product processProductResult(ResultSet rs) throws SQLException{
		// numbers correspond to columns of the CURRENT ROW of database table
		int id = rs.getInt(1);
		String name = rs.getString(2);
		int stockLvl = rs.getInt(3);
		int stockReorderLvl = rs.getInt(4);
		String whLocation = rs.getString(5);
		String description = rs.getString(6);
		double rating = rs.getDouble(7);
		int ratingCount = rs.getInt(8);
		double price = rs.getDouble(9);
		Category category = Category.valueOf((rs.getString(10).toUpperCase()));
		
		Product product = new Product();
		product.setProdId(id);
		product.setProdName(name);
		product.setStockLevel(stockLvl);
		product.setReorderLevel(stockReorderLvl);
		product.setLocation(whLocation);
		product.setProdDesc(description);
		product.setRating(rating);
		product.setNumOfRatings(ratingCount);
		product.setPrice(price);
		product.setCategory(category);

		return product;
	}
	public Product findProductById(int prodId){
		Product p = null;
		try {
			Connection con = this.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM product WHERE product_id = " + prodId + "");
			if (rs.next()){
				p = this.processProductResult(rs);
			}
			else{
				System.out.println("No product found in database with ID " + prodId);
				}
		} catch(Exception e){
			e.printStackTrace();
			/*
			 * add what will happen if a statement in the try block
			 *(e.g. a username is input incorrectly) fails. 
			 *TO DO: work on exception strategy
			 */
			}
		return p;
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
		orderLine.setProduct(this.findProductById(productNo));
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

	public int addOrder(Order order){
		try {
			// this method makes a connection to the database, then runs the SQL stript to add a customer entry to the database

			// initialise connection
			Connection con = this.getConnection();

			// Next we generate the script string using a Prepared Statement. 
			// Syntax: each '?' is a placeholder for a value which will be subsequently added

			// initialise String for general structure
			String sql = " insert into customer_order (customer_id, order_date, delivery_type, order_status, total_price, house_no, address_line1, address_line2, town_city, postcode)"
					+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			// generate a prepared statement using sql string
			PreparedStatement stmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			Address addr = order.getDeliveryAddress();

			// assign required String data to each slot in the prepared statement (each '?')
			stmt.setInt(1, order.getCustomerId());
			java.sql.Timestamp timestamp = java.sql.Timestamp.valueOf(order.getOrderTime());
			stmt.setTimestamp(2, timestamp);
			stmt.setString(3, order.getShippingType().toString().toLowerCase());
			stmt.setString(4, order.getStatus().toString().toLowerCase());
			stmt.setDouble(5, order.getTotalCost());
			stmt.setString(6, addr.getHouseNameNum());
			stmt.setString(7, addr.getAddressLineOne());
			stmt.setString(8, addr.getAddressLineTwo());
			stmt.setString(9, addr.getTownOrCity());
			stmt.setString(10, addr.getPostcode());

			// execute the prepared statement (run in SQL)
			stmt.execute();

			// get orderId
			ResultSet rs = stmt.getGeneratedKeys();
			int orderId = 0;
			if (rs.next()) {
				orderId = rs.getInt(1);
			}



			// add orderlines to database in a loop
			List<OrderLine> orderLines = order.getOrderLines();
			int length = orderLines.size();

			// passes orderId into orderline through 'getGeneratedKeys' method
			for (int i = 0; i < length; i++) {
				addOrderLine(orderLines.get(i), orderId);
			}

			return orderId;

		} catch(Exception e) {
			e.printStackTrace();
			return 0;
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

	public List<Order> getAllOrders() {
		List<Order> orderHistory = null;

		try {
			Connection con = this.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * from customer_order ORDER BY order_date DESC;");


			while (rs.next()) {
				if (orderHistory == null) {orderHistory = new ArrayList<Order>();}
				Order o = this.processOrder(rs);
				orderHistory.add(o);
			}

			return orderHistory;


		} catch (Exception e) {
			e.printStackTrace();
			return orderHistory;

		}

	}

	public SortedSet<Order> getOrderHistory(int custId) {
		SortedSet<Order> orderHistory = null; 
		try {
			Connection con = this.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM customer_order WHERE customer_id = " + custId + "");
			while (rs.next()) {
				if (orderHistory == null) { orderHistory = new TreeSet<>(); }
				Order o = this.processOrder(rs);
				orderHistory.add(o);				
			} 
		} catch(Exception e){
			e.printStackTrace();
			/*
			 * add what will happen if a statement in the try block
			 *(e.g. a username is input incorrectly) fails. 
			 *TO DO: work on exception strategy
			 */
		}
		return orderHistory;

	}
	
	public SortedSet<Order> findByStatus(Status status) {
		SortedSet<Order> orders = null; 
		try {
			Connection con = this.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM customer_order WHERE order_status = '" + String.valueOf(status).toLowerCase() + "'");
			while (rs.next()) {
				if (orders == null) { orders = new TreeSet<>(); }
				Order o = this.processOrder(rs);
				orders.add(o);				
			} 
		} catch(Exception e){
			e.printStackTrace();
			/*
			 * add what will happen if a statement in the try block
			 *(e.g. a username is input incorrectly) fails. 
			 *TO DO: work on exception strategy
			 */
		}
		for (Order o : orders) {System.out.println("LOOK HERE AT THE REFINED ORDERS" + o.getStatus());}
		return orders;

	}

	public Order getOrderById(int orderId){
		Order order = null; 

		try {
			Connection con = this.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM customer_order WHERE order_no = " + orderId + "");

			if (rs.next()){
				order = this.processOrder(rs);
			} else {
				System.out.println("No order found in database with ID " + orderId);

			}

			return order;

		} catch (Exception e) {
			e.printStackTrace();
			return order;
		}

	}

	public void updateStatusById(int orderId, Status newStatus) {

		try {
			Connection con = this.getConnection();
			Statement stmt = con.createStatement();
			stmt.executeUpdate("UPDATE customer_order SET order_status='" + String.valueOf(newStatus).toLowerCase() + "' WHERE order_no =" + orderId);


		} catch (Exception e) {
			e.printStackTrace();
		}

	}


}
