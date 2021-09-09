package com.example.demo.vo;

import java.util.Date;

public class ProductsVo {
	private int productNo;
	private int categoryNo;
	private String productName;
	private int productPrice;
	private String productContent;
	private Date productDate;
	private int productQty;
	private int productCnt;
	private int productState;
	private int sellerNo;
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductContent() {
		return productContent;
	}
	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}
	public Date getProductDate() {
		return productDate;
	}
	public void setProductDate(Date productDate) {
		this.productDate = productDate;
	}
	public int getProductQty() {
		return productQty;
	}
	public void setProductQty(int productQty) {
		this.productQty = productQty;
	}
	public int getProductCnt() {
		return productCnt;
	}
	public void setProductCnt(int productCnt) {
		this.productCnt = productCnt;
	}
	public int getProductState() {
		return productState;
	}
	public void setProductState(int productState) {
		this.productState = productState;
	}
	public int getSellerNo() {
		return sellerNo;
	}
	public void setSellerNo(int sellerNo) {
		this.sellerNo = sellerNo;
	}
	public ProductsVo(int productNo, int categoryNo, String productName, int productPrice, String productContent,
			Date productDate, int productQty, int productCnt, int productState, int sellerNo) {
		super();
		this.productNo = productNo;
		this.categoryNo = categoryNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productContent = productContent;
		this.productDate = productDate;
		this.productQty = productQty;
		this.productCnt = productCnt;
		this.productState = productState;
		this.sellerNo = sellerNo;
	}
	public ProductsVo() {
		super();
		// TODO Auto-generated constructor stub
	}
}
