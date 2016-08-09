package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import skymerch.entities.Customer;

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

}
