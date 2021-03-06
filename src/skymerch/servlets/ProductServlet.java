package skymerch.servlets;

//import com.sky.database.stuff.*;
import skymerch.dao.ProductDAO;
import skymerch.entities.Product;

import java.io.IOException;
//import java.util.List.*;
//import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class listSalesperson
 */
@WebServlet({"/submitBugReportText","/byebye","/product"})
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = null;
		
		HttpSession session = request.getSession();
		
		String formToDisplay = request.getServletPath();
		/*
		if (formToDisplay.equals("/byebye")){
			// show basic bye page
			rd = this.getServletContext().getRequestDispatcher("/MyNewFile2.html");
		}	else if (formToDisplay.equals("/browse")){
			/*SalespersonDAO dao = new SalespersonDAO();
			List<Salesperson> allSalespersons = dao.readAll();
			session.setAttribute("salespeople", allSalespersons);
			
			ProductDAO pdao = new ProductDAO();
			List<Product> products = new ArrayList<Product>();
			products = pdao.readAll();
			session.setAttribute("product_list", products);
			
			
			rd = this.getServletContext().getRequestDispatcher("filtered_results.jsp");
			*/
		if (formToDisplay.equals("/product")){
			
			int id = Integer.parseInt(request.getParameter("id"));
			session.setAttribute("id", id);
			
			ServletContext sc = this.getServletContext();
			ProductDAO pdao = (ProductDAO)sc.getAttribute("product_dao");//new ProductDAO();
			Product product = new Product();
			product = pdao.findById(id);
			
			
			session.setAttribute("product", product);
			
			
			
			rd = this.getServletContext().getRequestDispatcher("/DisplayProductDetails.jsp");
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
