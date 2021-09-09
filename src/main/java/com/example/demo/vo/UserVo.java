package com.example.demo.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class UserVo {
	private int userNo;
	private String id;
	private String pwd;
	private String name;
	private String phone;
	private String email;
	private String nickName;
	private String profileFilename;
	private Date insertDate;
	private int grantNo;
	private MultipartFile uploadFile;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getProfileFilename() {
		return profileFilename;
	}
	public void setProfileFilename(String profileFilename) {
		this.profileFilename = profileFilename;
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
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public UserVo(int userNo, String id, String pwd, String name, String phone, String email, String nickName,
			String profileFilename, Date insertDate, int grantNo) {
		super();
		this.userNo = userNo;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.nickName = nickName;
		this.profileFilename = profileFilename;
		this.insertDate = insertDate;
		this.grantNo = grantNo;
	}
	public UserVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}