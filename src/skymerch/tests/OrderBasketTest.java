package skymerch.tests;

import java.util.ArrayList;
import java.util.List;

import skymerch.dao.OrderDAO;
import skymerch.dao.*;
import skymerch.entities.*;
import skymerch.enums.Shipping;
import skymerch.enums.Status;

public class OrderBasketTest {
	public static void main(String[] args) {
		ProductDAO pdao = new ProductDAO();
		OrderDAO odao = new OrderDAO();
		CustomerDAO cdao = new CustomerDAO();
		
		
		Product testProd = pdao.findById(2000001);
		Customer testCust = cdao.findById(1000001);
		int theId = testCust.getCustId();
		Basket basket = new Basket();
		basket.addProductToBasket(testProd, 3);
		double totalCost = 5.0;
				
//		System.out.println("Should return the time of our test order:");
//		OrderLine line = new OrderLine();
//		line.setProduct(testProd);
//		line.setItemPrice(testProd.getPrice());
//		line.setQuantity(5);
//		line.setOrderLinePrice();
//		
//		List<OrderLine> lineList = new ArrayList<OrderLine>();
//		lineList.add(line);
		Address addr = new Address();
		addr.setHouseNameNum("4");
		addr.setAddressLineOne("Greal Rise");
		addr.setAddressLineTwo("Newn");
		addr.setTownOrCity("Edinbrgh");
		addr.setPostcode("EH6 4JB");
		//testOrder.setShippingType();
		
	Order testOrder = new Order(testCust, basket, totalCost, addr, Shipping.valueOf("NEXT_DAY"));
	
	//testOrder.setCustomerId(1000001);
	//testOrder.setOrderLines(lineList);
	//testOrder.setOrderTime(java.time.LocalDateTime.now());
	
	//testOrder.setStatus(Status.valueOf("PROCESSING"));
	//testOrder.setTotalCost();
	
	//testOrder.setDeliveryAddress(addr);
	System.out.println(OrderValidator.validate(testOrder));
	
	odao.addOrder(testOrder);
	
	System.out.println("hi" + null);
	}
}
