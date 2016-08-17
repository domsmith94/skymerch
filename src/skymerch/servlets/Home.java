package skymerch.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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

import skymerch.dao.ProductDAO;
import skymerch.entities.Product;

/**
 * Servlet implementation class Home
 */
@WebServlet({"/index.html","/home"})
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Home() {
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
		
		ServletContext sc = this.getServletContext();
		ProductDAO pdao = (ProductDAO)sc.getAttribute("product_dao");
		List<Product> allProducts = pdao.readAll();
		SortedSet<Product> orderedProducts = new TreeSet<Product>();
		for (Product p : allProducts) {
			orderedProducts.add(p);
			System.out.println("Name - " + p.getProdName());
			System.out.println("Rating - " + p.getRating());
		}
		for (Product p : orderedProducts) { 
			System.out.println(p.getDetails());
		 	
			}
		session.setAttribute("orderedProducts", orderedProducts);
		session.setAttribute("allProducts", allProducts);	
		System.out.println("Received GET request on /sign-in route");
		System.out.println("Size of product list " + allProducts.size());
		rd = this.getServletContext().getRequestDispatcher("/Home.jsp");
		
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
