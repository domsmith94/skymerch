package com.sky.entities;

import java.util.List;

public class Product {
	
	private int prodId;
	private int stockLevel; // amount of stock in system
	private int reorderLevel; // amount when stock needs to be re ordered
	private String prodName;
	private String prodDesc;
	private Double price;
	private List<String> keywords; //ArrayList :)
	private String location;
	private Enum category; // enum to limit options
	
	
	public Product(){
		
	}


	public int getProdId() { return prodId; }


	public void setProdId(int prodId) { this.prodId = prodId; }


	public int getStockLevel() { return stockLevel; }


	public void setStockLevel(int stockLevel) { this.stockLevel = stockLevel; }


	public int getReorderLevel() { return reorderLevel; }


	public void setReorderLevel(int reorderLevel) { this.reorderLevel = reorderLevel; }


	public String getProdName() { return prodName; }


	public void setProdName(String prodName) { this.prodName = prodName; }


	public String getProdDesc() { return prodDesc; }


	public void setProdDesc(String prodDesc) { this.prodDesc = prodDesc; }


	public Double getPrice() { return price; }


	public void setPrice(Double price) { this.price = price; }


	public List<String> getKeywords() { return keywords; }


	public void setKeywords(List<String> keywords) { this.keywords = keywords; }


	public String getLocation() { return location; }


	public void setLocation(String location) { this.location = location; }


	public Enum getCategory() { return category; }


	public void setCategory(Enum category) { this.category = category; }
	
	

}
