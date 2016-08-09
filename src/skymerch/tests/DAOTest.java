package skymerch.tests;

import skymerch.enums.*;

import java.util.*;

import dao.CustomerDAO;
import dao.ProductDAO;
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
		System.out.println("Should output name of customer with given email, then report if password works:");
		//cdao.addCustomer(new Customer());
		//Customer customer = cdao.findByEmail("adam.morrison@sky.uk");
		Customer customer = cdao.findByEmail("belbelbel@cutemail.com");
		System.out.println(customer.getFirstName());
		String pass = "iloveD4da";
		String hashed = customer.getPassword();
		if (BCrypt.checkpw(pass, hashed)) {
			System.out.println("Passwords Match");
		}
		System.out.println(" ");
		cdao.emptyDb();
		
		// ~~~ Product reading test ~~~
		System.out.println("Should output name of first product:");
		List<Product> products = new ArrayList<Product>();
		products = pdao.readAll();
		System.out.println(products.get(0).getProdName());
		System.out.println(" ");

		Product product = pdao.findById(2000001);
		System.out.println("prod search result:" + product.getProdName());
		product = pdao.findByName("Game of Thrones - Arya plastic figure");
		System.out.println("prod search result:" + product.getProdName());

		// ~~~ Product writing test ~~~
		System.out.println("Should input a product, and return name of second product (which is the one we inputed):");
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
		System.out.println(" ");

		
		// ~~~ Product search test ~~~
		System.out.println("Should search for a product (search term: Arya):");
		List<Product> products3 = new ArrayList<Product>();
		//products2 = pdao.multiSearch("Arya", null, null);
		System.out.println(products2.get(0).getProdName());
		System.out.println(" ");
		
		// ~~~ Order add and read test ~~~
		OrderLine line = new OrderLine();
		line.setProduct(gotfig);
		line.setItemPrice(gotfig.getPrice());
		line.setQuantity(5);
		line.setOrderLinePrice();
		
		// TBC
	}
}
