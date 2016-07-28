package com.sky.entities;

import java.util.Date;

public class Order {
	
	private int orderId;
	private Customer orderedBy;
	private OrderLine[] orderLines; // OrderLine will contain product and quant
	private Double totalCost;
	private Enum status; // need to look how to do Enums complete, cancelled, refund etc 
	private Enum shippingType;
	private Date orderTime;
	private Address deliveryAddress;
	
	// Homework - Everyone get a GitHub account
	
	
	

}
