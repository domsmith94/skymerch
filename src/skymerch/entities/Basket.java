package skymerch.entities;

import java.util.*;

public class Basket {

	
	// THIS IS AN EARLY WORKING PROOF OF CONCEPT AND NOT THE FINAL VERSION 11/08 
	
	private List<Product> basketProducts = new ArrayList<Product>();
	// QUANTITY?
	
	public List<Product> getBasketProducts() {
		return basketProducts;
	}

	public void addProductToBasket(Product newProduct) {
		this.basketProducts.add(newProduct);
	}

	public void removeProductFromBasket(Product productToRemove) {
		this.basketProducts.remove(productToRemove);
	}

}
