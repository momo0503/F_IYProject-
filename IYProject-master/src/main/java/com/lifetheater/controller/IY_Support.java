package com.lifetheater.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lifetheater.service.SupportService;
import com.lifetheater.vo.SupportHelpVO;

@Controller
public class IY_Support {

	// QnA info by db
	@Autowired
	SupportService supportService;
	
	// home - faq
	@GetMapping("support")
	public String support() {
		return "support/support";
	}//support()
	
	@GetMapping("IY_mypage_inquiry")
	public String Support_inquiry() {
		
		return "support/support_inquiry";
	}
	
	@RequestMapping("support_help_list")
	@ResponseBody
	public List<SupportHelpVO> getSupportHelpList(HttpServletRequest request,@RequestParam("condition")String condi,@RequestParam("keyword")String keyword) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		SupportHelpVO shvo = new SupportHelpVO();
		System.out.println("condition : " + condi+"  keyword : " + keyword);
		if(!keyword.equals("전체")) {
			shvo.setCondition(condi);
			
		}
		shvo.setKeyword(keyword);
		// load support db data
		List<SupportHelpVO> list = supportService.getHelpList(shvo);
		
		System.out.println("support list size : "+ list.size());
		
		return list;
		
	}// getSupportHElpList()
}
