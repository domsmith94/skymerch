package skymerch.servlets;

import java.awt.List;
import java.io.IOException;
import java.util.List.*;
import java.util.ArrayList;

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
 * Servlet implementation class WHOrderHistory
 */
@WebServlet("/wh-order-history")
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
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		ServletContext sc = this.getServletContext();
		OrderDAO odao = (OrderDAO)sc.getAttribute("order_dao"); //new OrderDAO();
		session.setAttribute("allOrders", odao.getAllOrders());
		
		rd = this.getServletContext().getRequestDispatcher("/wh-order-history.jsp");
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
