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
import skymerch.dao.ProductDAO;
import skymerch.entities.*;

/**
 * Servlet implementation class Basket
 */
@WebServlet({"/basket", "/addToBasket", "/updateBasket"})
public class BasketManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BasketManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// serves the page showing list of basket items
		
		RequestDispatcher rd = null;
		String urlPattern = request.getServletPath();
		HttpSession session = request.getSession();
		
		rd = this.getServletContext().getRequestDispatcher("/basket.jsp");
		
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// adds product to basket based on id
		
		RequestDispatcher rd = null;
		String urlPattern = request.getServletPath();
		HttpSession session = request.getSession();
		
		String formToDisplay = request.getServletPath();
		
		if (formToDisplay.equals("/addToBasket")){
			// either get the existing basket or create a new one
			//Basket basket = new Basket();
			
			// get the product id from the page
					int id = Integer.parseInt(request.getParameter("id"));
					int quantity = Integer.parseInt(request.getParameter("quantity"));
					
			// get the product from id
					ServletContext sc = this.getServletContext();
					ProductDAO pdao = (ProductDAO)sc.getAttribute("product_dao");//new ProductDAO();
					Product idProd = pdao.findById(id);
			try{
				Basket basket = (Basket) session.getAttribute("basket");
				//basket = (Basket) session.getAttribute("basket");
				basket.addProductToBasket(idProd,quantity);
				session.setAttribute("basket", basket);
			} catch(Exception e){
				Basket basket = new Basket();
				//Basket basket = new Basket();
				//session.setAttribute("basket", basket);
				basket.addProductToBasket(idProd,quantity);
				session.setAttribute("basket", basket);
			}
			
			
		}	else if (formToDisplay.equals("/updateBasket")){
			
			Basket oldBasket = (Basket) session.getAttribute("basket");
			
			// for now, set the "proposed" basket as the old one.
			// carbon copy, NOT copy 
			Basket proposedBasket = new Basket();
			
			
			for (BasketLine b:oldBasket.getBasketLines()){
				
				int quantity = Integer.parseInt(request.getParameter("quantityProduct"+b.getProduct().getProdId()));
				
				if (quantity <1){
					// don't add this basket line.
				} else {
					// add this basket line.
					proposedBasket.addProductToBasket(b.getProduct(), quantity);
				}
				
			}
			
			session.setAttribute("basket", proposedBasket);
			
		}
		
		// send to basket page
		rd = this.getServletContext().getRequestDispatcher("/basket.jsp");
		
		rd.forward(request, response);
	}

}
