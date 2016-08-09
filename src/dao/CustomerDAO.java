package dao;

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

public class CustomerDAO {

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


	private Customer processResult(ResultSet rs) throws SQLException{
		// This method takes a result set containing a customer table entry and extracts the data,
		// storing it in a customer object and returning it for further use
		
		// First, save each column to a relevant variable
		int custId = rs.getInt(1);
		String firstName = rs.getString(2);
		String lastName = rs.getString(3);
		String email = rs.getString(4);
		String password = rs.getString(5);

		//TO DO: Add address values here

		// next, fill a customer object's fields with these temporary variables
		Customer customer = new Customer();
		customer.setCustId(custId);
		customer.setFirstName(firstName);
		customer.setLastName(lastName);
		customer.setEmail(email);
		customer.setPassword(password);

		//TO DO: Add address values 
		// return the completed customer object
		return customer;

	}

	public List<Customer> readAll(){
		try {
			Connection con = this.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM customer");
			ArrayList<Customer> allCustomers = null;
			while (rs.next()){
				Customer customer = this.processResult(rs);

				//TO DO: add rest of the methods
				if (allCustomers == null){
					allCustomers = new ArrayList();

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
		return null;
	}

	public Customer findById(int custId){
		try {
			Connection con = this.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM customer WHERE customer_id = " + custId + "");

			if (!rs.next()){
				System.out.println("No customer found in database with ID " + custId);
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

	public void addCustomer(Customer customer){
		try {
			// this method makes a connection to the database, then runs the SQL stript to add a customer entry to the database
			
			// initialise connection
			Connection con = this.getConnection();
			
			// Next we generate the script string using a Prepared Statement. 
			// Syntax: each '?' is a placeholder for a value which will be subsequently added
			
			// initialise String for general structure
			String sql = " insert into customer (first_name, last_name, email, user_password, house_no, address_line1, address_line2, town_city, postcode)"
					+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			// TEMPLATE - IGNORE //
			//String sql = "insert into customer(first_name, last_name, email, user_password, house_no, address_line1, city, country, postcode) values ('Adam','Morrison', 'adam.morrison', 'Apricot', '5', 'brimpsfield close abbeywood', 'london', 'UK', 'SE2 9LR')";
			
			// generate a prepared statement using sql string
			PreparedStatement stmt = con.prepareStatement(sql);
			Address addr = customer.getAddress();

			// assign required String data to each slot in the prepared statement (each '?')
			stmt.setString(1, customer.getFirstName());
			stmt.setString(2, customer.getLastName());
			stmt.setString(3, customer.getEmail());
			stmt.setString(4, customer.getPassword());
			stmt.setString(5, addr.getHouseNameNum());
			stmt.setString(6, addr.getAddressLineOne());
			stmt.setString(7, addr.getAddressLineTwo());
			stmt.setString(8, addr.getRegion());
			stmt.setString(9, addr.getPostcode());
			
			// execute the prepared statement (run in SQL)
			stmt.execute();
			
			// TO DO - extract auto-generated customer ID from db


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
