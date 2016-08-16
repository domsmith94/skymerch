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

import java.util.*;
import skymerch.entities.Product;
import skymerch.dao.ProductDAO;

/**
 * Servlet implementation class search
 */
@WebServlet({"/search_results"})
public class search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		//String urlPattern = request.getServletPath();
		//HttpSession session = request.getSession();
		rd = this.getServletContext().getRequestDispatcher("/search_results");
		rd.forward(request, response);		
		
		
		// default stuff //response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		String path = request.getServletPath();
		
				
		
			String q = request.getParameter("searchString");
			System.out.println(q);
			ServletContext sc = this.getServletContext();
			ProductDAO pdao = (ProductDAO)sc.getAttribute("product_dao");//new ProductDAO();
			List<Product> searchResults = pdao.multiSearch(q, null, null);
			session.setAttribute("resultsToDisplay", searchResults);
			session.setAttribute("searchString", q);
			rd = this.getServletContext().getRequestDispatcher("/search_results.jsp");
		
		
		rd.forward(request, response);
		doGet(request, response);
	}

}
