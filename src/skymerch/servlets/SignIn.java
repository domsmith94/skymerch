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
@WebServlet({"/sign-in","/loginCheck"})
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
		String urlPattern = request.getServletPath();
		HttpSession session = request.getSession();
		
		System.out.println("Received GET request on /sign-in route");
		System.out.println("Serving static sign-in.html page to user");
		rd = this.getServletContext().getRequestDispatcher("/sign-in.html");
		
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
		String urlPattern = request.getServletPath();
		HttpSession session = request.getSession();
		
		boolean loginSuccess = false;
		
		// here we will have checks for whether their details are okay.
		
		String email = request.getParameter("email");
		CustomerDAO cdao = new CustomerDAO();
		Customer customer = new Customer();
		
		
		customer = cdao.findByEmail(email);
		
		if(customer != null){
			
			String pass = request.getParameter("password");
			String hashed = customer.getPassword();
			if (BCrypt.checkpw(pass, hashed)) {
				System.out.println("Passwords Match");
				loginSuccess = true;
				session.setAttribute("signedin_customer", customer);
			} 
		}
		
		// 
		if (loginSuccess==true){
		rd = this.getServletContext().getRequestDispatcher("/browse");
		} else if (loginSuccess==false){
			rd = this.getServletContext().getRequestDispatcher("/sign-up");
		}
		
		
		
		rd.forward(request, response);
	}

}
