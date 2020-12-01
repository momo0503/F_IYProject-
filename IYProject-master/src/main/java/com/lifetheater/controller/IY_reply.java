package com.lifetheater.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.lifetheater.service.RepService;
import com.lifetheater.vo.FReplyVO;

@Controller
public class IY_reply {
	
	@Autowired
	private RepService repService;
	
	

}
