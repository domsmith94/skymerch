package skymerch.entities;

public class Customer {
	
	public enum Title{
		Mr., Mrs., Ms., Miss, Dr., Rev.
	}
	
	private int custId;
	private String firstName;
	private String middleInit;
	private String lastName;
	private Title title;
	private String email;
	private String telNum;
	private List<Address> addressBook = new ArrayList<>; 
	
	// PaymentDetails object
	// Date of Birth field?
	// Should we have an array of Orders?
			
	public void setFirstName(String n){
		this.firstName = n;
	}
	public String getFirstName (){
		return this.firstName;
	}
	public void setMiddleInit(String i){
		this.middleInit = i;
	}
	
	public String getMiddleInit (){
		return this.middleInit;
	}
	
	public void setLastName(String j){
		this.lastName = j;
			}
	public String getLastName (){
		this.lastName;
	}
	
	public void setEmail(String e){
		this.email = e;
	}
	
	public String getEmail(){
		return this.email;
	}
	
	public void setTelNum(String t){
		this.telNum = t;
	}
	
	public String getTelNum(){
		return this.telNum;
		
	}
	public void addAddress(Address a){
		this.addressBook.add(a);
	}
	
	public List<Address> getAddressBook(){
		return this.addressBook;
	}
	
	
	
	

}
