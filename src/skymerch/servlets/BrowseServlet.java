package skymerch.servlets;


import java.io.IOException;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import skymerch.dao.ProductDAO;
import skymerch.entities.Product;
import skymerch.enums.Category;

/**
 * Servlet implementation class browse
 */
@WebServlet({"/browse", "/filtered_results"})
public class BrowseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BrowseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("*****LOOK AT THE DO GET");
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String path = request.getServletPath();
		System.out.println("*** LOOK AT THE PATH HERE " + path);
		
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		
		ProductDAO pdao = new ProductDAO();
		List<Product> allProducts = pdao.readAll();
		session.setAttribute("allProducts", allProducts);
		
		rd = this.getServletContext().getRequestDispatcher("/browse.jsp");
		rd.forward(request, response);		
			
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("******LOOK AT THE DO POST");
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		String path = request.getServletPath();
		System.out.println("*** LOOK AT THE PATH HERE " + path);
		ProductDAO pdao = new ProductDAO();
		
		if (path.equals("/browse")) {
			List<Product> allProducts = pdao.readAll();
			session.setAttribute("allProducts", allProducts);
			
		}
		
		if (path.equals("/filtered_results")){
		Set<Category> filterCats = null;
				
		if (request.getParameter("HOUSEHOLD") != null){
			if(filterCats == null){ filterCats = new TreeSet<>();}
			filterCats.add(Category.HOUSEHOLD);
		}
		if (request.getParameter("MEDIA") != null){
			if(filterCats == null){ filterCats = new TreeSet<>();}
			filterCats.add(Category.MEDIA); 
		}
		if (request.getParameter("ELECTRONICS") != null){
			if(filterCats == null){ filterCats = new TreeSet<>();}
			filterCats.add(Category.ELECTRONICS);
		}
		if (request.getParameter("CLOTHING") != null){
			if(filterCats == null){ filterCats = new TreeSet<>();}
			filterCats.add(Category.CLOTHING); 
		}
		if (request.getParameter("TOYS") != null){
			if(filterCats == null){ filterCats = new TreeSet<>();}
			filterCats.add(Category.TOYS);
		}
		String p = request.getParameter("optradio");
		System.out.println(p);
		
		Double min;
		Double max;
		
		if (p == null){
			min = 0.0;
			max = 10000000000.0;
			}
		else {
		String[] tokens = p.split("-");
		min = Double.valueOf(tokens[0]);
		max = Double.valueOf(tokens[1]);
		}		

		List<Product> searchResults = pdao.multiSearch(filterCats, min.toString(), max.toString());
		session.setAttribute("resultsToDisplay", searchResults);
		System.out.println(min.toString() + " " + max.toString() + " ");
		rd = this.getServletContext().getRequestDispatcher("/filtered_results.jsp");
		System.out.println(rd.toString());}
		
	
		
		
		rd.forward(request, response);
		//doGet(request, response);
		
		
	}

}
