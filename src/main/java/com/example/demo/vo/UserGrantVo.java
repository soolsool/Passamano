package com.example.demo.vo;

public class UserGrantVo {
	private int grantNo;
	private String grantName;
	public int getGrantNo() {
		return grantNo;
	}
	public void setGrantNo(int grantNo) {
		this.grantNo = grantNo;
	}
	public String getGrantName() {
		return grantName;
	}
	public void setGrantName(String grantName) {
		this.grantName = grantName;
	}
	public UserGrantVo(int grantNo, String grantName) {
		super();
		this.grantNo = grantNo;
		this.grantName = grantName;
	}
	public UserGrantVo() {
		super();
		// TODO Auto-generated constructor stub
	}
}