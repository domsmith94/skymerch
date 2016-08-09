package com.sky.database.stuff;
import java.util.*;
import java.sql.*;
import javax.sql.*;

public class SalespersonDAO {

	public ArrayList<Salesperson> readAll() {
		//System.out.println("hello");
		ArrayList<Salesperson> allSalesPersons = new ArrayList<Salesperson>();
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myDatabase?useSSL=false","root","root");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM salesperson");
			// read thru results
			while (rs.next()){
				int employeeNumber = rs.getInt(1);
				String firstName = rs.getString(2);
				String lastName = rs.getString(3);
				
				Salesperson salesperson = new Salesperson(employeeNumber, firstName, lastName);
				allSalesPersons.add(salesperson);
				
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		
		return allSalesPersons;
	}

}
