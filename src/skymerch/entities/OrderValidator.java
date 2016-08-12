package skymerch.entities;

public class OrderValidator {

	public static boolean validate(Order o){
		boolean valid = false;
		// any extra checks can be added here with helper methods written below
		if (lineArrayCheck(o) && validCustomer(o) && validDate(o) && validShippingType(o) && validStatus(o) && totalPriceCheck(o)) {    
			valid = true;
		} 
		return valid;
	}	

	private static boolean validateLine(OrderLine ol) {
		boolean valid = false;
		// any extra checks can be added here with helper methods written below
		if (validProduct(ol) && linePriceCheck(ol) && quantityCheck(ol)) {    
			valid = true;
		} 
		return valid;
	}

	public static boolean lineArrayCheck(Order o) {
		boolean valid = false;
		if (o.getOrderLines().size() > 0) { 
			if (lineCheckLoop(o)) {
				valid = true; 
			}
		}
		return valid;	 
	}
	
	private static boolean lineCheckLoop(Order o) {
		boolean valid = true;
		for (int i = 0; i < o.getOrderLines().size(); i++) {
			if (!validateLine(o.getOrderLines().get(i))) {
				valid = false;
			}
		}
		return valid;
	}

	private static boolean validCustomer(Order o) { return (o.getCustomerId() != 0); }

	private static boolean validDate(Order o) { return (o.getOrderTime() != null); }

	private static boolean validShippingType(Order o) { return (o.getShippingType() != null); }

	private static boolean validStatus(Order o) { return (o.getStatus() != null); }

	private static boolean totalPriceCheck(Order o) { return (o.getTotalCost()>0 && o.getTotalCost()<=1000000); }

	private static boolean validProduct(OrderLine ol) { return (ol.getProduct() != null); }

	private static boolean linePriceCheck(OrderLine ol) { 
		return (ol.getOrderLinePrice()>0 && ol.getOrderLinePrice()<=100000); 
	}

	private static boolean quantityCheck(OrderLine ol) { 
		return (ol.getQuantity()>0 && ol.getQuantity() <= ol.getProduct().getStockLevel()); 
	}
}
