package myServlet;

import com.sky.database.stuff.*;

import java.io.IOException;
import java.util.List.*;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class listSalesperson
 */
@WebServlet({"/submitBugReportText","/byebye"})
public class ListSalesperson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListSalesperson() {
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
		
		if (formToDisplay.equals("/submitBugReportText")){
			// we'll put data in the session here...
			String userName = request.getParameter("userName");
			session.setAttribute("userName", userName);
			String betterWebsite = request.getParameter("betterWebsite");
			session.setAttribute("betterWebsite", betterWebsite);
			String reasonWhy = request.getParameter("reasonWhy");
			session.setAttribute("reasonWhy", reasonWhy);
			
			SalespersonDAO dao = new SalespersonDAO();
			List<Salesperson> allSalespersons = dao.readAll();
			
			Integer i=0;
			for (Salesperson person: allSalespersons){ i++; }
			
			session.setAttribute("salespeople", allSalespersons);
			session.setAttribute("i", i);
			
			rd = this.getServletContext().getRequestDispatcher("/ListSalesPerson.jsp");
		}	else if (formToDisplay.equals("/byebye")){
			// show basic bye page
			rd = this.getServletContext().getRequestDispatcher("/MyNewFile2.html");
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
