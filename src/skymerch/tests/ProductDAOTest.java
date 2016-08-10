package skymerch.tests;

import java.util.List;
import skymerch.dao.ProductDAO;
import skymerch.entities.Product;
import skymerch.enums.Category;

public class ProductDAOTest {
	
	public static void main(String[] args){
	
	ProductDAO dao = new ProductDAO();	
		
	// test for multiSearch()
	List<Product> multiResults = dao.multiSearch("shrek", "0.00", "99.00");
	System.out.println("***MULTISEARCH RESULTS");
	for (Product p : multiResults){
		System.out.println("Product: " + p.getProdName() + " £" + p.getPrice());
	}
	
	//readAll() test
	List<Product> all = dao.readAll();
	System.out.println("***READ ALL RESULTS");
	for (Product allProd : all){
		System.out.println(allProd.getDetails());
	}
		
	//findById() test    	
		int id = 2000005;										//remember to check for null
		Product idProd = dao.findById(id);
		System.out.println("***FIND BY ID RESULT for id: " + id);
		System.out.println(idProd.getProdName() + " " + idProd.getProdId());
	
		
	//findByName() test	
		String name = "Shrek Mug";
		Product nameProd = dao.findByName(name);
		System.out.println("***FIND BY NAME RESULT for name: " + name);
		System.out.println(nameProd.getProdName() + " " + nameProd.getProdId());

		
	//findByCat() test
		Category cat = Category.MEDIA;
		List<Product> catResults = dao.findByCat(cat);
		System.out.println("***FIND BY CATEGORY RESULT for CATEGORY: " + cat);
		for (Product catProd : catResults){
		System.out.println(catProd.getProdName() + " " + catProd.getCategory());
		}
		
	//findByMaxPrice() test
		double max = 10.00;
		List<Product> maxResults = dao.findByMaxPrice(max);
		System.out.println("***FIND BY MAX PRICE for MAX PRICE: " + max);
		for (Product p : maxResults){
		System.out.println(p.getProdName() + " £" + p.getPrice());
			
		}
	//findByMinPrice() test
	//addProduct() test
	//removeProduct() test
		
	
		
		
		
	
	}
	


	
	
	
	
	

}
