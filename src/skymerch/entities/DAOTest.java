package skymerch.entities;

public class DAOTest {
	
	public static void main(String[] args) {
		CustomerDAO dao = new CustomerDAO();
		//dao.addCustomer(new Customer());
		Customer customer = dao.findByEmail("adam.morrison@sky.uk");
		System.out.println(customer.getFirstName());
		
		
	}

}
