package skymerch.entities;

//import java.util.ArrayList;
//import java.util.List;
import skymerch.enums.*;

public class Customer {
	
	private int custId;
	private String firstName;
	private String lastName;
	private Title title;
	private String email;
	private String password;
	//private String telNum;	// removed
	private Address address;   //previously ArrayList<Address>, scope reduced to one address per customer
	
	// PaymentDetails object
	// Should we have an array of Orders?
	
	public void setCustId(int Id){		this.custId = Id; }
	
	public int getCustId(){				return this.custId; }
			
	public void setFirstName(String n){	this.firstName = n; }
	
	public String getFirstName (){		return this.firstName; }
		
	public void setLastName(String j){	this.lastName = j; }
	
	public String getLastName (){		return this.lastName; }
	
	public void setEmail(String e){ 	this.email = e;	}
	
	public String getEmail(){			return this.email; }
	
	public void setPassword(String p){	this.password = p }
	
	public String getPassword(){		return this.password; }
	
	//public void setTelNum(String t){	this.telNum = t; }
	
	//public String getTelNum(){		return this.telNum; }
	
	public void setAddress(Address a){	this.address = a; }
	
	public Address getAddress(){		return this.address; }
	
	/*//old methods for ArrayList of Address
	public void addAddress(Address a){	this.addressBook.add(a); }  
	
	public List<Address> getAddressBook(){return this.addressBook; }
	*/	
	
	//public boolean isValid(){			return CustomerValidator.validate(this); }		// shouldn't be done here
	
	

}
