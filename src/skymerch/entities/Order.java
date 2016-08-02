package skymerch.entities;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.sky.enums.Shipping;
import com.sky.enums.Status;

public class Order {
	
	private int orderId;
	private Customer orderedBy;
	private List<OrderLine> orderLines; // OrderLine will contain product and quant
	private Double totalCost;
	private Status status; // need to look how to do Enums complete, cancelled, refund etc 
	private Shipping shippingType;
	private Date orderTime;
	private Address deliveryAddress;
	
	public Order(){
		
	}

	public int getOrderId() { return orderId; }

	public void setOrderId(int orderId) { this.orderId = orderId; }

	public Customer getOrderedBy() { return orderedBy; }

	public void setOrderedBy(Customer orderedBy) { this.orderedBy = orderedBy; }

	public List<OrderLine> getOrderLines() { return orderLines; }

	public void setOrderLines(List<OrderLine> orderLines) { this.orderLines = orderLines; }

	public Double getTotalCost() { return totalCost; }

	public void setTotalCost(Double totalCost) { this.totalCost = totalCost; }

	public Status getStatus() { return status; }

	public void setStatus(Status status) { this.status = status; }

	public Shipping getShippingType() { return shippingType; }

	public void setShippingType(Shipping shippingType) { this.shippingType = shippingType; }

	public Date getOrderTime() { return orderTime; }

	public void setOrderTime(Date orderTime) { this.orderTime = orderTime; }

	public Address getDeliveryAddress() { return deliveryAddress; }

	public void setDeliveryAddress(Address deliveryAddress) { this.deliveryAddress = deliveryAddress; }
	
	
	
	
	

}
