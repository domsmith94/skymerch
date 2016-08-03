package skymerch.tests;

import skymerch.enums.*;

import java.util.*;

import skymerch.entities.*;

public class DAOTest {
	
	public static void main(String[] args) {
		CustomerDAO cdao = new CustomerDAO();
		ProductDAO pdao = new ProductDAO();
		
		// Initialise test customer
		Customer bel = new Customer();
		bel.setFirstName("Isobel");
		bel.setLastName("Forbes");
		bel.setTitle(Title.MS);
		bel.setEmail("belbelbel@cutemail.com");
		bel.hashPassword("iloveD4da");
		Address belsAddr = new Address();
		belsAddr.setHouseNameNum("2/4");
		belsAddr.setAddressLineOne("Great Michael Rise");
		belsAddr.setAddressLineTwo("Newhaven");
		belsAddr.setRegion("Edinburgh");
		belsAddr.setCountry("Scotland");
		belsAddr.setPostcode("EH6 4JB");
		bel.setAddress(belsAddr);
		cdao.addCustomer(bel);
		
		// ~~~ Customer read and password checking test ~~~ 
		//cdao.addCustomer(new Customer());
		//Customer customer = cdao.findByEmail("adam.morrison@sky.uk");
		//Customer customer = cdao.findByEmail("belbel@cutemail.com");
		//System.out.println(customer.getFirstName());
		//String pass = "iloveD4da";
		//String hashed = customer.getPassword();
		//if (BCrypt.checkpw(pass, hashed)) {
			//System.out.println("Passwords Match");
		//}
		
		// ~~~ Product reading test ~~~
		List<Product> products = new ArrayList<Product>();
		products = pdao.readAll();
		System.out.println(products.get(0).getProdName());
		
	}
}
