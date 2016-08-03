package skymerch.tests;

import skymerch.external.*;
import skymerch.entities.Address;
import skymerch.entities.BCrypt;
import skymerch.enums.*;
import skymerch.entities.Customer;
import skymerch.entities.CustomerDAO;

public class DAOTest {
	
	public static void main(String[] args) {
		CustomerDAO dao = new CustomerDAO();
		
		// Initialise test customer
		Customer bel = new Customer();
		bel.setFirstName("Isobel");
		bel.setLastName("Forbes");
		bel.setTitle(Title.MS);
		bel.setEmail("belbel@cutemail.com");
		bel.setPassword("iloveD4da");
		Address belsAddr = new Address();
		belsAddr.setHouseNameNum("2/4");
		belsAddr.setAddressLineOne("Great Michael Rise");
		belsAddr.setAddressLineTwo("Newhaven");
		belsAddr.setRegion("Edinburgh");
		belsAddr.setCountry("Scotland");
		belsAddr.setPostcode("EH6 4JB");
		bel.setAddress(belsAddr);
		dao.addCustomer(bel);
		
		//dao.addCustomer(new Customer());
		//Customer customer = dao.findByEmail("adam.morrison@sky.uk");
		Customer customer = dao.findByEmail("belbel@cutemail.com");
		System.out.println(customer.getFirstName());
		String pass = "iloveD4da";
		String hashed = customer.getPassword();
		if (BCrypt.checkpw(pass, hashed)) {
			System.out.println("Passwords Match");
		}
		
		
	}
}
