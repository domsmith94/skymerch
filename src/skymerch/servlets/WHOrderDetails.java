package skymerch.servlets;

import java.io.IOException;

import javax.persistence.criteria.Order;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import skymerch.dao.CustomerDAO;
import skymerch.dao.OrderDAO;
import skymerch.dao.ProductDAO;
import skymerch.entities.Address;
import skymerch.entities.Customer;
import skymerch.entities.Product;

/**
 * Servlet implementation class WHOrderDetails
 */
@WebServlet("/wh-order-view")
public class WHOrderDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WHOrderDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		
		HttpSession session = request.getSession();
		String formToDisplay = request.getServletPath();
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		ServletContext sc = this.getServletContext();
		OrderDAO odao = (OrderDAO) sc.getAttribute("order_dao"); 
		CustomerDAO cdao = (CustomerDAO) sc.getAttribute("customer_dao");
		
		
		if (formToDisplay.equals("/wh-order-view")){
			
			int id = Integer.parseInt(request.getParameter("id"));
			session.setAttribute("id", id);
						
			skymerch.entities.Order order = odao.findById(id);
			session.setAttribute("order", order);
			Address address = order.getDeliveryAddress();
			session.setAttribute("address", address);
			Customer customer = cdao.findById(order.getCustomerId());
			session.setAttribute("customer", customer);
			
			
			rd = this.getServletContext().getRequestDispatcher("/wh-order-view.jsp");
		}
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
