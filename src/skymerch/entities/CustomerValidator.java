package skymerch.entities;

public class CustomerValidator {
	
	public static boolean isValid(Customer c){
		
		boolean valid = false;
		if (c.getFirstName().length()>0 && c.getFirstName().length()<=30){
			if (c.getLastName().length()>0 && c.getFirstName().length()<=30){
				if(c.getEmail().contains("@")){  // this must be improved
				valid = true;
		}
		}
		}
		else {valid = false;}
		return valid;
	}
}
		
	
	
