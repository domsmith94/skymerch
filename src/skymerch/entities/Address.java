package skymerch.entities;

public class Address {
	
	private String houseNameNum;
	private String addressLineOne;
	private String addressLineTwo;
	private String townOrCity;
	private String region;
	private String postcode;
	
	public Address(){
		
	}
	
	public String getHouseNameNum() { return this.houseNameNum; }
	
	public void setHouseNameNum(String houseNameNum) { this.houseNameNum = houseNameNum; }
	
	public String getAddressLineOne() { return this.addressLineOne; }
	
	public void setAddressLineOne(String addressLineOne) { this.addressLineOne = addressLineOne; }

	public String getAddressLineTwo() { return addressLineTwo; }

	public void setAddressLineTwo(String addressLineTwo) { 
		if(addressLineTwo == null){
			addressLineTwo = "";
		}
		this.addressLineTwo = addressLineTwo; }

	public String getTownOrCity() { return this.townOrCity; }

	public void setTownOrCity(String townOrCity) { this.townOrCity = townOrCity; }
	
	public String getRegion() { return this.region; }

	public void setRegion(String region) { this.region = region; }

	public String getPostcode() { return postcode; }

	public void setPostcode(String postcode) { this.postcode = postcode; }

	

}
