package com.example.demo.vo;

import java.sql.Date;

public class ManageBoardVo {
	private int managerNo;
	private String managerTitle;
	private String managerContent;
	private Date managerDate;
	private int readRight;
	public int getManagerNo() {
		return managerNo;
	}
	public void setManagerNo(int managerNo) {
		this.managerNo = managerNo;
	}
	public String getManagerTitle() {
		return managerTitle;
	}
	public void setManagerTitle(String managerTitle) {
		this.managerTitle = managerTitle;
	}
	public String getManagerContent() {
		return managerContent;
	}
	public void setManagerContent(String managerContent) {
		this.managerContent = managerContent;
	}
	public Date getManagerDate() {
		return managerDate;
	}
	public void setManagerDate(Date managerDate) {
		this.managerDate = managerDate;
	}
	public int getReadRight() {
		return readRight;
	}
	public void setReadRight(int readRight) {
		this.readRight = readRight;
	}
	public ManageBoardVo(int managerNo, String managerTitle, String managerContent, Date managerDate, int readRight) {
		super();
		this.managerNo = managerNo;
		this.managerTitle = managerTitle;
		this.managerContent = managerContent;
		this.managerDate = managerDate;
		this.readRight = readRight;
	}
	public ManageBoardVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}