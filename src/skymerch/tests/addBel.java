package skymerch.tests;

	import skymerch.enums.*;

	import skymerch.dao.CustomerDAO;
	import skymerch.entities.*;

	public class addBel {
		
		public static void main(String[] args) {
			CustomerDAO cdao = new CustomerDAO();
						
			// Initialise test customer
			Customer bel = new Customer();
			bel.setFirstName("Isobel");
			bel.setLastName("Forbes");
			bel.setTitle(Title.valueOf("MS"));
			bel.setEmail("belbel@cutemail.com");
			bel.hashPassword("iloveD4da");
			Address belsAddr = new Address();
			belsAddr.setHouseNameNum("2/4");
			belsAddr.setAddressLineOne("Great Michael Rise");
			belsAddr.setAddressLineTwo("Newhaven");
			belsAddr.setTownOrCity("Edinburgh");
			belsAddr.setPostcode("EH6 4JB");
			bel.setAddress(belsAddr);
			System.out.println("Validation result: " + CustomerValidator.validate(bel));
			cdao.addCustomer(bel);
}
}