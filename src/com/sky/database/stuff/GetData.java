package com.sky.database.stuff;
import java.util.*;

public class GetData {

	public static void main(String[] args) {
		// create a DAO
		SalespersonDAO dao = new SalespersonDAO();
		
		// get all salesperson data
		List<Salesperson> allSalespersons = dao.readAll();
		int i=0;
		for (Salesperson person: allSalespersons){
			System.out.println(person.getEmployeeNumber() + "" + person.getFirstName() + "" + person.getLastName());
			i++;
		}
		System.out.println(i);
	}

}
