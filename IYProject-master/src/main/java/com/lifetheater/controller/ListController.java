package com.lifetheater.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ListController {

	@GetMapping("/IY_detailPage")
	public String detailPage(){
		
		return "list_info/detailPage";
	}
	@GetMapping("/IY_listLoad")
	public String listLoad() {
		
		return "list_info/listLoad";
	}
}
