package skymerch.entities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import skymerch.enums.*;

public class ProductDAO {
	
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
	
	private Product processResult(ResultSet rs) throws SQLException{

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
	
	public List<Product> multiSearch(String prodnamequery, String lowerprice, String upperprice){
		ArrayList<Product> returnedProducts = null;
		try {
			Connection con = this.getConnection();
			Statement stmt = con.createStatement();
			
			String searchquery = new String("SELECT * FROM product");
				
			
			if (prodnamequery != null){searchquery = searchquery + " WHERE product_name LIKE '%" + prodnamequery + "%'";}
			if (lowerprice != null){
				int lowerprice_int = Integer.parseInt(lowerprice);
				
			}
			
			ResultSet rs = stmt.executeQuery(searchquery);
			while (rs.next()){
				Product product = this.processResult(rs);

				//TO DO: add rest of the methods
				// create array if not existing
				if (returnedProducts == null){
					returnedProducts = new ArrayList<Product>();
				}
				
				// add product to array
				returnedProducts.add(product);

			}
		} catch(Exception e){
			e.printStackTrace();
			/*
			 * add what will happen if a statement in the try block
			 *(e.g. a username is input incorrectly) fails. 
			 *TO DO: work on exception strategy
			 */
		}
		return returnedProducts;
	}
	
	
	public List<Product> readAll(){
		ArrayList<Product> allProducts = null;
		try {
			Connection con = this.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM product");
			while (rs.next()){
				Product product = this.processResult(rs);

				//TO DO: add rest of the methods
				// create array if not existing
				if (allProducts == null){
					allProducts = new ArrayList<Product>();
				}
				
				// add product to array
				allProducts.add(product);

			}
		} catch(Exception e){
			e.printStackTrace();
			/*
			 * add what will happen if a statement in the try block
			 *(e.g. a username is input incorrectly) fails. 
			 *TO DO: work on exception strategy
			 */
		}
		return allProducts;
	}
	
	public Product findById(int prodId){
		try {
			Connection con = this.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM product WHERE product_id = " + prodId + "");

			if (!rs.next()){
				System.out.println("No product found in database with ID " + prodId);
			}

			while (rs.next()){
				return this.processResult(rs);


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
	public Product findByName(String prodName){
		try {
			Connection con = this.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM product WHERE product_name = " + prodName + "");

			if (!rs.next()){
				System.out.println("No product found in database with ID " + prodName);
			}

			while (rs.next()){
				return this.processResult(rs);


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
	
	public void addProduct(Product product){
		try {
			Connection con = this.getConnection();
			
			String sql = " insert into product (product_name, stock_level, stock_reorder_level, warehouse_location, product_description, product_rating, rating_count, product_price, product_category)"
					+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			
			//String sql = "insert into customer(first_name, last_name, email, user_password, house_no, address_line1, city, country, postcode) values ('Adam','Morrison', 'adam.morrison', 'Apricot', '5', 'brimpsfield close abbeywood', 'london', 'UK', 'SE2 9LR')";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setString(1, product.getProdName());
			stmt.setInt(2, product.getStockLevel());
			stmt.setInt(3, product.getReorderLevel());
			stmt.setString(4, product.getLocation());
			stmt.setString(5, product.getProdDesc());
			stmt.setDouble(6, product.getRating());
			stmt.setInt(7, product.getNumOfRatings());
			stmt.setDouble(8, product.getPrice());
			stmt.setString(9, product.getCategory().toString().toLowerCase());
			
			stmt.execute();


		} catch(Exception e){
			e.printStackTrace();
			/*
			 * add what will happen if a statement in the try block
			 *(e.g. a username is input incorrectly) fails. 
			 *TO DO: work on exception strategy at a later date
			 */

		}
	}
	
		
}
