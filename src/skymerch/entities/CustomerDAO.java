package skymerch.entities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {
	
	public List<Customer> readAll(){
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			//the name of the database location is TBC
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TBC","root", "root");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM customer");
			ArrayList<Customer> allCustomers = null;
			while (rs.next()){
				int custId = rs.getInt(1);
				String firstName = rs.getString(2);
				String lastName = rs.getString(3);
				//TO DO: add proper values from SQL schema to this
				
				Customer customer = new Customer();
				customer.setCustId(custId);
				customer.setFirstName(firstName);
				customer.setLastName(lastName);
						//we have salesperson data
				
				//TO DO: add rest of the methods
				if (allCustomers == null){
					allCustomers = new ArrayList();
					
				}
				allCustomers.add(customer);
				
						}
		} catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	

}
