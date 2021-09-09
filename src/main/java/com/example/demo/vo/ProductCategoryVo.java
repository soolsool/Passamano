package com.example.demo.vo;

public class ProductCategoryVo {
	
	private int categoryNo;
	private String categoryName;
	private int categoryRef;
	private int categoryLevel;
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getCategoryRef() {
		return categoryRef;
	}
	public void setCategoryRef(int categoryRef) {
		this.categoryRef = categoryRef;
	}
	public int getCategoryLevel() {
		return categoryLevel;
	}
	public void setCategoryLevel(int categoryLevel) {
		this.categoryLevel = categoryLevel;
	}
	public ProductCategoryVo(int categoryNo, String categoryName, int categoryRef, int categoryLevel) {
		super();
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.categoryRef = categoryRef;
		this.categoryLevel = categoryLevel;
	}
	public ProductCategoryVo() {
		super();
		// TODO Auto-generated constructor stub
	}
}