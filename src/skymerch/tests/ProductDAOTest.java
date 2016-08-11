package skymerch.tests;

import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import skymerch.dao.ProductDAO;
import skymerch.entities.Product;
import skymerch.enums.Category;

public class ProductDAOTest {
	
	public static void main(String[] args){
	
	ProductDAO dao = new ProductDAO();	
		
	// test for multiSearch()
	System.out.println("***MULTISEARCH RESULTS");
	List<Product> multiResults = dao.multiSearch("shrek", "0.00", "99.00");
	for (Product p : multiResults){
		System.out.println("Product: " + p.getProdName() + " £" + p.getPrice());
	}
	
	System.out.println("***MULTISEARCH BROWSE RESULTS");
	Set<Category> test = new TreeSet<>();
	test.add(Category.HOUSEHOLD);
	test.add(Category.ELECTRONICS);
	List<Product> browseResults = dao.multiSearch(test, "50.00", "10000000.00");
	for (Product p : multiResults){
		System.out.println("Product: " + p.getProdName() + " £" + p.getPrice());
	}
	
	
	//readAll() test
	System.out.println("***READ ALL RESULTS");
	List<Product> all = dao.readAll();
	for (Product allProd : all){
		System.out.println(allProd.getDetails());
	}
		
	//findById() test    	
		int id = 2000005;										
		System.out.println("***FIND BY ID RESULT for id: " + id);
		Product idProd = dao.findById(id);
		System.out.println(idProd.getProdName() + " " + idProd.getProdId());
	
		
	//findByName() test	
		String name = "Shrek Mug";
		System.out.println("***FIND BY NAME RESULT for name: " + name);
		Product nameProd = dao.findByName(name);
		if (nameProd != null){
		System.out.println(nameProd.getProdName() + " " + nameProd.getProdId());
		}
		
	//findByCat() test
		Category cat = null;
		System.out.println("***FIND BY CATEGORY RESULT for CATEGORY: " + cat);
		List<Product> catResults = dao.findByCat(cat);
		if (catResults != null){
		for (Product catProd : catResults){
		System.out.println(catProd.getProdName() + " " + catProd.getCategory());
		}
		}
		
	//findByMaxPrice() test
		double max = 10.00;
		System.out.println("***FIND BY MAX PRICE for MAX PRICE: £" + max);
		List<Product> maxResults = dao.findByMaxPrice(max);
		for (Product p : maxResults){
		System.out.println(p.getProdName() + " £" + p.getPrice());
			
		}
		
	//findByMinPrice() test
		double min = 1.00;
		System.out.println("***FIND BY MIN PRICE for MIN PRICE: £" + min);
		List<Product> minResults = dao.findByMinPrice(min);
		for (Product p : minResults){
		System.out.println(p.getProdName() + " £" + p.getPrice());
		
		}
		
	//addProduct() test
		Product p = new Product();
		p.setProdName("Billions leather waistcoat");
		p.setPrice(999.00);
		p.setCategory(Category.CLOTHING);
		p.setStockLevel(10);
		p.setReorderLevel(2);
		p.setProdDesc("Feel like a Billionaire with this premium leather waistcoat.");		
		p.setLocation("X");
		//product validated in addProduct() method
		dao.addProduct(p);
		
		
		
		
	//removeProduct() test
		//dao.removeProduct(2000006);
		
	//remove all the waistcoats
		//dao.removeProduct("Billions leather waistcoat");
	}

}
