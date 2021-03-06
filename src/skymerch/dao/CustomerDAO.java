package skymerch.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import skymerch.entities.Address;
import skymerch.entities.Customer;
import skymerch.enums.Category;
import skymerch.enums.Title;

public class CustomerDAO {

	private final String DB_LOCATION = "jdbc:mysql://localhost:3306/skymerch_db?useSSL=false";
	private final String DB_USERNAME = "root";
	private final String DB_PASSWORD = "root";
	private Connection connection;
	
	public CustomerDAO(){
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


	private Customer processResult(ResultSet rs) throws SQLException{
		// This method takes a result set containing a customer table entry and extracts the data,
		// storing it in a customer object and returning it for further use
		
		// First, save each column to a relevant variable
		int custId = rs.getInt(1);
		String firstName = rs.getString(2);
		String lastName = rs.getString(3);
		Title title = Title.valueOf((rs.getString(4).toUpperCase()));
		String email = rs.getString(5);
		String password = rs.getString(6);
		String houseNameNum = rs.getString(7);
		String addrL1 = rs.getString(8);
		String addrL2 = rs.getString(9);
		String townCity = rs.getString(10);
		String postcode = rs.getString(11);

		Address address = new Address();
		address.setHouseNameNum(houseNameNum);
		address.setAddressLineOne(addrL1);
		address.setAddressLineTwo(addrL2);
		address.setTownOrCity(townCity);
		address.setPostcode(postcode);
		

		// next, fill a customer object's fields with these temporary variables
		Customer customer = new Customer();
		customer.setCustId(custId);
		customer.setFirstName(firstName);
		customer.setLastName(lastName);
		customer.setTitle(title);
		customer.setEmail(email);
		customer.setPassword(password);
		customer.setAddress(address);

		// return the completed customer object
		return customer;

	}

	public List<Customer> readAll(){
		ArrayList<Customer> allCustomers = null;
		try {
			Connection con = this.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM customer");
			while (rs.next()){
				Customer customer = this.processResult(rs);

				//TO DO: add rest of the methods
				if (allCustomers == null){
					allCustomers = new ArrayList<Customer>();

				}
				allCustomers.add(customer);

			}
		} catch(Exception e){
			e.printStackTrace();
			/*
			 * add what will happen if a statement in the try block
			 *(e.g. a username is input incorrectly) fails. 
			 *TO DO: work on exception strategy
			 */

		}
		return allCustomers;
	}

	public Customer findById(int custId){
		try {
			Connection con = this.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM customer WHERE customer_id = " + custId + "");

			if (!rs.next()){
				System.out.println("No customer found in database with ID " + custId);
			} else {
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

	public Customer findByEmail(String email){
		try {
			Connection con = this.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM customer WHERE email = '" + email + "'");

			// If ResultSet is not empty, return Customer object generated by passing the single Result in ResultSet
			// to the processResult method. 

			if (rs.next()){
				return this.processResult(rs);

			} 


		} catch(Exception e){
			e.printStackTrace();
			/*
			 * add what will happen if a statement in the try block
			 *(e.g. a username is input incorrectly) fails. 
			 *TO DO: work on exception strategy at a later date
			 */

		}
		// If a Result has been found, the method will have already returned a Customer object and
		// here will never be reached. This handles the case that no items were found in the db matching
		// the email input. We return null

		System.out.println("No customer found in database with email " + email);
		return null;
	}

	public int addCustomer(Customer customer){
		try {
			// this method makes a connection to the database, then runs the SQL stript to add a customer entry to the database
			
			// initialise connection
			Connection con = this.getConnection();
			
			// Next we generate the script string using a Prepared Statement. 
			// Syntax: each '?' is a placeholder for a value which will be subsequently added
			
			// initialise String for general structure
			String sql = " insert into customer (first_name, last_name, title, email, user_password, house_no, address_line1, address_line2, town_city, postcode)"
					+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			// generate a prepared statement using sql string
			PreparedStatement stmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			Address addr = customer.getAddress();

			// assign required String data to each slot in the prepared statement (each '?')
			stmt.setString(1, customer.getFirstName());
			stmt.setString(2, customer.getLastName());
			stmt.setString(3, customer.getTitle().toString().toLowerCase());
			stmt.setString(4, customer.getEmail());
			stmt.setString(5, customer.getPassword());
			stmt.setString(6, addr.getHouseNameNum());
			stmt.setString(7, addr.getAddressLineOne());
			stmt.setString(8, addr.getAddressLineTwo());
			stmt.setString(9, addr.getTownOrCity());
			stmt.setString(10, addr.getPostcode());
			
			// execute the prepared statement (run in SQL)
			stmt.execute();
			
			// get customerId
			ResultSet rs = stmt.getGeneratedKeys();
			rs.next();
			return rs.getInt(1);



		} catch(Exception e){
			e.printStackTrace();
			/*
			 * add what will happen if a statement in the try block
			 *(e.g. a username is input incorrectly) fails. 
			 *TO DO: work on exception strategy at a later date
			 */
			return 0;
		}
	}
	
	public void emptyDb() {
		try {
			Connection con = this.getConnection();
			Statement stmt = con.createStatement();
			stmt.executeUpdate("DELETE FROM customer");
		} catch(Exception e){
			e.printStackTrace();
		}
	}
}
