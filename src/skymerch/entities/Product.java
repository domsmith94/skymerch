package skymerch.entities;

//import java.util.List; //not used unless keywords reinstated
import skymerch.enums.Category;

public class Product implements Comparable<Product>{
	
	private String prodName;
	private int prodId;
	private Category category;
	private int stockLevel; // amount of stock in system
	private int reorderLevel; // amount when stock needs to be re ordered
	private String prodDesc;
	private Double price;
	//private List<String> keywords; //not currently used
	private String location; //location in warehouse
	private double rating;
	private int numOfRatings;

	
	public String getProdName() { return prodName; }

	public void setProdName(String prodName) { this.prodName = prodName; }
	
	public int getProdId() { return prodId; }

	public void setProdId(int prodId) { this.prodId = prodId; }
	
	public Double getPrice() { return price; }

	public void setPrice(Double price) { this.price = price; }
	
	public Enum getCategory() { return category; }

	public void setCategory(Category category) { this.category = category; }
	
	public String getProdDesc() { return prodDesc; }

	public void setProdDesc(String prodDesc) { this.prodDesc = prodDesc; }

	
	public int getStockLevel() { return stockLevel; }

	public void setStockLevel(int stockLevel) { this.stockLevel = stockLevel; }

	public int getReorderLevel() { return reorderLevel; }

	public void setReorderLevel(int reorderLevel) { this.reorderLevel = reorderLevel; }

	//public List<String> getKeywords() { return keywords; }

	//public void setKeywords(List<String> keywords) { this.keywords = keywords; }

	public String getLocation() { return location; }

	public void setLocation(String location) { this.location = location; }

	public Double getRating() {	return rating;	}

	public void setRating(Double rating) {	this.rating = rating; }

	public int getNumOfRatings() {	return numOfRatings; }

	public void setNumOfRatings(int numOfRatings) { this.numOfRatings = numOfRatings; }
	
	public String getDetails(){
		return "Product: " + this.getProdName() + 
				" Category: " + this.getCategory() + 
				" Id: " + this.getProdId() + 
				" Price: £" + this.getPrice() + 
				" Description: " + this.getProdDesc() +
				" Rated " + this.getRating() + "/5 from " + this.getNumOfRatings() + " users ratings. " +
				this.getStockLevel() + " in stock, reorder at " +	this.getReorderLevel() + 
				", w/h location: " + this.getLocation(); 
	}

	// Comparable method so that natural order of products is highest rated first
	
	public int compareTo(Product p) {
		if (this.getRating() > p.getRating()) { return 1;}
		else if (this.getRating() < p.getRating()) { return -1;}
		else {return 0;}
	}


}
