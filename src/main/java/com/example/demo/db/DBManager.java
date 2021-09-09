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
import com.example.demo.vo.ProductListVo;
import com.example.demo.vo.ProductZzimVo;
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
	public static int getUserNo() {
		SqlSession session = factory.openSession();
		int num = session.selectOne("manageMember.getUserNo");
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
	public static int getSellerNo() {
		SqlSession session = factory.openSession();
		int num =session.selectOne("manageMember.getSellerNo");
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

	
}
