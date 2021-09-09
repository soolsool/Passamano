package com.example.demo.vo;

import java.util.Date;

public class ProductSalesVo {

	private String categoryName;
	private int tot;
	private int cnt;
	private int month;
	private Date orderManageDate;
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getTot() {
		return tot;
	}
	public void setTot(int tot) {
		this.tot = tot;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public Date getOrderManageDate() {
		return orderManageDate;
	}
	public void setOrderManageDate(Date orderManageDate) {
		this.orderManageDate = orderManageDate;
	}
	public ProductSalesVo(String categoryName, int tot, int cnt, int month, Date orderManageDate) {
		super();
		this.categoryName = categoryName;
		this.tot = tot;
		this.cnt = cnt;
		this.month = month;
		this.orderManageDate = orderManageDate;
	}
	public ProductSalesVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
