package skymerch.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import skymerch.dao.*;
import skymerch.entities.*;

/**
 * Servlet implementation class SignIn
 */
@WebServlet("/sign-in")
public class SignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignIn() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		
		System.out.println("Received GET request on /sign-in route");
		System.out.println("Serving static sign-in.html page to user");
		
		// check if already logged in. if logged in, send to browse (no need to log in again).
		// if not logged in or test fails, send to sign-in
		try{
			
			boolean auth = (boolean) session.getAttribute("auth");
			if (auth){
				rd = this.getServletContext().getRequestDispatcher("/index.html");
				
			} else {
				rd = this.getServletContext().getRequestDispatcher("/sign-in.jsp");
			}
			
		} catch (Exception e){
			
			rd = this.getServletContext().getRequestDispatcher("/sign-in.jsp");
			
		}
		
		
		rd.forward(request, response);
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// signin is POST so this is what happens when a user signs in.
		
		//doGet(request, response);
		
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		
		boolean loginSuccess = false;
		boolean wrongPass = false;
		
		// here we will have checks for whether their details are okay.
		
		String email = request.getParameter("email");
		CustomerDAO cdao = new CustomerDAO();
		Customer customer = cdao.findByEmail(email);
		
		if(customer != null){	
			String pass = request.getParameter("password");
			String hashed = customer.getPassword();
			System.out.println(hashed);
			if (BCrypt.checkpw(pass, hashed)) {
				System.out.println("Passwords Match");
				loginSuccess = true;
				session.setAttribute("signedInUser", customer);
				session.setAttribute("auth", true);
				session.setAttribute("invalidLogin", null);
			} else {
				wrongPass = true;
				session.setAttribute("invalidLogin", true);
			}
		}
		
		// 
		if (loginSuccess){
		rd = this.getServletContext().getRequestDispatcher("/index.html");
		rd.forward(request, response);
		} else if (wrongPass){
			response.sendRedirect("/skymerch/sign-in");
		} else {
			rd = this.getServletContext().getRequestDispatcher("/sign-up");
			rd.forward(request, response);
		}
	}

}
