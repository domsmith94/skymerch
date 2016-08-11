package skymerch.entities;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class AddressValidator {

	//class method validate 
	public static boolean validate(Address a){
		boolean valid = false;
		if(nameNumCheck(a) && lineOneCheck(a) && lineTwoCheck(a) && townCityCheck(a) && postcodeCheck(a)){
			valid = true;
		}
		return valid;
	}

	//checks house name/number for null and suitable length
	private static boolean nameNumCheck(Address a){
		if(a.getHouseNameNum()!=null){
			return(a.getHouseNameNum().length()>0 && a.getHouseNameNum().length()<=50);
		}
		else{
			return false;
		}
	}

	//checks line one for null and length
	private static boolean lineOneCheck(Address a){
		if (a.getAddressLineOne()!=null){
			return (a.getAddressLineOne().length()>0 && a.getAddressLineOne().length()<=50);
		}
		else{
			return false;
		}
	}

	//checks line two for length n.b. allowed to be empty String
	private static boolean lineTwoCheck(Address a){
		if (a.getAddressLineTwo()!=null){
			return (a.getAddressLineTwo().length()<=50);
		}
		else{
			return true;
		}
	}

	//checks town/city for null and length
	private static boolean townCityCheck(Address a){
		if (a.getTownOrCity()!=null){
			return(a.getTownOrCity().length()>0 && a.getTownOrCity().length()<=30);
		}
		else{
			return false;
		}
	}


	// checks postcode using UK govt supplied regex 
	private static boolean postcodeCheck(Address a){
		boolean valid = false;
		Pattern p = Pattern.compile("(GIR 0AA)|((([A-Z-[QVX]][0-9][0-9]?)|(([A-Z-[QVX]][A-Z-[IJZ]][0-9][0-9]?)|(([A-Z-[QVX]][0-9][A-HJKPSTUW])|([A-Z-[QVX]][A-Z-[IJZ]][0-9][ABEHMNPRVWXY])))) [0-9][A-Z-[CIKMOV]]{2})");
		Matcher m = p.matcher(a.getPostcode());		
		valid = m.matches();
		return valid;		
	}

}
