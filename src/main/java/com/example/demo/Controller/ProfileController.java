package com.example.demo.Controller;

import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.example.demo.dao.ProfileDao;
import com.example.demo.vo.UserVo;
@Controller
public class ProfileController {

	@Autowired
	private ProfileDao dao;

	public void setDao(ProfileDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/mypage/updateProfileImg.do")
	public ModelAndView updateProfileImg(UserVo u, HttpServletRequest request, HttpSession session) {
		int userNo=(int) session.getAttribute("userNo");
		ModelAndView mav = new ModelAndView("redirect:/mypage/home.do");
		String path = request.getRealPath("/files/profile_images");
		String profileImg = null;
		MultipartFile uploadFile = u.getUploadFile();
		profileImg = uploadFile.getOriginalFilename();

		if (profileImg != null && !profileImg.equals("")) {
			try {
				Date today = new Date();
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMddHHmmss");
				String now = transFormat.format(today);
				profileImg = now + userNo + profileImg;// 이미지이름 중복방지

				byte[] data = uploadFile.getBytes();
				FileOutputStream fos = new FileOutputStream(path + "/" + profileImg);
				fos.write(data);
				fos.close();
				u.setProfileFilename(profileImg);
			} catch (Exception e) {
				System.out.println("예외발생:" + e.getMessage());
			}

		}
		u.setUserNo(userNo);
		int re = dao.updateUser(u);

		if (re != 1) {
			mav.addObject("msg", "이미지 등록에 실패하였습니다.");
			mav.setViewName("error");
		}

		return mav;
	}
	
	@RequestMapping("/mypage/nicknameCheck.do")
	@ResponseBody
	public int nicknameCheck(HttpServletRequest request, HttpSession session) {
		int userNo=(int) session.getAttribute("userNo");
		String nickname= request.getParameter("nickname");
		int check=dao.nicknameCheck(nickname);
		if(check==0) {
			dao.updateNickname(userNo,nickname);
		}
		return check;
	}
	
	@RequestMapping("/mypage/passwordCheck.do")
	@ResponseBody
	public int passwordCheck(HttpServletRequest request, HttpSession session) {
		int userNo=(int) session.getAttribute("userNo");
		int check=0;
		String password=request.getParameter("password");
		String origin_password=dao.getPassword(userNo);
		if(password.equals(origin_password)) {
			check=0;
		}
		else {
			check=1;
		}
		return check;
	}
	
	@RequestMapping("/mypage/updatePassword.do")
	@ResponseBody
	public void updatePassword(HttpServletRequest request, HttpSession session) {
		int userNo=(int) session.getAttribute("userNo");
		String newPassword = request.getParameter("newPassword");
		dao.updatePassword(userNo,newPassword);
		
	}
	
	@RequestMapping("/mypage/updateAddress.do")
	@ResponseBody
	public void updateAddress(HttpServletRequest request, HttpSession session) {
		int userNo=(int) session.getAttribute("userNo");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address3 = request.getParameter("address3");
		dao.updateAddress(userNo,address1,address2,address3);
		
	}
}
