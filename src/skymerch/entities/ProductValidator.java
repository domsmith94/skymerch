package skymerch.entities;

import java.util.regex.*;

public class ProductValidator {
	/*
	       From Trello
	       
	       prodName = ProductName: Minimum 1 character, maximum 100 characters.
	       brand = Brand: Minimum 0 characters (allowing for null brand), maximum 30 characters.
	       (automated) -> prodId = ProductId
	       price = ProductPrice: £ .
	       prodDesc = ProductDescription (min 1 char, max 2000 chars), tend to include size and weight but not mandatory fields.
	       
	       stockLevel
	       reorderLevel
	       
	*/
	       // static method for validating customer details
	             public static boolean validate(Product c){
	                    boolean valid = false;
	                    if (nameCheck(c) && descCheck(c) && priceCheck(c) && levelCheck(c) && locationCheck(c)) {    // any extra checks can be added here with helper methods written below
	                           valid = true;
	                    } 
	                    return valid;
	             }
	             
	             // ensures names are within acceptable lengths
	             private static boolean nameCheck(Product c){
	                    return (c.getProdName().length()>0 && c.getProdName().length()<=100);
	             }
	             
	             private static boolean descCheck(Product c){
	                    return (c.getProdDesc().length()>0 && c.getProdDesc().length()<=2000);
	             }
	             
	             private static boolean priceCheck(Product c){
	                    return (c.getPrice()>0.00 && c.getPrice()<=9999.99);
	             }

	             private static boolean levelCheck(Product c){
	                    return (c.getStockLevel()>=0 && c.getReorderLevel()>=0);
	             }
	             
	             private static boolean locationCheck(Product c){
	            	 	return (c.getLocation() != null);
	             }
	             
	             
}