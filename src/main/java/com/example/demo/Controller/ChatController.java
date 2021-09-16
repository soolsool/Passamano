package com.example.demo.Controller;


import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.ChatDao;
import com.example.demo.dao.ProductDao;
import com.example.demo.vo.ChatRoomVO;
import com.example.demo.vo.ChatVO;
@Controller
public class ChatController {

	@Autowired
	private ChatDao dao;
	
	@Autowired
	private ProductDao pDao;
	
	
	public void setDao(ChatDao dao) {
		this.dao = dao;
	}
	
	
	
	//로그인 임시 처리
	/*
	@RequestMapping("/loginOK.do")
	public void loginOK(int user_no, HttpSession session) {
		System.out.println("로그인한 회원번호 : "+user_no);
		session.setAttribute("user_no",user_no);
	}
	*/
	
	public void setpDao(ProductDao pDao) {
		this.pDao = pDao;
	}

	


	//로그인한 회원의 채팅목록
	@RequestMapping("/listChatRoom.do")
	public void chatList(Model model, HttpSession session) {
		
		//로그인 한 회원의 번호 읽어오기
		int userNo = (int)session.getAttribute("userNo");
//		System.out.println("채팅룸으로 갑니다.");
//		System.out.println("로그인한 회원번호 : "+userNo);
		
		
		//delete chat_room where chat_room_no not in (select chat_room_no from chat);
		dao.deletEmptyRoom();
		
		//채팅룸을 생성하여
		//대화방으로 이동하였으나 아무 대화 없이 나가는 경우 즉 내용이 없는 채팅룸은 삭제한다.
		model.addAttribute("list",  dao.listChatRoom(userNo));
	}
	
	
	// 채팅룸 생성, 구매자가 상품상세보기에서 "채팅하기" 눌렀을때 동작
	// 상품번호와,판매자번호를 전달받아야 함.
	// makeChatRoom.do?product_no=100&to_no=1
	@RequestMapping("/makeChatRoom.do")
	public ModelAndView makeChatRoom(int product_no, HttpSession session) {
		
		//판매자번호  읽어오기
		int seller_no = pDao.getProduct(product_no).getSellerNo();
		
		
		//판매자번호에 따른 회원번호 읽어 오기
		int to_no = dao.getUserNoBySellerNo(seller_no);
		
		
		//로그인한 회원의 아이디를 from_no에 설정
		int from_no =  (int)session.getAttribute("userNo");
		
		int chat_room_no = dao.getChatRoomNo(product_no, from_no);
		
		if(chat_room_no == 0) {
			chat_room_no = dao.getNextChatRoom();
			ChatRoomVO r = new ChatRoomVO(chat_room_no, product_no, from_no, to_no, null);
			dao.insertChatRoom(r);
		}
		
		/*
		HashMap  map = (HashMap)dao.chatInfo(chat_room_no);
		System.out.println(map);
		String TO_NICKNAME = (String)map.get("TO_NICKNAME");
		String TO_PROFILE = (String)map.get("TO_PROFILE");
		String PRODUCT_NAME = (String)map.get("PRODUCT_NAME");
		String IMAGE_NAME = (String)map.get("IMAGE_NAME");
		String PRODUCT_PRICE = ((BigDecimal)map.get("PRODUCT_PRICE")).toString();
		String PRODUCT_STATE =  ((BigDecimal)map.get("PRODUCT_STATE")).toString();
		//int PRODUCT_STATE = (int)map.get("PRODUCT_STATE");
		
		
	   String url = "redirect:/chat.do?chat_room_no="+chat_room_no+"&nickname="+TO_NICKNAME+
			   "&your_profile="+TO_PROFILE+"&product_name="+PRODUCT_NAME+
			   "&image_name="+IMAGE_NAME+"&price="+PRODUCT_PRICE+"&state="+PRODUCT_STATE;
	   //ModelAndView mav = new ModelAndView("redirect:/chat.do?chat_room_no="+chat_room_no);
	    
	    */
		
	   String url ="redirect:/chat.do?chat_room_no="+chat_room_no+"&start=1";
	   ModelAndView mav = new ModelAndView(url);
	   return mav;
	}
	
	
	
	//채팅룸에서 채팅하기
	@RequestMapping("/chat.do")
	public void chat(HttpSession session, int chat_room_no,	Model model) {
//		public void chat(HttpSession session, int chat_room_no, String nickname,String your_profile, 
//				String product_name, String image_name, 
//				String price,
//				int state,
//				Model model) {
		
		int userNo = (int)session.getAttribute("userNo");
		
		HashMap  map = (HashMap)dao.chatInfo(chat_room_no);
		System.out.println(map);
		
		String FROM_NO = ((BigDecimal)map.get("FROM_NO")).toString();
		
		

		
		String your_nickname = (String)map.get("FROM_NICKNAME");
		String your_profile = (String)map.get("FROM_PROFILE");
		
		
		
		if(FROM_NO.equals(userNo+"")) {
		 your_nickname =(String)map.get("TO_NICKNAME") ;
		 your_profile = (String)map.get("TO_PROFILE");
		}
		
		
		String PRODUCT_NAME = (String)map.get("PRODUCT_NAME");
		String IMAGE_NAME = (String)map.get("IMAGE_NAME");
		String PRODUCT_PRICE = ((BigDecimal)map.get("PRODUCT_PRICE")).toString();
		String PRODUCT_STATE =  ((BigDecimal)map.get("PRODUCT_STATE")).toString();
		
//		System.out.println("상대방 닉네임:"+your_nickname);
//		
//		
//		System.out.println("채팅하러 갑니다.-------------------------");
//		System.out.println("로그인한 회원번호 : "+userNo);
//		System.out.println("chat_room_no : "+chat_room_no);
		
		
		//채팅을 주고받기 위해 필요한 정보를 상태유지 한다.
		model.addAttribute("chat_room_no", chat_room_no);
		model.addAttribute("speaker_no", userNo);
		
		
		
		
		//제목에 표시할 내용을 상태유지 한다.
		model.addAttribute("your_nickname", your_nickname);
		model.addAttribute("your_profile", your_profile);
		
		
		model.addAttribute("product_name", PRODUCT_NAME);
		model.addAttribute("image_name", IMAGE_NAME);
		model.addAttribute("product_price", PRODUCT_PRICE);
		
		String product_state = "판매중";
		if(PRODUCT_STATE.equals("1")) {
			product_state = "거래완료";
		}
		
		model.addAttribute("product_state", product_state);
		
		
	}

	@RequestMapping("/insertChat")
	@ResponseBody
	public String insert(ChatVO c) {
	//	System.out.println("ChatVO:"+c);
		dao.insert(c);
		return "OK";
	}
	
	
	@RequestMapping("/listChat")
	@ResponseBody
	public List<HashMap> list(int chat_room_no){
//		System.out.println("listChat 동작함:"+chat_room_no);
		return dao.listChat(chat_room_no);
	}
//	public List<ChatVO> list(int chat_room_no){
//		System.out.println("listChat 동작함:"+chat_room_no);
//		return dao.listChat(chat_room_no);
//		
//	}
	
	
}
