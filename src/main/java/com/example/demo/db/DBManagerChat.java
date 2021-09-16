package com.example.demo.db;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.ChatRoomVO;
import com.example.demo.vo.ChatVO;



import java.io.Reader;
import java.util.Date;
import java.util.HashMap;
import java.util.List;



public class DBManagerChat {
	private static SqlSessionFactory factory = null;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("com/example/demo/db/dbConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
			
		}catch(Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}
	}
	
	public static Date getLastChat(int chat_room_no){
		SqlSession session = factory.openSession();
		Date date = session.selectOne("chat.getLastChat", chat_room_no);
		session.close();
		return date;
	}
	
	public static int getNextChatRoom() {
		SqlSession session = factory.openSession();
		int no = session.selectOne("chat.getNextChatRoom");
		session.close();
		return no;
	}
	
	public static int getUserNoBySellerNo(int seller_no) {
		SqlSession session = factory.openSession();
		int no = session.selectOne("chat.getUserNoBySellerNo", seller_no);
		session.close();
		return no;
	}
	
	public static int insertChatRoom(ChatRoomVO c) {
		SqlSession session = factory.openSession(true);
		int chat_room_no =  getNextChatRoom();
		c.setChat_room_no(chat_room_no);
		int re = session.insert("chat.insertChatRoom",c);
		session.close();
		return re;
	}
	
	
	public static List<HashMap> listChatRoom(int user_no) {
		SqlSession session = factory.openSession();
		List<HashMap> list = session.selectList("chat.listChatRoom",user_no);
		session.close();
		return list;
	}
	
	public static HashMap chatInfo(int chat_room_no) {
		SqlSession session = factory.openSession();
		HashMap map = session.selectOne("chat.chatInfo",chat_room_no);
		session.close();
		return map;
	}
	
	public static List<HashMap> listChat(int chat_room_no) {
		
		SqlSession session = factory.openSession();
		List<HashMap> list = session.selectList("chat.listChat",chat_room_no);
		//System.out.println("DBManger의 listChat:"+chat_room_no);
		//System.out.println(list);
		session.close();
		return list;
	}
//	public static List<ChatVO> listChat(int chat_room_no) {
//		
//		SqlSession session = factory.openSession();
//		List<ChatVO> list = session.selectList("listChat",chat_room_no);
//		System.out.println("DBManger의 listChat:"+chat_room_no);
//		System.out.println(list);
//		session.close();
//		return list;
//	}
	
	
	
	
	public static int insert(ChatVO b) {
		int re = -1;
		SqlSession session = factory.openSession(true);
		re=session.insert("chat.insert", b);
		session.update("chat.updateLastChatDate",b.getChat_room_no());
		session.close();
		return re;
	}

	public static int getChatRoomNo(int product_no, int from_no) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap map = new HashMap();
		map.put("product_no", product_no);
		map.put("from_no", from_no);
		int no = session.selectOne("chat.getChatRoomNo",map);
		session.close();
		return no;
	}

	public static int deletEmptyRoom() {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		int re = session.delete("chat.deletEmptyRoom");
		session.close();
		return re;
	}
	
}














