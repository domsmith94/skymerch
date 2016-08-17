package skymerch.servlets;



import java.io.IOException;
import java.util.SortedSet;
import java.util.TreeSet;


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
import skymerch.enums.Status;

/**
 * Servlet implementation class WHOrderHistory
 */
@WebServlet({"/wh-order-history", "/wh-orders-refined"})
public class WHOrderHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public WHOrderHistory() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		String path = request.getServletPath();


		response.getWriter().append("Served at: ").append(request.getContextPath());
		ServletContext sc = this.getServletContext();
		OrderDAO odao = (OrderDAO)sc.getAttribute("order_dao"); //new OrderDAO();

		if (path.equals("/wh-order-history")) {		
			session.setAttribute("allOrders", odao.getAllOrders());
			rd = this.getServletContext().getRequestDispatcher("/wh-order-history.jsp");
		}

		if (path.equals("/wh-orders-refined")) {
			String status = request.getParameter("status");
			System.out.println(status + "LOOOOOOOOOOOOOOOK");
			SortedSet<Order> orders = odao.findByStatus(Status.valueOf(status));
			session.setAttribute("refinedOrders", orders);

			rd = this.getServletContext().getRequestDispatcher("/wh-orders-refined.jsp");
		}

		//else {

		//}

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
