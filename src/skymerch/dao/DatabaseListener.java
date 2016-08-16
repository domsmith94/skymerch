package skymerch.dao;

import javax.servlet.*;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class DatabaseListener
 *
 */
@WebListener
public class DatabaseListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public DatabaseListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    	
    	
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    	// Perform web-app-level initialisation: attributes of the context are available to all parts
    	//(incl. all sessions) of the app
    	ServletContext sc = sce.getServletContext();
    	// here we set the required DBMS... for now, it is hard-coded to be MySQL
    	sc.setAttribute("dbmsName", "MySQL");
    	sc.setAttribute("customer_dao", new CustomerDAO());
    	sc.setAttribute("order_dao", new OrderDAO());
    	sc.setAttribute("product_dao", new ProductDAO());
    	
    	System.out.println("context initialisation routine invoked successfully");
    }
	
}
