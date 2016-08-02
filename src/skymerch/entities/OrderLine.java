package skymerch.entities;

public class OrderLine {
	
	private Product product;
	private int quantity; 
	private Double orderLinePrice;
	
	public OrderLine(Product p, int q)	{ this.product = p;	this.quantity = q;
	 										this.orderLinePrice = p.getPrice() * q;}
	
	public void setProduct(Product p)	{ this.product = p;}
	
	public Product getProduct() 		{ return this.product;}
	
	public void setQuantity(int n)		{ this.quantity = n;}
	
	public int getQuantity()			{ return this.quantity;}
	
	public void setOrderLinePrice(Double d) {this.orderLinePrice = d;}
	
	public Double getOrderLinePrice()	{return this.orderLinePrice;}	
	
	
}
