package com.example.demo.dao;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.SellerVo;
import com.example.demo.vo.UserAddressVo;
import com.example.demo.vo.UserSellerVo;
import com.example.demo.vo.UserVo;

@Repository
public class ManageMemberDao {
	//아이디나 별명 중복 확인 버튼 클릭시 동일한 데이터 있나 검색
	public int doubleCheck(String col, String userInput) {
		return DBManager.doubleCheck(col, userInput);
	}
	
	//일반 회원가입시 Users, User_address 테이블에 데이터 입력
	public int insertUser(UserVo user, UserAddressVo address) {
		return DBManager.insertUser(user, address);
	}

	//판매자 회원가입시 Users, User_address, User_seller 테이블에 데이터 입력
	public int insertSeller(UserVo user, UserAddressVo address, UserSellerVo seller) {
		return DBManager.insertSeller(user, address, seller);
	}

	//로그인
	public boolean isMember(String id, String pwd) {
		return DBManager.isMember(id,pwd);
	}
	
	//로그인 성공시 아이디를 이용해 해당 회원의 UserVo를 검색 
	public UserVo getMember(String id) {
		return DBManager.getMember(id);
	}
	
	//Users에서 User_no 최대값 검색
	public int getNextUserNo() {
		return DBManager.getNextUserNo();
	}
	
	//UserAddress 에서 address_no 최대값 검색
	public int getAddressNo() {
		return DBManager.getAddressNo();
	}
	
	//UserSeller에서 seller_no 최대값 검색
	public int getNextSellerNo() {
		return DBManager.getNextSellerNo();
	}

	//아이디 찾기에서 이름과 연락처가 존재하는지 확인한다.
	public int isMemberByphone(String name, String phone) {
		return DBManager.isMemberByPhone(name, phone);
	}

	public String getId(String name, String phone) {
		return DBManager.getId(name, phone);
	}

	public int isMemberById(String name, String id, String phone) {
		return DBManager.isMemberById(name, id, phone);
	}

	public int setNewPwd(String newPwd, String id) {
		return DBManager.setNewPwd(newPwd, id);
	}
	
	public SellerVo getSeller(String id) {
		return DBManager.getSeller(id);
	}
	public int getSellerNo(int userNo) {
		return DBManager.getSellerNo(userNo);
	}

}
