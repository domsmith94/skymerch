package skymerch.entities;

import java.util.*;

public class Basket {

	
	// THIS IS AN EARLY WORKING PROOF OF CONCEPT AND NOT THE FINAL VERSION 11/08 
	
	private List<BasketLine> basketLines = new ArrayList<BasketLine>();
	// QUANTITY?
	
	public List<BasketLine> getBasketLines() {
		return basketLines;
	}

	public void addProductToBasket(Product newProduct, int quantity) {
		boolean alreadyExists = false;
		for (BasketLine b:this.basketLines){
			if (newProduct.getProdId() == b.getProduct().getProdId()){
				// add "quantity" to the quantity because item already exists
				b.increaseQuantity(quantity);
				alreadyExists = true;
				break;
			}
		}
		
		if (alreadyExists == false){
			// add new basketline.
			basketLines.add(new BasketLine(newProduct, quantity));
		}
		
	}

	public void removeLineFromBasket(BasketLine productToRemove) {
		this.basketLines.remove(productToRemove);
	}

}
