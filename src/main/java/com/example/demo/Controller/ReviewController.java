package com.example.demo.Controller;

import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.example.demo.dao.ReviewDao;
import com.example.demo.vo.ReviewVo;
@Controller
public class ReviewController {

	@Autowired
	private ReviewDao dao;

	public void setDao(ReviewDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value = "/mypage/writereview.do")
	public void writeReview(Model model, HttpServletRequest request, HttpSession session) {
		int userNo=(int) session.getAttribute("userNo");
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		SimpleDateFormat Transformat = new SimpleDateFormat("yyyy-MM-dd");
		String orderDate = request.getParameter("orderDate");
		model.addAttribute("w", dao.selectProductDetail(userNo, productNo, orderDate));
	}

	

	@RequestMapping(value = "/mypage/writeReviewController.do")
	public ModelAndView writeReviewComplete(ReviewVo r, HttpServletRequest request, HttpSession session) {
		int userNo=(int) session.getAttribute("userNo");
		ModelAndView mav = new ModelAndView("redirect:/mypage/selectreview.do");
		String path = request.getRealPath("/resources/images/reviewimage");
		String reviewImg = null;
		MultipartFile uploadFile = r.getUploadFile();
		reviewImg = uploadFile.getOriginalFilename();
		if (reviewImg != null && !reviewImg.equals("")) {
			try {
				Date today = new Date();
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMddHHmmss");
				String now = transFormat.format(today);
				reviewImg = now + userNo + reviewImg;// 이미지이름 중복방지

				byte[] data = uploadFile.getBytes();
				FileOutputStream fos = new FileOutputStream(path + "/" + reviewImg);
				fos.write(data);
				fos.close();
				r.setReviewImg(reviewImg);
			} catch (Exception e) {
				System.out.println("예외발생:" + e.getMessage());
			}

		}
		int re;

		if (reviewImg != null && !reviewImg.equals("")) {
			re = dao.insertReview(r);
		} else {
			re = dao.insertReviewImgNull(r);
		}
		if (re != 1) {
			mav.addObject("msg", "리뷰등록에 실패하였습니다.");
			mav.setViewName("error");
		}

		return mav;
	}
	
	@RequestMapping("/mypage/deleteReview.do")
	public ModelAndView deleteReview(HttpServletRequest request, HttpSession session) {
		int userNo=(int) session.getAttribute("userNo");
		ModelAndView mav = new ModelAndView("redirect:/mypage/selectreview.do");
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		dao.deleteReview(reviewNo);
		return mav;
	}
}
