package com.example.demo.vo;

public class SelectBasketVo {
	private String productName;
	private int productPrice;
	private int basketQty;
	private String imageName;
	private int productNo;
	private int detailPrice;
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
	public int getBasketQty() {
		return basketQty;
	}
	public void setBasketQty(int basketQty) {
		this.basketQty = basketQty;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getDetailPrice() {
		return detailPrice;
	}
	public void setDetailPrice(int detailPrice) {
		this.detailPrice = detailPrice;
	}
	public SelectBasketVo(String productName, int productPrice, int basketQty, String imageName, int productNo,
			int detailPrice) {
		super();
		this.productName = productName;
		this.productPrice = productPrice;
		this.basketQty = basketQty;
		this.imageName = imageName;
		this.productNo = productNo;
		this.detailPrice = detailPrice;
	}
	public SelectBasketVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	
	
}
