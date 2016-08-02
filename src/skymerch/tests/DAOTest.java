package skymerch.tests;

import skymerch.entities.Address;
import skymerch.enums.*;
import skymerch.entities.Customer;
import skymerch.entities.CustomerDAO;

public class DAOTest {
	
	public static void main(String[] args) {
		CustomerDAO dao = new CustomerDAO();
		Customer bel = new Customer();
		bel.setFirstName("Isobel");
		bel.setLastName("Forbes");
		bel.setTitle(Title.MS);
		bel.setEmail("belbel@cutemail.com");
		bel.setPassword("iloveD4da");
		Address belsAddr = new Address();
		belsAddr.setHouseNameNum("2/4");
		belsAddr.setAddressLineOne("Great Michael Rise");
		belsAddr.setAddressLineTwo("Newhaven");
		belsAddr.setRegion("Edinburgh");
		belsAddr.setCountry("Scotland");
		belsAddr.setPostcode("EH6 4JB");
		bel.setAddress(belsAddr);
		dao.addCustomer(bel);
		//dao.addCustomer(new Customer());
		Customer customer = dao.findByEmail("adam.morrison@sky.uk");
		System.out.println(customer.getFirstName());
		
		
	}

}
