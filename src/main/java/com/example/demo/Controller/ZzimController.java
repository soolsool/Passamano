package com.example.demo.Controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.demo.dao.ZzimDao;

@Controller
public class ZzimController {

	@Autowired
	private ZzimDao dao;

	public void setDao(ZzimDao dao) {
		this.dao = dao;
	}

	@RequestMapping("/mypage/zzimProcess.do")
	public void zzimProcess(HttpServletRequest request,
			@RequestParam(value = "zzimProductNo[]") List<Integer> productNo, HttpSession session) {
		int userNo = (int) session.getAttribute("userNo");

		for (int i = 0; i < productNo.size(); i++) {
			if ((dao.checkBasket(userNo, (int) (productNo.get(i)))) == 0) {
				dao.insertBasket(userNo, (int) (productNo.get(i)));
			} else {
				dao.updateBasket(userNo, (int) (productNo.get(i)));
			}

		}

	}

	@RequestMapping("/mypage/deleteZzim.do")
	public void deleteZzim(HttpServletRequest request, @RequestParam(value = "zzim[]") List<Integer> zzimItem, HttpSession session) {
		int userNo=(int) session.getAttribute("userNo");
		for (int i = 0; i < zzimItem.size(); i++) {
			dao.deleteZzim(userNo, (int) (zzimItem.get(i)));
		}
	}
}
