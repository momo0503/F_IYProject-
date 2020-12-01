package com.lifetheater.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.lifetheater.service.BasicTheaterService;
import com.lifetheater.vo.BasicTheaterVO;


@Controller
public class BasicTheaterController {
	
	@Autowired
	private BasicTheaterService Service;

	@GetMapping("/IY_theater_list") //뷰페이지 리스트
	public String theater_list(Model m, HttpServletRequest request, 
			@ModelAttribute BasicTheaterVO td) {
		
		List<BasicTheaterVO> tdlist = new ArrayList<BasicTheaterVO>();
		tdlist=Service.gettdlist(td);
		System.out.println("tlist : " + tdlist.size());
		 m.addAttribute("tdlist", tdlist);
		return "list_info/theater_list";
	}
	
	@GetMapping("/IY_theater_view") //뷰페이지 상세 작성
	public String theater_view(int td_no, Model m, HttpServletRequest request ) throws Exception {
		request.setCharacterEncoding("utf-8");
		BasicTheaterVO btview = this.Service.basictheaterCont(td_no);
		m.addAttribute("btview",btview); 
		return "list_info/theater_view";
	}
	
	@GetMapping("/IY_theater_write") //작성 페이지
	public String theater_write() {
		return "list_info/theater_write";
	}
	
	/* @GetMapping("/IY_theater_schedule") //뷰페이지 달력 선택 작성api
	//@RequestBody
	public String theater_schedule(@RequestBody BasicTheaterVO vo, Model m) {
		m.addAttribute("Info",vo);
		return "list_info/theater_schedule";
	} */
	
	

	
}
