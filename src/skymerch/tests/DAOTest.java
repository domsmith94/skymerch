package skymerch.tests;

import skymerch.enums.*;

import java.util.*;

import skymerch.dao.CustomerDAO;
import skymerch.dao.OrderDAO;
import skymerch.dao.ProductDAO;
import skymerch.entities.*;

public class DAOTest {
	
	public static void main(String[] args) {
		CustomerDAO cdao = new CustomerDAO();
		ProductDAO pdao = new ProductDAO();
		OrderDAO odao = new OrderDAO();
		
		// Initialise test customer
		Customer bel = new Customer();
		bel.setFirstName("Isobel");
		bel.setLastName("Forbes");
		bel.setTitle(Title.valueOf("MS"));
		bel.setEmail("belbel@cutemail.com");
		bel.hashPassword("iloveD4da");
		Address belsAddr = new Address();
		belsAddr.setHouseNameNum("2/4");
		belsAddr.setAddressLineOne("Great Michael Rise");
		belsAddr.setAddressLineTwo("Newhaven");
		belsAddr.setTownOrCity("Edinburgh");
		belsAddr.setPostcode("EH6 4JB");
		bel.setAddress(belsAddr);
		cdao.addCustomer(bel);
		
		// ~~~ Customer read and password checking test ~~~ 
		System.out.println("Should output name of customer with given email, then report if password works:");	
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
		product = pdao.findByName("Game of Thrones hat");
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
		
		//gotfig.setKeywords(gotfigwords);
		gotfig.setLocation("Aisle 2");
		gotfig.setCategory(Category.valueOf("HOUSEHOLD"));
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
		Product testProd = pdao.findById(2000001);
		System.out.println("Should return the time of our test order:");
		OrderLine line = new OrderLine();
		line.setProduct(testProd);
		line.setItemPrice(testProd.getPrice());
		line.setQuantity(5);
		line.setOrderLinePrice();
		
		List<OrderLine> lineList = new ArrayList<OrderLine>();
		lineList.add(line);
		
		Order testOrder = new Order();
		Address addr = new Address();
		testOrder.setCustomerId(1000001);
		testOrder.setOrderLines(lineList);
		testOrder.setOrderTime(java.time.LocalDateTime.now());
		testOrder.setShippingType(Shipping.valueOf("NEXT_DAY"));
		testOrder.setStatus(Status.valueOf("PROCESSING"));
		testOrder.setTotalCost();
		addr.setHouseNameNum("2/4");
		addr.setAddressLineOne("Great Michael Rise");
		addr.setAddressLineTwo("Newhaven");
		addr.setTownOrCity("Edinburgh");
		addr.setPostcode("EH6 4JB");
		
		// add the order
		odao.addOrder(testOrder);
		
		// search for the order
		Order foundOrder = odao.findById(3000007);
		System.out.println(foundOrder.getOrderTime());
		
	}
	
}

