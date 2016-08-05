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
		
		
		// ~~~ Product writing test ~~~
		Product gotfig = new Product();
		//gotfig.setProdId // database should handle this
		gotfig.setStockLevel(5);
		gotfig.setReorderLevel(2);
		gotfig.setProdName("Game of Thrones - Arya plastic figure");
		gotfig.setProdDesc("3\" model of Arya");
		gotfig.setPrice(4.99);
		
		List<String> gotfigwords = new ArrayList<String>();
		gotfigwords.add("got");
		
		gotfig.setKeywords(gotfigwords);
		gotfig.setLocation("Aisle 2");
		gotfig.setCategory(Category.valueOf("HOUSEHOLD"));
		gotfig.setBrand("HBO");
		gotfig.setNumOfRatings(4);
		gotfig.setRating(5.25);
		
		pdao.addProduct(gotfig);
		
		List<Product> products2 = new ArrayList<Product>();
		products2 = pdao.readAll();
		System.out.println(products2.get(1).getProdName());
	}
}
