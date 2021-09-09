package com.example.demo.Controller;

import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.example.demo.dao.MypageDao;
import com.example.demo.vo.ReviewVo;

@Controller
public class MypageController {
	@Autowired
	private MypageDao dao;

	public void setDao(MypageDao dao) {
		this.dao = dao;
	}

	@RequestMapping("/mypage.do")
	public void mypage(Model model) {
		int userNo = 4;

		// HttpSession session;
		// int userNo=(int) session.getAttribute("userNo");

		model.addAttribute("orderlist", dao.selectAllOrder(userNo));
		model.addAttribute("userInfo", dao.selectUser(userNo));
	}

	@RequestMapping(value = "/selectreview.do")
	public void selectReview(Model model) {
		int userNo = 4;
		// HttpSession session;
		// int userNo=(int) session.getAttribute("userNo");
		model.addAttribute("selectReview", dao.selectReview(userNo));
		model.addAttribute("userInfo", dao.selectUser(userNo));

	}

	@RequestMapping("/cart.do")
	public void cart(Model model) {
		int userNo = 4;
		// HttpSession session;
		// int userNo=(int) session.getAttribute("userNo");
		model.addAttribute("basket", dao.selectBasket(userNo));
		model.addAttribute("userInfo", dao.selectUser(userNo));
	}

	@RequestMapping("/zzim.do")
	public void zzim(Model model) {
		int userNo = 4;

		// HttpSession session;
		// int userNo=(int) session.getAttribute("userNo");
		model.addAttribute("zzim", dao.selectZzim(userNo));
		model.addAttribute("userInfo", dao.selectUser(userNo));
	}

	@RequestMapping(value = "/writereview.do")
	public void writeReview(Model model, HttpServletRequest request) {
		// HttpSession session = request.getSession(true);
		// int userNo=(int) session.getAttribute("userNo");
		int userNo = 4;
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		SimpleDateFormat Transformat = new SimpleDateFormat("yyyy-MM-dd");
		String orderDate = request.getParameter("orderDate");
		model.addAttribute("w", dao.selectProductDetail(userNo, productNo, orderDate));
	}

	@RequestMapping(value = "/writeReviewController.do")
	public ModelAndView writeReviewComplete(ReviewVo r, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("redirect:/selectreview.do");
		String path = request.getRealPath("/files/review_images");

		String reviewImg = null;
		MultipartFile uploadFile = r.getUploadFile();
		reviewImg = uploadFile.getOriginalFilename();
		if (reviewImg != null && !reviewImg.equals("")) {
			try {
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
			mav.addObject("msg", "상품등록에 실패하였습니다.");
			mav.setViewName("error");
		}

		return mav;
	}

	@RequestMapping("/profile.do")
	public void profile() {
	}

	@RequestMapping("/order.do")
	public void order() {
	}

	@RequestMapping("/orderProcess.do")
	public void orderProcess(Model model, HttpServletRequest request,
			@RequestParam(value = "basketProductNo[]", required = false) List<Integer> productNo,
			@RequestParam(value = "deliveryFee[]", required = false) List<Integer> deliveryFeeItem) {
		HttpSession session = request.getSession(true);
		// int userNo=(int) session.getAttribute("userNo");
		int userNo = 4;
		ArrayList<HashMap> list = new ArrayList<HashMap>();
		int num = productNo.size();
		for (int i = 0; i < num; i++) {

			HashMap map = new HashMap();
			map.put("productNo", (int) (productNo.get(i)));
			map.put("deliveryFee", (int) (deliveryFeeItem.get(i)));
			list.add(map);
			dao.deleteBasket(userNo, (int) (productNo.get(i)));
		}

		session.setAttribute("product", list);

	}

	@RequestMapping("/zzimProcess.do")
	public void zzimProcess(HttpServletRequest request,
			@RequestParam(value = "zzimProductNo[]") List<Integer> productNo) {
		HttpSession session = request.getSession(true);
		// int userNo=(int) session.getAttribute("userNo");
		int userNo = 4;

		for (int i = 0; i < productNo.size(); i++) {
			if ((dao.checkBasket(userNo, (int) (productNo.get(i)))) == 0) {
				dao.insertBasket(userNo, (int) (productNo.get(i)));
			} else {
				dao.updateBasket(userNo, (int) (productNo.get(i)));
			}

		}

	}

	@RequestMapping("/deleteBasket.do")
	public void deleteBasket(HttpServletRequest request, @RequestParam(value = "basket[]") List<Integer> basketItem) {

		// HttpSession session;
		// int userNo=(int) session.getAttribute("userNo");
		int userNo = 4;
		for (int i = 0; i < basketItem.size(); i++) {
			dao.deleteBasket(userNo, (int) (basketItem.get(i)));
		}
	}

	@RequestMapping("/deleteZzim.do")
	public void deleteZzim(HttpServletRequest request, @RequestParam(value = "zzim[]") List<Integer> zzimItem) {

		// HttpSession session;
		// int userNo=(int) session.getAttribute("userNo");
		int userNo = 4;
		for (int i = 0; i < zzimItem.size(); i++) {
			dao.deleteZzim(userNo, (int) (zzimItem.get(i)));
		}
	}

	@RequestMapping("/deleteReview.do")
	public ModelAndView deleteReview(HttpServletRequest request) {
		// HttpSession session;
		// int userNo=(int) session.getAttribute("userNo");
		ModelAndView mav = new ModelAndView("redirect:/selectreview.do");
		int userNo = 4;
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		dao.deleteReview(reviewNo);
		return mav;
	}

	@RequestMapping("/updateOrder.do")
	public void deleteOrder(Model model, HttpServletRequest request, @RequestParam(value = "productNum") int productNo,
			String orderManageReason) {

		// HttpSession session;
		// int userNo=(int) session.getAttribute("userNo");
		int userNo = 4;
		// ModelAndView mav = new ModelAndView("redirect:/mypage.do");
		dao.updateOrder(userNo, productNo, orderManageReason);

	}

}
