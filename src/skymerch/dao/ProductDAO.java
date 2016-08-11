package skymerch.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import skymerch.entities.Product;
import skymerch.entities.ProductValidator;
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
	
	  //search with multiple arguments
	public List<Product> multiSearch(String prodnamequery, String lowerprice, String upperprice){
		ArrayList<Product> returnedProducts = null;
		try {
			Connection con = this.getConnection();
			Statement stmt = con.createStatement();			
			StringBuilder searchquery = new StringBuilder("SELECT * FROM product WHERE 1=1");
			if (prodnamequery != null){searchquery.append(" AND product_name LIKE '%" + prodnamequery + "%'");}
			if (lowerprice != null){searchquery.append(" AND product_price >= '" + lowerprice + "'");}
			if (upperprice != null){searchquery.append(" AND product_price <= '" + upperprice + "'");}
			ResultSet rs = stmt.executeQuery(searchquery.toString());
			while (rs.next()){
				Product product = this.processResult(rs);
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
	
	//OVERLOADED multisearch method for use by browse page
		public List<Product> multiSearch(Set<Category> catSet, String lowerprice, String upperprice){
			ArrayList<Product> returnedProducts = null;
			try {
				Connection con = this.getConnection();
				Statement stmt = con.createStatement();
				StringBuilder searchquery = new StringBuilder("SELECT * FROM product WHERE 1+1");
				if (catSet != null && catSet.size() > 0) {
					searchquery.append(" AND product_category IN (");
					Iterator<Category> iterator = catSet.iterator();
					while (iterator.hasNext()) {
						searchquery.append("'" + String.valueOf(iterator.next()).toLowerCase() + "', ");
						}
						searchquery.replace(searchquery.length()-2, searchquery.length(), ")");
							
								}
				if (lowerprice == null) {lowerprice = "0.0"; }
				if (upperprice == null) {upperprice = "10000000000.0"; }
															
				searchquery.append(" AND product_price BETWEEN '" + lowerprice + "' AND '" + upperprice + "'");			
				System.out.println(searchquery);		
				ResultSet rs = stmt.executeQuery(searchquery.toString());
				while (rs.next()){
					Product product = this.processResult(rs);
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
		Product p = null;
		try {
			Connection con = this.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM product WHERE product_id = " + prodId + "");
			if (rs.next()){
				p = this.processResult(rs);
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

	public Product findByName(String prodName){
		Product p = null;
		try {
			Connection con = this.getConnection();
			Statement stmt = con.createStatement();
			if (prodName != null){
			ResultSet rs = stmt.executeQuery("SELECT * FROM product WHERE product_name = '" + prodName + "'");
			if (rs.next()){
				p =  this.processResult(rs);				
			}
			else{
				System.out.println("No product found in database with name " + prodName);
			}
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
	
	//returns a list of products of the category specified
	public List<Product> findByCat(Category cat){
		ArrayList<Product> returnedProducts = null;
		try {
		Connection con = this.getConnection();
		Statement stmt = con.createStatement();
		if (cat != null){
		String catString = cat.toString().toLowerCase();
		ResultSet rs = stmt.executeQuery("SELECT * FROM product WHERE product_category = '" + catString + "'");
		if (rs.next()){
			if(returnedProducts == null){
				returnedProducts = new ArrayList<>();
				}
			Product product = this.processResult(rs);
			returnedProducts.add(product);
		}
		else{
			System.out.println("No product found in database with category" + catString);
		}	
		}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return returnedProducts;
	}
		
	//returns list of products with price <= than specified max
	public List<Product> findByMaxPrice(double max){
		ArrayList<Product> returnedProducts = null;
		try {
		Connection con = this.getConnection();
		Statement stmt = con.createStatement();			
		ResultSet rs = stmt.executeQuery("SELECT * FROM product WHERE product_price <=" + max);
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
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return returnedProducts;		
		
	}
	//returns a list of products with price >= specified min
	public List<Product> findByMinPrice(double min){
		ArrayList<Product> returnedProducts = null;
		try {
		Connection con = this.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM product WHERE product_price >=" + min);
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
		}
		catch(Exception e){			
			e.printStackTrace();
			}
		return returnedProducts;
		}
	
	public void addProduct(Product product){
		if (ProductValidator.validate(product)){		
		try {
			Connection con = this.getConnection();
			
			String sql = " insert into product (product_name, stock_level, stock_reorder_level, warehouse_location, product_description, product_rating, rating_count, product_price, product_category)"
					+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
												
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
		} 
		catch(Exception e){
			e.printStackTrace();
			/*
			 * add what will happen if a statement in the try block
			 *(e.g. a username is input incorrectly) fails. 
			 *TO DO: work on exception strategy at a later date
			 */
		}
		}
	}
	
	public void removeProduct(int prodID){
		try {
			Connection con = this.getConnection();
			Statement stmt = con.createStatement();
			stmt.executeUpdate("DELETE FROM product WHERE product_id = '" + prodID + "'");
		}
		catch(Exception e){
			e.printStackTrace();
			/*
			 * add what will happen if a statement in the try block
			 *(e.g. a username is input incorrectly) fails. 
			 *TO DO: work on exception strategy at a later date
			 */
		}
		}	
	
	public void removeProduct(String prodName){
		try {
			Connection con = this.getConnection();
			Statement stmt = con.createStatement();
			stmt.executeUpdate("DELETE FROM product WHERE product_name = '" + prodName + "'");
		}
		catch(Exception e){
			e.printStackTrace();
			/*
			 * add what will happen if a statement in the try block
			 *(e.g. a username is input incorrectly) fails. 
			 *TO DO: work on exception strategy at a later date
			 */
		}
		}	
}
