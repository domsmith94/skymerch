package skymerch.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import skymerch.dao.OrderDAO;
import skymerch.entities.*;
import skymerch.enums.*;

/**
 * Servlet implementation class Orders
 */
@WebServlet({"/orders","/validateOrder"})
public class Orders extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Orders() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		String urlPattern = request.getServletPath();
		HttpSession session = request.getSession();
		
		try {
			boolean auth;
			
			if (null == session.getAttribute("auth")){
				auth = false;
			} else {
				auth = true;
			}
						
			if (auth){
				rd = request.getRequestDispatcher("/order_history.html");
				rd.forward(request, response);
				
			} else {
				response.sendRedirect("/skymerch");
			}
			
		} catch (Exception e) {
			
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		
		// WORKING HERE
		RequestDispatcher rd = null;
		String urlPattern = request.getServletPath();
		HttpSession session = request.getSession();
		
		Address addr = new Address();
		addr.setHouseNameNum(request.getParameter("houseNumber"));
		addr.setAddressLineOne(request.getParameter("firstLine"));
		addr.setAddressLineTwo(request.getParameter("secondLine"));
		addr.setTownOrCity(request.getParameter("townOrCity"));
		addr.setPostcode(request.getParameter("postcode"));
		
		Customer customer = (Customer)session.getAttribute("signedInUser");
		// is it customer ID that's breaking the whole thing? possibly - there's certainly weird things happening!
		
		
		Basket basket = (Basket)session.getAttribute("basket");
		
		Double orderPrice = Double.parseDouble(request.getParameter("orderPrice"));
		Shipping shipping = Shipping.STANDARD;
		try{
			shipping = Shipping.valueOf(request.getParameter("shippingChoice")); 
		} catch (Exception e){
			//shipping = Shipping.STANDARD;
		}
		
		try{
			
			Order proposedOrder = new Order(customer, basket, orderPrice, addr, shipping);
			boolean orderValid = OrderValidator.validate(proposedOrder); //OrderValidator.lineArrayCheck(proposedOrder) && OrderValidator.validCustomer(proposedOrder) && OrderValidator.validDate(proposedOrder) && OrderValidator.validShippingType(proposedOrder) && OrderValidator.validStatus(proposedOrder) && OrderValidator.totalPriceCheck(proposedOrder);
			
			if (orderValid){
				ServletContext sc = this.getServletContext();
				OrderDAO odao = (OrderDAO)sc.getAttribute("order_dao"); //new OrderDAO();
				int orderId = odao.addOrder(proposedOrder);
				session.setAttribute("orderId", orderId);
				session.removeAttribute("basket");
				rd = request.getRequestDispatcher("/confirmation");
			} else{
				rd = request.getRequestDispatcher("/home");
			}
			
		
		} catch(Exception e){
			e.printStackTrace();
			rd = request.getRequestDispatcher("/basket");
		}
		
		
		rd.forward(request, response);
		
	}

}
