package com.lifetheater.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IY_error {
	
	@GetMapping("/error")
	private String error() {
		return "error/error";
	}
	

}
