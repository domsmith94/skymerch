package skymerch.entities;

public class BasketLine {
	
	private Product product = new Product();
	private int quantity;
	
	public BasketLine(Product p, int i){
		this.product=p;
		this.quantity=i;
	}
	
	public Product getProduct() {
		return this.product;
	}
	public int getQuantity() {
		return this.quantity;
	}
	
	public void setProduct(Product p) {
		this.product = p;
	}
	
	public void setQuantity(int i) {
		this.quantity = i;
	}
	public void increaseQuantity(){
		this.quantity++;
	}
	public void increaseQuantity(int i){
		this.quantity = i + this.quantity;
	}
	
}
