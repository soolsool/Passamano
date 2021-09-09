package com.example.demo.vo;

import java.sql.Date;

public class ManageUserVo {
	private int userManageNo;
	private Date userManageDate;
	private String userManageReason;
	private int userNo;
	public int getUserManageNo() {
		return userManageNo;
	}
	public void setUserManageNo(int userManageNo) {
		this.userManageNo = userManageNo;
	}
	public Date getUserManageDate() {
		return userManageDate;
	}
	public void setUserManageDate(Date userManageDate) {
		this.userManageDate = userManageDate;
	}
	public String getUserManageReason() {
		return userManageReason;
	}
	public void setUserManageReason(String userManageReason) {
		this.userManageReason = userManageReason;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public ManageUserVo(int userManageNo, Date userManageDate, String userManageReason, int userNo) {
		super();
		this.userManageNo = userManageNo;
		this.userManageDate = userManageDate;
		this.userManageReason = userManageReason;
		this.userNo = userNo;
	}
	public ManageUserVo() {
		super();
		// TODO Auto-generated constructor stub
	}
}