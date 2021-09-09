package com.example.demo.vo;

public class UserAddressVo {
	private int addressNo;
	private String address1;
	private String address2;
	private String address3;
	private int userNo;
	public int getAddressNo() {
		return addressNo;
	}
	public void setAddressNo(int addressNo) {
		this.addressNo = addressNo;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getAddress3() {
		return address3;
	}
	public void setAddress3(String address3) {
		this.address3 = address3;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public UserAddressVo(int addressNo, String address1, String address2, String address3, int userNo) {
		super();
		this.addressNo = addressNo;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.userNo = userNo;
	}
	public UserAddressVo() {
		super();
		// TODO Auto-generated constructor stub
	}
}