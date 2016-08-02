package skymerch.entities;

public class Address {
	
	private String houseNameNum;
	private String addressLineOne;
	private String addressLineTwo;
	private String region;
	private String postcode;
	private String country;
	
	public Address(){
		
	}
	
	public String getHouseNameNum() { return this.houseNameNum; }
	
	public void setHouseNameNum(String houseNameNum) { this.houseNameNum = houseNameNum; }
	
	public String getAddressLineOne() { return this.addressLineOne; }
	
	public void setAddressLineOne(String addressLineOne) { this.addressLineOne = addressLineOne; }

	public String getAddressLineTwo() { return addressLineTwo; }

	public void setAddressLineTwo(String addressLineTwo) { this.addressLineTwo = addressLineTwo; }

	public String getRegion() { return region; }

	public void setRegion(String region) { this.region = region; }

	public String getPostcode() { return postcode; }

	public void setPostcode(String postcode) { this.postcode = postcode; }

	public String getCountry() { return country; }

	public void setCountry(String country) { this.country = country; }
	

}
