package skymerch.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import skymerch.dao.CustomerDAO;
import skymerch.entities.*;
import skymerch.enums.Title;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/sign-up")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignUp() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * Get request route for /sign-up request is here. This is very simple.
		 * The servelet listens for GET requests on /sign-up and when one comes in
		 * the response is the static /sign-up.html page which is editable/viewable from
		 * the WebContent directory.
		 */

		RequestDispatcher rd = null;
		String urlPattern = request.getServletPath();
		HttpSession session = request.getSession();

		System.out.println("Received GET request on /sign-up route");
		System.out.println("Serving static sign-up.html page to user");
		rd = this.getServletContext().getRequestDispatcher("/sign-up.jsp");

		rd.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO The post request on SignUp will be used when a user submits sign up details
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();

		boolean registerSuccess = false;

		// here we will have for whether their details are okay.

		Customer customer = new Customer();
		Address addr = new Address();

		String title = request.getParameter("title");
		customer.setTitle(Title.valueOf(title.toUpperCase()));
		customer.setFirstName(request.getParameter("firstName"));
		customer.setLastName(request.getParameter("lastName"));
		customer.setEmail(request.getParameter("email"));
		customer.hashPassword(request.getParameter("password"));
		String confirmPassword = request.getParameter("confirmPassword");
		addr.setHouseNameNum(request.getParameter("houseNum"));
		addr.setAddressLineOne(request.getParameter("firstAddr"));
		addr.setAddressLineTwo(request.getParameter("secondAddr"));
		addr.setTownOrCity(request.getParameter("townCity"));
		addr.setPostcode(request.getParameter("postcode"));
		customer.setAddress(addr);
		
		boolean passMatch = (PasswordValidator.validate(request.getParameter("password")) &&
				confirmPassword.equals(request.getParameter("password")));

		if(passMatch && CustomerValidator.validate(customer)) {
			CustomerDAO custDAO = new CustomerDAO();
			custDAO.addCustomer(customer);
			System.out.println(registerSuccess);
			registerSuccess = true;
			System.out.println(registerSuccess);
			session.setAttribute("signedInUser", customer);
			session.setAttribute("auth", true);
			session.setAttribute("invalidLogin", null);
		}

		if (registerSuccess) {
			rd = request.getServletContext().getRequestDispatcher("/browse");
		} else {
			rd = request.getServletContext().getRequestDispatcher("/sign-up");
		}
		rd.forward(request, response);
	}
}
