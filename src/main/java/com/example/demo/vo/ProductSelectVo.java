package com.example.demo.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ProductSelectVo {
	
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
	private int imageNo;
	private String imageName;
	private int imageSize;
	private Date imageDate;
	private MultipartFile uploadFile;
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
	public int getImageNo() {
		return imageNo;
	}
	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public int getImageSize() {
		return imageSize;
	}
	public void setImageSize(int imageSize) {
		this.imageSize = imageSize;
	}
	public Date getImageDate() {
		return imageDate;
	}
	public void setImageDate(Date imageDate) {
		this.imageDate = imageDate;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public ProductSelectVo(int productNo, int categoryNo, String productName, int productPrice, String productContent,
			Date productDate, int productQty, int productCnt, int productState, int sellerNo, int imageNo,
			String imageName, int imageSize, Date imageDate) {
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
		this.imageNo = imageNo;
		this.imageName = imageName;
		this.imageSize = imageSize;
		this.imageDate = imageDate;
	}
	public ProductSelectVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	
}
