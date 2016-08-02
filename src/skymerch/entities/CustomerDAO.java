package skymerch.entities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {


	private Customer processResult(ResultSet rs) throws SQLException{
		// Added general method here so we can reuse it. If we want to add additional fields to
		//customer we can add it here rather than duplicating it 

		int custId = rs.getInt(1);
		String firstName = rs.getString(2);
		String lastName = rs.getString(3);
		//TO DO: add proper values from SQL schema to this

		Customer customer = new Customer();
		customer.setCustId(custId);
		customer.setFirstName(firstName);
		customer.setLastName(lastName);
		//we have salesperson data

		return customer;

	}

	public List<Customer> readAll(){
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			//the name of the database location is TBC
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TBC","root", "root");
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
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			//the name of the database location is TBC
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TBC","root", "root");
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
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			//the name of the database location is TBC
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skymerch_db","root", "root");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM customer WHERE email = '" + email + "'");

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
		System.out.println("No customer found in database with email " + email);
		return null;
	}
	public void addCustomer(Customer customer){
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			//the name of the database location is TBC
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skymerch_db","root", "root");
			Statement stmt = con.createStatement();

			//String sql = "insert into custoer(first_name, last_name, email, user_password, house_no, address_line1, city, country, postcode) values ('" + customer.getFirstName() + "','" + customer.getLastName() + "', '" + customer.getEmail() + "', '" + customer.getPassword() + "', '" + customer.getAddress().getHouseNameNum() + "', '" + customer.getAddress().getAddressLineOne() + "', '" + customer.getAddress().getAddressLineTwo() + "','" + customer.getAddress().get 'london', 'UK', 'SE2 9LR'";
			String sql = "insert into customer(first_name, last_name, email, user_password, house_no, address_line1, city, country, postcode) values ('Adam','Morrison', 'adam.morrison', 'Apricot', '5', 'brimpsfield close abbeywood', 'london', 'UK', 'SE2 9LR')";
			stmt.executeUpdate(sql);
		
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
