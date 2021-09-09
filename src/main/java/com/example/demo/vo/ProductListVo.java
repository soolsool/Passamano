package com.example.demo.vo;

public class ProductListVo {
	private int categoryNo;
	private String mainCategory;
	private String subCategory;
	private String imageName;
	private int productNo;
	private String productName;
	private int productPrice;
	private String productContent;
	private int productState;
	private String sellerCompany;
	private String sellerCeo;
	private int zzim;
	private int countSearch;
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getMainCategory() {
		return mainCategory;
	}
	public void setMainCategory(String mainCategory) {
		this.mainCategory = mainCategory;
	}
	public String getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
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
	public int getProductState() {
		return productState;
	}
	public void setProductState(int productState) {
		this.productState = productState;
	}
	public String getSellerCompany() {
		return sellerCompany;
	}
	public void setSellerCompany(String sellerCompany) {
		this.sellerCompany = sellerCompany;
	}
	public String getSellerCeo() {
		return sellerCeo;
	}
	public void setSellerCeo(String sellerCeo) {
		this.sellerCeo = sellerCeo;
	}
	public int getZzim() {
		return zzim;
	}
	public void setZzim(int zzim) {
		this.zzim = zzim;
	}
	
	public int getCountSearch() {
		return countSearch;
	}
	public void setCountSearch(int countSearch) {
		this.countSearch = countSearch;
	}
	
	public ProductListVo(int categoryNo, String mainCategory, String subCategory, String imageName, int productNo,
			String productName, int productPrice, String productContent, int productState, String sellerCompany,
			String sellerCeo, int zzim, int countSearch) {
		super();
		this.categoryNo = categoryNo;
		this.mainCategory = mainCategory;
		this.subCategory = subCategory;
		this.imageName = imageName;
		this.productNo = productNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productContent = productContent;
		this.productState = productState;
		this.sellerCompany = sellerCompany;
		this.sellerCeo = sellerCeo;
		this.zzim = zzim;
		this.countSearch = countSearch;
	}
	public ProductListVo() {
		super();
		// TODO Auto-generated constructor stub
	}
}