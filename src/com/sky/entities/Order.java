package com.sky.entities;

import java.util.Date;

public class Order {
	
	public enum Status {
		COMPLETE, DELIVERY, RECIEVED, PROCESSING
		
	}
	
	public enum Shipping {
		STANDARD, PREMIUM
	}
	
	private int orderId;
	private Customer orderedBy;
	private OrderLine[] orderLines; // OrderLine will contain product and quant
	private Double totalCost;
	private Status status; // need to look how to do Enums complete, cancelled, refund etc 
	private Shipping shippingType;
	private Date orderTime;
	private Address deliveryAddress;
	
	// Homework - Everyone get a GitHub account
	
	
	

}
