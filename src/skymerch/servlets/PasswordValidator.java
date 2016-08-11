package skymerch.servlets;

import skymerch.entities.Customer;

public class PasswordValidator {
	public static boolean validate(String pass) {
		boolean valid = false;
		if(pass!=null){
			if (pass.length() > 5 && pass.length() < 26) {
				if (pass.matches(".*\\d+.*") && !pass.toLowerCase().equals(pass)) {
					valid = true;
				}
			}
		}
		return valid;
	}
}
