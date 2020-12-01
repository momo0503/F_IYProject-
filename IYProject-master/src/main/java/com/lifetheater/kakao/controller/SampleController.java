package com.lifetheater.kakao.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lifetheater.kakao.service.KakaoPay;
import com.lifetheater.service.GugunService;
import com.lifetheater.vo.ReservationVO;

import lombok.Setter;
import lombok.extern.java.Log;

@Log
@Controller
public class SampleController {
    
	@Autowired
	private GugunService gugunService;
	
	@Setter(onMethod_ = @Autowired)
    private KakaoPay kakaopay;
    
    
    @GetMapping("/kakaoPay")
    public void kakaoPayGet() {
        
    }
    
    @PostMapping("/kakaoPay")
    public String kakaoPay(HttpServletRequest request) {
        log.info("kakaoPay post............................................");
        //System.out.println("kakaoPayReady : "+kakaopay.kakaoPayReady());
        ReservationVO vo = new ReservationVO();
        vo.setTd_title(request.getParameter("td_title"));
        vo.setTotalCost(request.getParameter("totalCost"));
        vo.setEmail(request.getParameter("email"));
        vo.setTd_runtime(request.getParameter("td_runtime"));
        vo.setValue1(request.getParameter("value1"));
        vo.setTd_stprice(request.getParameter("td_stprice"));
        vo.setTd_location(request.getParameter("td_location"));
        
        return "redirect:" + kakaopay.kakaoPayReady(vo);
 
    }
    
    @GetMapping("/kakaoPaySuccess")
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model,@RequestParam("td_title") String td_title,@RequestParam("totalCost") String totalCost,@RequestParam("email") String email,@RequestParam("td_runtime") String td_runtime,@RequestParam("value1") String value1,@RequestParam("td_stprice") String td_stprice,@RequestParam("td_location") String td_location) {
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        ReservationVO vo = new ReservationVO();
        vo.setTd_title(td_title);
        vo.setTotalCost(totalCost);
        vo.setEmail(email);
        vo.setTd_runtime(td_runtime);
        vo.setValue1(value1);
        vo.setTd_stprice(td_stprice);
        vo.setTd_location(td_location);
        this.gugunService.insertResInfo(vo);
        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
        model.addAttribute("vo",vo);
        return "/reservation/kakaoPaySuccess";
        
    }
    
}
