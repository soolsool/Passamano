package com.example.demo.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManagerChat;
import com.example.demo.vo.ChatRoomVO;
import com.example.demo.vo.ChatVO;

@Repository
public class ChatDao {
	
	public int getUserNoBySellerNo(int seller_no) {
		return DBManagerChat.getUserNoBySellerNo(seller_no);
	}
	
	public Date getLastChat(int chat_room_no) {
		return DBManagerChat.getLastChat(chat_room_no);
	}
	
	public int getNextChatRoom() {
		return DBManagerChat.getNextChatRoom();
	}
	
	public int insertChatRoom(ChatRoomVO c) {
		return DBManagerChat.insertChatRoom(c);
	}
	
	public List<HashMap> listChatRoom(int user_no){
		return DBManagerChat.listChatRoom(user_no);
	}
	
	public List<HashMap> listChat(int chat_room_no){
		return DBManagerChat.listChat(chat_room_no);
	}
	
	public HashMap chatInfo(int chat_room_no){
		return DBManagerChat.chatInfo(chat_room_no);
	}
	
	
//	public List<ChatVO> listChat(int chat_room_no){
//		return DBManagerChat.listChat(chat_room_no);
//	}
	
	public int insert(ChatVO c) {
		return DBManagerChat.insert(c);
	}

	public int getChatRoomNo(int product_no, int from_no) {
		// TODO Auto-generated method stub
		return DBManagerChat.getChatRoomNo(product_no,from_no);
	}

	public int deletEmptyRoom() {
		// TODO Auto-generated method stub
		return DBManagerChat.deletEmptyRoom();
	}
	
	
}
