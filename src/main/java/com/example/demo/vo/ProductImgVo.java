package com.example.demo.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ProductImgVo {
	
	private int imageNo;
	private int productNo;
	private String imageName;
	private int imageSize;
	private String thumbNail; 
	private Date imageDate;
	private MultipartFile uploadFile;
	public int getImageNo() {
		return imageNo;
	}
	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
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
	public String getThumbNail() {
		return thumbNail;
	}
	public void setThumbNail(String thumbNail) {
		this.thumbNail = thumbNail;
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
	public ProductImgVo(int imageNo, int productNo, String imageName, int imageSize, String thumbNail, Date imageDate) {
		super();
		this.imageNo = imageNo;
		this.productNo = productNo;
		this.imageName = imageName;
		this.imageSize = imageSize;
		this.thumbNail = thumbNail;
		this.imageDate = imageDate;
	}
	public ProductImgVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
