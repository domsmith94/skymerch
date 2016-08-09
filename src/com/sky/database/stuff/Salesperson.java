package com.sky.database.stuff;

public class Salesperson {
	private int employeeNumber;
	private String firstName;
	private String lastName;
	
	public Salesperson(int e, String f, String l){
		this.employeeNumber = e;
		this.firstName = f;
		this.lastName = l;
	}
	
	public int getEmployeeNumber() {
		return employeeNumber;
	}
	public void setEmployeeNumber(int employeeNumber) {
		this.employeeNumber = employeeNumber;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	
}
