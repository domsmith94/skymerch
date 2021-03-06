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
import skymerch.entities.Order;

/**
 * Servlet implementation class OrderConfirmation
 */
@WebServlet("/confirmation")
public class OrderConfirmation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderConfirmation() {
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
			int orderId = (int) session.getAttribute("orderId");
			
			ServletContext sc = this.getServletContext();
			OrderDAO odao = (OrderDAO)sc.getAttribute("order_dao"); //new OrderDAO();
			Order lastOrder = odao.getOrderById(orderId);
			session.setAttribute("lastOrder", lastOrder);
			
			rd = this.getServletContext().getRequestDispatcher("/confirmation.jsp");
			rd.forward(request, response);
			
		} catch (Exception e) {
			rd = this.getServletContext().getRequestDispatcher("/browse");
			rd.forward(request, response);
			
		}

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
