package com.example.demo.vo;

import java.sql.Date;

public class SelectUserDetailVo {
	private int userNo;
	private String id;
	private String pwd;
	private String name;
	private String phone;
	private String eMail;
	private String nickName;
	private String profileFileName;
	private Date insertDate;
	private int grantNo;
	private int addressNo;
	private String address1;
	private String address2;
	private String address3;
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String geteMail() {
		return eMail;
	}
	public void seteMail(String eMail) {
		this.eMail = eMail;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getProfileFileName() {
		return profileFileName;
	}
	public void setProfileFileName(String profileFileName) {
		this.profileFileName = profileFileName;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public int getGrantNo() {
		return grantNo;
	}
	public void setGrantNo(int grantNo) {
		this.grantNo = grantNo;
	}
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
	public SelectUserDetailVo(int userNo, String id, String pwd, String name, String phone, String eMail,
			String nickName, String profileFileName, Date insertDate, int grantNo, int addressNo, String address1,
			String address2, String address3) {
		super();
		this.userNo = userNo;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.phone = phone;
		this.eMail = eMail;
		this.nickName = nickName;
		this.profileFileName = profileFileName;
		this.insertDate = insertDate;
		this.grantNo = grantNo;
		this.addressNo = addressNo;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
	}
	public SelectUserDetailVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
