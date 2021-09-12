package com.example.demo.dao;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.UserVo;

@Repository
public class ProfileDao {

	public int updateUser(UserVo u) {
		return DBManager.updateUser(u);
	}

	public int nicknameCheck(String nickname) {
		return DBManager.nicknameCheck(nickname);
	}

	public void updateNickname(int userNo, String nickname) {
		DBManager.updateNickname(userNo, nickname);
	}

	public String getPassword(int userNo) {
		return DBManager.getPassword(userNo);
	}

	public void updatePassword(int userNo, String newPassword) {
		DBManager.updatePassword(userNo, newPassword);

	}

	public void updateAddress(int userNo, String address1, String address2, String address3) {
		DBManager.updateAddress(userNo, address1, address2, address3);
	}
}
