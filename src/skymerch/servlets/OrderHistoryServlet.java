package skymerch.servlets;

import java.io.IOException;
import java.util.List;
import java.util.SortedSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import skymerch.dao.OrderDAO;
import skymerch.dao.ProductDAO;
import skymerch.entities.Product;

/**
 * Servlet implementation class OrderHistoryServlet
 */
@WebServlet("/order_history")
public class OrderHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderHistoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		
		OrderDAO odao = new OrderDAO();
		int signedInId = (Integer) session.getAttribute("signedInId");
		//SortedSet<Product> orderHist = odao.getOrdersByCustId(signedInId);
		//session.setAttribute("orderHistory", orderHist);
		
		rd = this.getServletContext().getRequestDispatcher("/order_history.jsp");
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
