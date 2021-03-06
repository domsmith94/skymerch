package skymerch.entities;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import skymerch.enums.*;

public class Order implements Comparable<Order>{
	
	private int orderId;
	//private Customer orderedBy;
	private int customerId;
	private List<OrderLine> orderLines; // OrderLine will contain product and quant
	private Double totalCost;
	private Status status; // need to look how to do Enums complete, cancelled, refund etc 
	private Shipping shippingType;
	private java.time.LocalDateTime orderTime;
	private Address deliveryAddress;
	
	public Order(){
		
	}

	public Order(Customer customer, Basket basket, double totalCost, Address deliveryAddress, Shipping shippingType){
		this.customerId = customer.getCustId();
		List<OrderLine> orderLines = new ArrayList<OrderLine>();
		this.totalCost = totalCost;
		this.status = Status.ORDERED;
		this.shippingType = shippingType;
		this.deliveryAddress = deliveryAddress;
		this.orderTime = java.time.LocalDateTime.now();
		
		Double realTotalCost = 0.0;
		
		for(BasketLine b:basket.getBasketLines()){
			OrderLine ol = new OrderLine(b.getProduct(), b.getQuantity());
			realTotalCost = realTotalCost + b.getProduct().getPrice();
			orderLines.add(ol);
		}
		
		if (shippingType.equals(Shipping.STANDARD)) {
			realTotalCost = totalCost + 3.99;
		} else if (shippingType.equals(Shipping.NEXT_DAY)) {
			realTotalCost = totalCost + 5.99;
		}
		
		this.totalCost = realTotalCost;
		
		this.orderLines = orderLines;
	}
	public int getOrderId() { return orderId; }

	public void setOrderId(int orderId) { this.orderId = orderId; }

	//public Customer getOrderedBy() { return orderedBy; }

	//public void setOrderedBy(Customer orderedBy) { this.orderedBy = orderedBy; }
	
	public int getCustomerId() { return this.customerId; }
	
	public void setCustomerId(int custId) { this.customerId = custId; }

	public List<OrderLine> getOrderLines() { return orderLines; }

	public void setOrderLines(List<OrderLine> orderLines) { this.orderLines = orderLines; }

	public Double getTotalCost() { return totalCost; }

	public void setTotalCost(Double totalCost) { this.totalCost = totalCost; }
	
	public void setTotalCost() {
		if (this.orderLines != null) {
			// calculates total order cost by summing the quantities and item prices of each order line
			int length = this.orderLines.size();
			Double total = 0.0;
			for (int i = 0; i < length; i++) {
				total = total + (this.orderLines.get(i).getOrderLinePrice());
			}
			this.totalCost = total;
		}
	}

	public Status getStatus() { return status; }

	public void setStatus(Status status) { this.status = status; }

	public Shipping getShippingType() { return shippingType; }

	public void setShippingType(Shipping shippingType) { this.shippingType = shippingType; }

	public java.time.LocalDateTime getOrderTime() { return orderTime; }

	public void setOrderTime(java.time.LocalDateTime orderTime) { this.orderTime = orderTime; }

	public Address getDeliveryAddress() { return deliveryAddress; }

	public void setDeliveryAddress(Address deliveryAddress) { this.deliveryAddress = deliveryAddress; }
	
	// the method should implement the Comparator interface meaning orders can be compared listing by date placed 
	@Override
	public int compareTo(Order o) {
		if (this.getOrderId() > o.getOrderId()) {return -1;}
		else if (this.getOrderId() < o.getOrderId()) {return 1;}
		else {return 0;}
	}
	
	
	
	
	
	

}
