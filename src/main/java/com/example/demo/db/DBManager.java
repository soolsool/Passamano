package com.example.demo.db;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.GetReviewVo;
import com.example.demo.vo.ProductCategoryVo;
import com.example.demo.vo.ProductImgVo;
import com.example.demo.vo.ProductListVo;
import com.example.demo.vo.ProductSalesVo;
import com.example.demo.vo.ProductSelectVo;
import com.example.demo.vo.ProductZzimVo;
import com.example.demo.vo.ProductsVo;
import com.example.demo.vo.ReviewVo;
import com.example.demo.vo.SelectBasketVo;
import com.example.demo.vo.SelectOrdersVo;
import com.example.demo.vo.SelectReviewVo;
import com.example.demo.vo.SelectUserDetailVo;
import com.example.demo.vo.SelectZzimVo;
import com.example.demo.vo.SellerVo;
import com.example.demo.vo.UserAddressVo;
import com.example.demo.vo.UserSellerVo;
import com.example.demo.vo.UserVo;

public class DBManager {
	private static SqlSessionFactory factory;
	
	static {
		try {
			Reader reader = Resources.getResourceAsReader("com/example/demo/db/dbConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//아이디나 별명 중복 확인 버튼 클릭시 동일한 데이터 있나 검색
	public static int doubleCheck(String col, String userInput) {
		SqlSession session = factory.openSession();
		HashMap map = new HashMap<>();
		map.put("col", col);
		map.put("userInput", userInput);
		int re = session.selectOne("manageMember.doubleCheck", map);
		session.close();
		return re;
	}
	
	//일반 회원가입시 Users, User_address 테이블에 데이터 입력
	public static int insertUser(UserVo user, UserAddressVo address) {
		SqlSession session = factory.openSession(true);
		HashMap map = new HashMap();
		map.put("user", user);
		map.put("address", address);
		int re = session.insert("manageMember.insertUser", map);
		session.commit();
		session.close();
		return re;
	}
	
	//판매자 회원가입시 Users, User_address, User_seller 테이블에 데이터 입력
	public static int insertSeller(UserVo user, UserAddressVo address, UserSellerVo seller) {
		SqlSession session = factory.openSession(true);
		HashMap map = new HashMap();
		map.put("user", user);
		map.put("address", address);
		map.put("seller", seller);
		int re = session.insert("manageMember.insertSeller",map);
		session.commit();
		session.close();
		return re;
	}
	
	//로그인
	public static boolean isMember(String id, String pwd) {
		SqlSession session = factory.openSession();
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("pwd", pwd);
		UserVo user = session.selectOne("manageMember.isMember", map);
		boolean result = false;
		
		if(user!=null)
			result = true;
		
		session.close();
		return result;
	}
	
	//로그인 성공시 아이디를 이용해 해당 회원의 UserVo를 검색 
	public static UserVo getMember(String id) {
		SqlSession session = factory.openSession();
		UserVo user = session.selectOne("manageMember.getMember", id);
		session.close();
		return user;
	}
	
	//Users에서 User_no 최대값 검색
	public static int getNextUserNo() {
		SqlSession session = factory.openSession();
		int num = session.selectOne("manageMember.getNextUserNo");
		session.close();
		return num;
	}

	//UserAddress 에서 address_no 최대값 검색
	public static int getAddressNo() {
		SqlSession session = factory.openSession();
		int num = session.selectOne("manageMember.getAddressNo");
		session.close();
		return num;
	}
	
	//UserSeller에서 seller_no 최대값 검색
	public static int getNextSellerNo() {
		SqlSession session = factory.openSession();
		int num =session.selectOne("manageMember.getNextSellerNo");
		session.close();
		return num;
	}

	//메인 페이지에 보여줄 제품 목록 검색
	public static List<ProductListVo> getList(String orderField, String sortOrder, String whereField, String categoryNo){
		SqlSession session = factory.openSession();
		HashMap map = new HashMap<>();
		map.put("orderField", orderField);
		map.put("sortOrder", sortOrder);
		map.put("whereField", whereField);
		map.put("categoryNo", categoryNo);
		List<ProductListVo> list = session.selectList("displayProducts.list", map);
		session.close();
		return list;
	}
	
	//제품 클릭시 제품 상세페이지에 보여줄 productVo 검색
	public static ProductListVo getDetail(int productNo) {
		SqlSession session = factory. openSession();
		ProductListVo p = session.selectOne("displayProducts.detail", productNo);
		session.close();
		return p;
	}
	
	//제품 클릭시 제품 상세페이지에 보여줄 제품 이미지 리스트 검색
	public static List<String> getproductImage(int productNo){
		SqlSession session = factory.openSession();
		List<String> list = session.selectList("displayProducts.imageList", productNo);
		session.close();
		return list;
	}
	
	//제품 클릭시 조회수 추가
	public static int updateHit(int productNo) {
		SqlSession session = factory.openSession(true);
		int result = session.update("displayProducts.updateHit", productNo);
		session.commit();
		session.close();
		return result;
	}
	
	//제품 클릭 후 상세페이지로 이동할 때 해당 제품 리뷰 검색
	public static List<GetReviewVo> getReview(int productNo){
		SqlSession session = factory.openSession();
		List<GetReviewVo> list = session.selectList("displayProducts.reviewList", productNo);
		session.close();
		return list;
	}
	
	//찜하기 버튼 클릭했을 때 Product_zzim 테이블에 데이터 추가
	public static int addZzim(ProductZzimVo zzim) {
		SqlSession session = factory.openSession(true);
		int result = session.insert("displayProducts.addZzim", zzim);
		session.commit();
		session.close();
		return result;
	}
	
	//Product_zzim 테이블에 추가할 때 가장 큰 zzim번호 검색
	public static int getZzimCount() {
		SqlSession session = factory.openSession();
		int num = session.selectOne("displayProducts.getZzimCount");
		session.close();
		return num;
	}
	
	//메인페이지에 보여줄 카테고리 목록 검색
	public static List<ProductCategoryVo> getAllCategory(){
		SqlSession session = factory.openSession();
		List<ProductCategoryVo> list = session.selectList("displayProducts.getAllCategory");
		session.close();
		return list;
	}
	
	//키워드로 검색할 때 보여줄 제품 리스트
	public static List<ProductListVo> getSeacrhList(String keyword){
		SqlSession session = factory.openSession();
		List<ProductListVo> list = session.selectList("displayProducts.searchList", keyword);
		session.close();
		return list;
	}
	
	//검색했을 때 총 건수
	public static int getSearchCount(String keyword) {
		SqlSession session = factory.openSession();
		int result = session.selectOne("displayProducts.getSearchCount", keyword);
		session.close();
		return result;
	}

	public static int isMemberByPhone(String name, String phone) {
		SqlSession session = factory.openSession();
		HashMap map = new HashMap();
		map.put("name", name);
		map.put("phone", phone);
		int result = session.selectOne("manageMember.isMemberByPhone", map);
		session.close();
		return result;
	}

	public static String getId(String name, String phone) {
		SqlSession session = factory.openSession();
		HashMap map = new HashMap();
		map.put("name", name);
		map.put("phone", phone);
		String id = session.selectOne("manageMember.getId",map);
		session.close();
		return id;
	}

	public static int isMemberById(String name, String id, String phone) {
		SqlSession session = factory.openSession();
		HashMap map = new HashMap();
		map.put("name", name);
		map.put("id", id);
		map.put("phone", phone);
		int result = session.selectOne("manageMember.isMemberById", map);
		session.close();
		return result;
	}

	public static int setNewPwd(String newPwd, String id) {
		SqlSession session = factory.openSession(true);
		HashMap map = new HashMap();
		map.put("pwd", newPwd);
		map.put("id", id);
		int result = session.update("manageMember.setNewPwd", map);
		session.commit();
		session.close();
		return result;
	}
	
	//MypageMapper
		public static List<SelectReviewVo> selectReview(int userNo) {
			SqlSession session = factory.openSession(true);
			List<SelectReviewVo> list = session.selectList("mypage.selectReview", userNo);
			session.close();
			return list;
		}

		public static SelectUserDetailVo selectUserDetail(int userNo) {
			SqlSession session = factory.openSession(true);
			SelectUserDetailVo re = session.selectOne("mypage.selectUserDetail", userNo);
			session.close();
			return re;
		}

		public static UserVo selectUser(int userNo) {
			SqlSession session = factory.openSession(true);
			UserVo re = session.selectOne("mypage.selectUser", userNo);
			session.close();
			return re;
		}
		public static List<SelectOrdersVo> selectAllOrder(int userNo) {
			// TODO Auto-generated method stub
			SqlSession session = factory.openSession(true);
			List<SelectOrdersVo> list = session.selectList("mypage.selectAllOrder", userNo);
			session.close();
			return list;
		}

		public static List<SelectBasketVo> selectBasket(int userNo) {
			SqlSession session = factory.openSession(true);
			List<SelectBasketVo> list = session.selectList("mypage.selectBasket", userNo);
			session.close();
			return list;
		}

		public static int deleteBasket(int userNo, int basketNo) {
			SqlSession session = factory.openSession(true);
			HashMap map = new HashMap();
			map.put("userNo", userNo);
			map.put("basketNo", basketNo);
			int re = session.delete("mypage.deleteBasket", map);
			session.commit();
			session.close();
			return re;
		}

		public static int updateOrder(int userNo, int productNo, String orderManageReason) {
			SqlSession session = factory.openSession(true);
			HashMap map = new HashMap();
			map.put("userNo", userNo);
			map.put("productNo", productNo);
			map.put("orderManageReason", orderManageReason);
			int re = session.update("mypage.updateOrder", map);
			session.commit();
			session.close();
			return re;
		}

		public static List<SelectZzimVo> selectZzim(int userNo) {
			SqlSession session = factory.openSession(true);
			List<SelectZzimVo> list = session.selectList("mypage.selectZzim", userNo);
			session.commit();
			session.close();
			return list;
		}
		
		//ZzimMapper
		public static int deleteZzim(int userNo, int zzimNo) {
			SqlSession session = factory.openSession(true);
			HashMap map = new HashMap();
			map.put("userNo", userNo);
			map.put("zzimNo", zzimNo);
			int re = session.delete("zzim.deleteZzim", map);
			session.commit();
			session.close();
			return re;
		}

		public static int insertBasket(int userNo, int productNo) {
			SqlSession session = factory.openSession(true);
			HashMap map = new HashMap();
			map.put("userNo", userNo);
			map.put("productNo", productNo);
			int re = session.delete("zzim.insertBasket", map);
			session.commit();
			session.close();
			return re;
		}
		
		public static int checkBasket(int userNo, int productNo) {
			SqlSession session = factory.openSession(true);
			HashMap map = new HashMap();
			map.put("userNo", userNo);
			map.put("productNo", productNo);
			int re = session.selectOne("zzim.checkBasket", map);
			session.close();
			return re;
		}

		public static int updateBasket(int userNo, int productNo) {
			SqlSession session = factory.openSession(true);
			HashMap map = new HashMap();
			map.put("userNo", userNo);
			map.put("productNo", productNo);
			int re = session.update("zzim.updateBasket", map);
			session.commit();
			session.close();
			return re;
		}
		
		//ReviewMapper
		public static SelectOrdersVo selectProductDetail(int userNo, int productNo, String orderDate) {
			SqlSession session = factory.openSession(true);
			HashMap map = new HashMap();
			map.put("userNo", userNo);
			map.put("productNo", productNo);
			map.put("orderDate", orderDate);
			SelectOrdersVo re = session.selectOne("review.selectProductDetail", map);
			session.close();
			return re;
		}

		public static int insertReview(ReviewVo r) {
			SqlSession session = factory.openSession(true);
			int re = session.insert("review.insertReview", r);
			session.commit();
			session.close();
			return re;
		}

		public static int insertReviewImgNull(ReviewVo r) {
			SqlSession session = factory.openSession(true);
			int re = session.insert("review.insertReviewImgNull", r);
			session.commit();
			session.close();
			return re;
		}

		public static int deleteReview(int reviewNo) {
			SqlSession session = factory.openSession(true);
			int re = session.delete("review.deleteReview", reviewNo);
			session.commit();
			session.close();
			return re;
		}
		
		
		//ProfileMapper
		public static int updateUser(UserVo u) {
			SqlSession session = factory.openSession(true);
			int re = session.update("profile.updateUser", u);
			session.commit();
			session.close();
			return re;
		}


		public static int nicknameCheck(String nickname) {
			SqlSession session = factory.openSession(true);
			int re = session.selectOne("profile.nicknameCheck", nickname);
			session.close();
			return re;
		}

		public static void updateNickname(int userNo,String nickname) {
			SqlSession session = factory.openSession(true);
			HashMap map = new HashMap();
			map.put("userNo", userNo);
			map.put("nickName", nickname);
			int re = session.update("profile.updateNickname", map);
			session.commit();
			session.close();
		}

		public static String getPassword(int userNo) {
			SqlSession session = factory.openSession(true);
			String re = session.selectOne("profile.getPassword", userNo);
			session.close();
			return re;
		}

		public static void updatePassword(int userNo, String newPassword) {
			SqlSession session = factory.openSession(true);
			HashMap map = new HashMap();
			map.put("userNo", userNo);
			map.put("newPassword", newPassword);
			int re = session.update("profile.updatePassword", map);
			session.commit();
			session.close();
		}

		public static void updateAddress(int userNo, String address1, String address2, String address3) {
			SqlSession session = factory.openSession(true);
			HashMap map = new HashMap();
			map.put("userNo", userNo);
			map.put("address1", address1);
			map.put("address2", address2);
			map.put("address3", address3);
			int re = session.update("profile.updateAddress", map);
			session.commit();
			session.close();
		}

	//<상품등록>
		public static int insertProduct(ProductsVo p, ProductImgVo i) {
			SqlSession session = factory.openSession();
			int re1 = session.insert("product.insertProduct", p);
			int re2 = session.insert("product.insertProductImg", i);
			int re = 0;
			if(re1 == 1 && re2 ==1) {
				session.commit();
				re = 1;
			}else {
				session.rollback();
			}
			session.close();
			return re;
		}
		
		
		//<상품수정>
		public static int updateProduct(ProductSelectVo ps) {
			SqlSession session = factory.openSession();
			int re= session.update("product.updateProduct",ps);
			if(re== 1) {
				session.commit();
			}else {
				session.rollback();
			}
			session.close();
			return re;
		}
		
		//<상품수정을 위한 정보 불러오>
		public static ProductSelectVo detailProduct(int productNo) {
			SqlSession session = factory.openSession();
			ProductSelectVo ps = session.selectOne("product.detailProduct", productNo);
			session.close();
			return ps;
		}
		
		//<상품번호 등록>
		public static int productNum() {
			SqlSession session = factory.openSession();
			int no = session.selectOne("product.getProductNo");
			session.close();
			return no;
		}
		
		//<상품이미지 등록>
		public static int productImgNum() {
			SqlSession session = factory.openSession();
			int no = session.selectOne("product.getProductImgNo");
			session.close();
			return no;
		}
		
		//<판매된 상품 불러오기>
		public static List<ProductSelectVo> productlist(HashMap map){
			SqlSession session = factory.openSession();
			List<ProductSelectVo> list = session.selectList("product.productList", map);
			session.close();
			return list;
		}
		
		//<카테고리 가져오기>
		public static List<ProductCategoryVo> category(){
			SqlSession session = factory.openSession();
			List<ProductCategoryVo> category = session.selectList("product.category");
			session.close();
			return category;
		}
		
		//<상품목록 페이징>
		public static int getTotalSellRecord(int sellerNo) {
			// TODO Auto-generated method stub
			SqlSession session = factory.openSession();
			int n = session.selectOne("product.totalRecord", sellerNo);
			session.close();
			return n;
		}

		//<판매자 번호를 불러오기 위한 DBManager>
		public static SellerVo getSeller(String id) {
			SqlSession session = factory.openSession();
			SellerVo s = session.selectOne("seller.getSeller", id);
			session.close();
			return s;
		}

		/*
		//<판매자 로그인>
		public static boolean isUser(String id, String pwd) {		boolean re = false;
			SqlSession session = factory.openSession();
			HashMap map = new HashMap();
			map.put("id", id);
			map.put("pwd", pwd);
			SellerVo s = session.selectOne("seller.isUser", map);
			if(s!=null) {
				re = true;
			}
			session.close();
			return re;
		}
		
		
		public static UserVo getUser(String id) {
			SqlSession session = factory.openSession();
			UserVo us = session.selectOne("seller.getUser", id);
			session.close();
			return us;
		}
		

		*/
		
		//<상품매출 가져오기>
		public static List<ProductSalesVo> productSales(int sellerNo){
			SqlSession session = factory.openSession();
			List<ProductSalesVo> list = session.selectList("sales.productSales", sellerNo);
			session.close();
			return list;
		}
		
		//<상품기간별 매출 불러오기>
		public static List<ProductSalesVo> productDateSales(HashMap map){
			SqlSession session = factory.openSession();
			List<ProductSalesVo> list = session.selectList("sales.productDateSales", map);
			session.close();
			return list;
		}
		//장바구니 번호 불러오기
		public static int getBasketNo() {
			SqlSession session = factory.openSession();
			int result = session.selectOne("mypage.getBasketNo");
			session.close();
			return result;
		}
		
		//장바구니 입력하기
		public static int insertIntoBasket(int basketNo, int basketQty, int userNo, int productNo) {
			SqlSession session = factory.openSession(true);
			HashMap map = new HashMap();
			map.put("basketNo", basketNo);
			map.put("basketQty", basketQty);
			map.put("userNo", userNo);
			map.put("productNo", productNo);
			int result = session.insert("mypage.insertIntoBasket", map);
			session.commit();
			session.close();
			return result;
		}

		public static int getSameZzim(int userNo, int productNo) {
			SqlSession session = factory.openSession();
			HashMap map = new HashMap();
			map.put("userNo", userNo);
			map.put("productNo", productNo);
			int result = session.selectOne("displayProducts.getSameZzim", map);
			session.close();
			return result;
		}
	
}
