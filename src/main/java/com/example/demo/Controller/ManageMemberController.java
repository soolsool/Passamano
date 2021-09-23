package com.example.demo.Controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.net.http.HttpResponse;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.ManageMemberDao;
import com.example.demo.vo.SellerVo;
import com.example.demo.vo.UserAddressVo;
import com.example.demo.vo.UserSellerVo;
import com.example.demo.vo.UserVo;

import kr.co.youiwe.webservice.BitSms;

@Controller
public class ManageMemberController {
	@Autowired
	private ManageMemberDao dao;

	public void setDao(ManageMemberDao dao) {
		this.dao = dao;
	}
	
	//로그인(/login.do)로 이동하거나, 인터셉터에 걸렸을 때 
	//세션에 로그인 정보가 없으면 로그인 폼으로 보낸다.
	//로그인으로 이동할 때 이전 페이지를 backpage로 세션에 추가한다. 
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView();
		String referrer = request.getHeader("Referer");
		request.getSession().setAttribute("backpage", referrer);		
		mav.setViewName("login");
		return mav;
	}
	
	//아이디와 비밀번호를 입력한 후 post방식으로 전달할 때
	//회원이 맞다면 session에 loginuser로 UserVo 객체를 저장한 뒤 메인페이지로 이동하고,
	//회원이 아니라면 메세지와 함께 다시 로그인 창으로 이동한다.
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView loginSubmit(HttpSession session, HttpServletRequest request, HttpServletResponse response, String id, String pwd) throws IOException {
		ModelAndView mav = new ModelAndView();
		
		if(dao.isMember(id,pwd)) {
			//DB에 로그인 정보를 확인하고 user객체에 담고, 로그인한 객체를 loginUser로 세션에 저장한다.
			//검색과 저장을 마치면 로그인 이전의 페이지로 이동한다.
			UserVo user = dao.getMember(id);
			SellerVo seller = dao.getSeller(id);

			session.setAttribute("loginUser", user);
			session.setAttribute("sellerInfo", seller);
			session.setAttribute("userNo", user.getUserNo());
			session.setAttribute("grantNo", user.getGrantNo());
			
			if(user.getGrantNo()==20) {
				int userNo = user.getUserNo();
				session.setAttribute("sellerNo", dao.getSellerNo(userNo));
			}
			

			
			if(user!=null) {
				String referrer = (String)session.getAttribute("backpage");
				if(referrer.equals("http://localhost:8080/login.do")) {
					response.sendRedirect("/");
				}else {
					response.sendRedirect(referrer);					
				}
			}
			
		}else {
			session.setAttribute("msg", "회원정보가 없습니다.\n 입력하신 아이디와 비밀번호를 확인하시거나, 회원가입해주세요.");
			mav.setViewName("redirect:/login.do");
		}
		return mav;
	}
	
	//로그아웃 요청 시 세션에 저장된 정보를 모두 지우고 메인으로 이동한다.
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView("redirect:/");
		return mav;
	}
	
	//회원가입 요청하면 일반회원인지 판매자회원인지 선택해야 한다.
	@RequestMapping(value="/member/membertype.do")
	public void choosetype() {
		
	}
	
	//일반 회원으로 가입할 때 일반회원용 폼 페이지를 전달한다.	
	@RequestMapping(value = "/member/userjoin.do", method = RequestMethod.GET)
	public void joinUserForm() {
	}
	
	//일반 회원용 폼페이지를 작성하고 회원가입을 누르면 입력한 내용을 DB에 입력한다.
	 @RequestMapping(value = "/member/submit.do", method = RequestMethod.POST) 
	 public void submit(UserVo user, UserAddressVo address, String address4, HttpServletRequest request) {
	 	ModelAndView mav = new ModelAndView(); 
	 	
	 	
	 	user.setUserNo(dao.getNextUserNo()+1); 

	 	address.setAddress2(address.getAddress2()+address4);
	 	address.setAddressNo(dao.getAddressNo()+1);
	 	address.setUserNo(dao.getNextUserNo()+1);
	 	
	 	String profileFilename = null; 
	 	String path = request.getRealPath("/resources/images/userprofile"); 
	 	MultipartFile uploadFile = user.getUploadFile(); 
	 	profileFilename = uploadFile.getOriginalFilename();
	 
	 	if(profileFilename!=null && !profileFilename.equals("")) { 
	 		try { 
	 			byte[] data = uploadFile.getBytes(); 
	 			FileOutputStream fos = new FileOutputStream(path+"/"+profileFilename); 
	 			fos.write(data); 
	 			fos.close();
	 			user.setProfileFilename(profileFilename);
 			} catch (Exception e) {
 				System.out.printf("예외발생:%s,\n", e.getMessage()); } 
 		}else {
 			user.setProfileFilename("passamanoBasicProfile.png"); 
		}
	 
	 	int re = dao.insertUser(user, address);
	 
	 	if(re!=0) 
	 		mav.setViewName("redirect:/member/userjoin.do"); 
	 	else //DB에 입력하는데 실패하면 다시 가입 페이지로 보낸다. 
	 		mav.setViewName("redirect:/member/confirmuser.do"); 
 	}
	 
	 //일반회원 정보와 주소정보를 DB에 입력한 후 가입 완료 페이지로 이동한다.
	 @RequestMapping("/member/confirmuser.do")
	 public String confirmUser() {
		 return "confirmuser";
	 }
	 
	//jsp에서 json 타입으로 보낸 ajax 데이터 받아 DB에서 중복을 확인한다.
	@RequestMapping(value = "/member/doubleCheck.do", method = RequestMethod.POST)
	public @ResponseBody String doubleCheck(@RequestBody Map<String, Object> param) {
		String col = (String)param.get("col");
		String userInput = (String)param.get("userInput");
		int result = dao.doubleCheck(col, userInput);
		if(result != 0)
			return "fail";
		else 
			return "success";
	}
	
	//인증번호 발송 버튼 클릭 시 난수를 만들고 조합하여 인증번호를 발송한다.
	@RequestMapping("/member/sendCode.do")
	@ResponseBody
	public String sendCode(String to) {
		String code = "";
		String from = "01025598279";
		Random r = new Random();
		
		int a = r.nextInt(10);
		int b = r.nextInt(10);
		int c = r.nextInt(10);
		int d = r.nextInt(10);
		int e = r.nextInt(10);
		int f = r.nextInt(10);
		
		code = a + "" + b + "" + c + "" + d + "" + e + "" + f ;
		
		BitSms sms = new BitSms();
		sms.sendMsg(from, to, code);
		
		return code;
	}
	
	//판매자회원 선택시 판매자정보 입력하는 페이지로 이동한다.
	@RequestMapping("/member/verifyseller.do")
	public void verifySeller() {
		
	}
	
	
	
	//판매자 정보 입력 페이지에서 폼을 작성하면 기본회원정보 입력양식으로 이동한다.
	 @RequestMapping(value="/member/verifySeller.do", method = RequestMethod.POST)
	 public ModelAndView joinSellerForm(UserSellerVo seller, String sellerId1, String sellerId2, String sellerId3, String sido1, String gugun1, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String sellerId = sellerId1 + "-" + sellerId2 + "-" + sellerId3;
		String sellerAddress = sido1 + " " + gugun1;
		System.out.println("컨트롤러에 도착함.");
		
		seller.setSellerNo(dao.getNextSellerNo()+1);
		seller.setUserNo(dao.getNextUserNo()+1);
		seller.setSellerId(sellerId);
		seller.setSellerAddress(sellerAddress);
		
		String sellerFile = null;
		String path = request.getRealPath("/resources/images/sellerfile");
		MultipartFile uploadFile = seller.getUploadFile();
		sellerFile = uploadFile.getOriginalFilename();
		 
		if(sellerFile != null && !sellerFile.equals("")) {
			 byte[] data;
			try {
				data = uploadFile.getBytes();
				FileOutputStream fos = new FileOutputStream(path + "/" + sellerFile);
				fos.write(data);
				fos.close();
				seller.setSellerFile(sellerFile);
			} catch (IOException e) {
				System.out.printf("예외발생: %s\n", e.getMessage());
			}
		 }
		 session.setAttribute("seller", seller);
		 mav.setViewName("redirect:/member/sellerjoin.do");
		 System.out.println("세션에 seller 저장");
		 return mav;
	 }
	 
	 @RequestMapping(value="/member/sellerjoin.do", method = RequestMethod.GET)
	 public void sendSellerForm() {
		 
	 }
	 
	 @RequestMapping(value="/member/sellerjoin.do", method = RequestMethod.POST)
	 public void sellerFormSubmit(UserVo user, UserAddressVo address, String address4, UserSellerVo seller, HttpServletRequest request, HttpSession session) {
		 ModelAndView mav = new ModelAndView();
		 
		 int userNo = seller.getUserNo();
		 seller = (UserSellerVo) session.getAttribute("seller");

		 user.setUserNo(userNo);
		 address.setUserNo(userNo);
		 address.setAddress2(address.getAddress2()+address4);
		 
		 String profileFilename = null; 
		 String path = request.getRealPath("/resources/images/userprofile"); 
		 MultipartFile uploadFile = user.getUploadFile(); 
		 profileFilename = uploadFile.getOriginalFilename();
	 
		 if(profileFilename!=null && !profileFilename.equals("")) { 
			 try { 
				 byte[] data = uploadFile.getBytes(); 
				 FileOutputStream fos = new FileOutputStream(path+"/"+profileFilename); 
				 fos.write(data); 
				 fos.close();
				 user.setProfileFilename(profileFilename);
			 } catch (Exception e) {
				 System.out.printf("예외발생:%s,\n", e.getMessage()); } 
		 	}else {
		 		user.setProfileFilename("passamanoBasicProfile.png"); 
		 	}
	 
	 	int re = dao.insertSeller(user, address, seller);
	 
	 	if(re!=0) 
	 		mav.setViewName("redirect:/member/userjoin.do"); 
	 	else //DB에 입력하는데 실패하면 다시 가입 페이지로 보낸다. 
	 		mav.setViewName("redirect:/member/confirmuser.do"); 
	 }
	 
	//일반회원 정보와 주소정보를 DB에 입력한 후 가입 완료 페이지로 이동한다.
	 @RequestMapping("/member/confirmseller.do")
	public void confirmSeller() {
		
	}
	
	@RequestMapping("/member/findId.do")
	public void findId() {
		
	}

	@RequestMapping("/member/findPwd.do")
	public void findPwd() {
		
	}

	//아이디 찾기를 요청한 회원에게 이름, 연락처를 전달받아 존재하는 회원인지 확인한다.
	@RequestMapping(value="/member/isMemberByPhone.do", method = RequestMethod.POST)
	public @ResponseBody int isMemberByPhone(@RequestBody Map<String, Object> param) {
		String name = (String)param.get("name");
		String phone = (String)param.get("phone");
		int result = dao.isMemberByphone(name, phone);
		return result;
	}

	//아이디를 요청한 회원이 이름과 연락처를 인증했을 때, 아이디를 찾아 알려준다.
	@RequestMapping(value="/member/getId.do", method = RequestMethod.POST)
	public @ResponseBody String getId(@RequestBody Map<String, Object> param) {
		String name = (String)param.get("name");
		String phone = (String)param.get("phone");
		String id = dao.getId(name, phone);
		return id;
	}
	
	//비밀번호 찾기를 요청한 회원에게 이름, 아이디, 연락처를 입력받아 존재하는 회원인지 확인한다.
	@RequestMapping(value="/member/isMemberById.do", method = RequestMethod.POST)
	public @ResponseBody int isMemberById(@RequestBody Map<String, Object> param) {
		String name = (String)param.get("name");
		String id = (String)param.get("id");
		String phone = (String)param.get("phone");
		int result = dao.isMemberById(name, id, phone);
		return result;
	}
	
	//비밀번호 찾기를 요청한 회원이 아이디와 이름, 연락처를 인증했을 때, 새로운 비밀번호를 발급하여
	//User 테이블을 업데이트하고, 문자로 비밀번호를 보내준다.
	@RequestMapping(value="/member/setNewPwd.do", method = RequestMethod.POST)
	public @ResponseBody int setNewPwd(@RequestBody Map<String, Object> param) {
		String id = (String)param.get("id");
		String phone = (String)param.get("phone");
		String from = "01025598279";		
		
		int leftLimit = 48; // numeral '0'
		int rightLimit = 122; // letter 'z'
		int newPwdLength = 7; //새로운 비밀번호 길이
		Random random = new Random();

		String newPwd = random.ints(leftLimit,rightLimit + 1)
		  .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
		  .limit(newPwdLength) 
		  .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
		  .toString();
		int result = dao.setNewPwd(newPwd, id);
		
		BitSms sms = new BitSms();
		sms.sendMsg(from, phone, newPwd);
		
		return result;		
	}
}
