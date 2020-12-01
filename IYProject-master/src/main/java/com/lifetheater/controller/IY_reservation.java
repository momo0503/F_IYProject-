package com.lifetheater.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.lifetheater.service.GugunService;
import com.lifetheater.vo.MergeBasicTheaterTicketInfoVO;
import com.lifetheater.vo.ReservationVO;
import com.lifetheater.vo.UserVO;

@Controller
public class IY_reservation {


	@Autowired
	private GugunService gugunService;
	

	
	@GetMapping("IY_res-conts")
	public String resConts(){
		
		return "reservation/res-conts";
	}

	@GetMapping("IY_re02")
	public String fastreservation02(Model m,HttpServletRequest request,HttpServletResponse response) {
		try {
		System.out.println("==============IY_re02============");
		response.setCharacterEncoding("UTF-8");
		String td_locationI =request.getParameter("td_locationI");
		String theater_nameI =request.getParameter("theater_nameI");
		String td_runtimeI =request.getParameter("td_runtimeI");
		System.out.println(td_locationI);
		System.out.println(theater_nameI);
		System.out.println(td_runtimeI);
		//3개 가져왔어 그 3개의값을 vo에 담아서 db에가서 3개의 정보와 일치하는 no를 가져온다.
		MergeBasicTheaterTicketInfoVO mbttvo = new MergeBasicTheaterTicketInfoVO();
		mbttvo.setTd_location(td_locationI);
		mbttvo.setTd_title(theater_nameI);
		mbttvo.setTd_runtime(td_runtimeI);
		
		int td_no = this.gugunService.getTheaterNumber(mbttvo);
				//this.gugunService.getTheaterNumber();
		System.out.println(td_no);
		mbttvo.setTd_no(td_no);
	//그뒤 no에 일치하는 연극정보를 가져온다.
		MergeBasicTheaterTicketInfoVO mbttvo2 = this.gugunService.getTheaterInfo(mbttvo);
		
		System.out.println("==========================mbttvo===============");
		System.out.println(mbttvo.getTd_no());
		System.out.println(mbttvo.getEmail());
		System.out.println(mbttvo.getTd_title());
		System.out.println(mbttvo.getTd_viewdays());
		System.out.println(mbttvo.getTd_agegrade());
		System.out.println(mbttvo.getTd_actor());
		System.out.println(mbttvo.getTd_tinfo());
		System.out.println(mbttvo.getTd_mainposter());
		System.out.println(mbttvo.getTd_detailposter());
		System.out.println(mbttvo.getTd_ticketinginfo());
		System.out.println(mbttvo.getTd_check());
		System.out.println(mbttvo.getTd_signUp_date());
		System.out.println(mbttvo.getTd_location());
		System.out.println(mbttvo.getTicketing_no());
		System.out.println(mbttvo.getTd_runtime());
		System.out.println(mbttvo.getTd_stgrade());
		System.out.println((mbttvo.getTd_stprice()));
		
		System.out.println("==========================mbttvo2===============");
		System.out.println(mbttvo2.getTd_no());
		System.out.println(mbttvo2.getEmail());
		System.out.println(mbttvo2.getTd_title());
		System.out.println(mbttvo2.getTd_viewdays());
		System.out.println(mbttvo2.getTd_agegrade());
		System.out.println(mbttvo2.getTd_actor());
		System.out.println(mbttvo2.getTd_tinfo());
		System.out.println(mbttvo2.getTd_mainposter());
		System.out.println(mbttvo2.getTd_detailposter());
		System.out.println(mbttvo2.getTd_ticketinginfo());
		System.out.println(mbttvo2.getTd_check());
		System.out.println(mbttvo2.getTd_signUp_date());
		System.out.println(mbttvo2.getTd_location());
		System.out.println(mbttvo2.getTicketing_no());
		System.out.println(mbttvo2.getTd_runtime());
		System.out.println(mbttvo2.getTd_stgrade());
		System.out.println((mbttvo2.getTd_stprice()));
		
		String email = mbttvo2.getEmail();
		String td_title = mbttvo2.getTd_title();
		String td_viewdays = mbttvo2.getTd_viewdays();
		String td_agegrade = mbttvo2.getTd_agegrade();
		String td_actor = mbttvo2.getTd_actor();
		String td_tinfo = mbttvo2.getTd_tinfo();
		String td_mainposter = mbttvo2.getTd_mainposter();
		String td_detailposter = mbttvo2.getTd_detailposter();
		String td_ticketinginfo = mbttvo2.getTd_ticketinginfo();
		Date td_signUp_date = mbttvo2.getTd_signUp_date();
		String td_check = mbttvo2.getTd_location();
		String td_location = mbttvo2.getTd_location();
		//String ticketing_no = 
		String td_runtime = mbttvo2.getTd_runtime();
		String td_stgrade = mbttvo2.getTd_stgrade();
		String td_stprice = mbttvo2.getTd_stprice();
		
	
		//그뒤 연극정보와 티켓팅정보를 서버에올림 -> model.어트리뷰트
		m.addAttribute("td_no",td_no);
		m.addAttribute("email",email);
		m.addAttribute("td_title",td_title);
		m.addAttribute("td_viewdays",td_viewdays);
		m.addAttribute("td_agegrade",td_agegrade);
		m.addAttribute("td_actor",td_actor);
		m.addAttribute("td_tinfo",td_tinfo);
		m.addAttribute("td_mainposter",td_mainposter);
		m.addAttribute("td_detailposter",td_detailposter);
		m.addAttribute("td_ticketinginfo",td_ticketinginfo);
		m.addAttribute("td_check",td_check);
		m.addAttribute("td_signUp_date",td_signUp_date);
		m.addAttribute("td_location",td_location);
		m.addAttribute("td_runtime",td_runtime);
		m.addAttribute("td_stgrade",td_stgrade);
		m.addAttribute("td_stprice",td_stprice);
		
		//model은 다음페이지까지만 데이터 쓸수있음.
		
	
		
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return "reservation/re02";
	}
	
	
	
	
	@GetMapping("IY_re03")
	public String fastreservation03(Model m,HttpServletRequest request,HttpServletResponse response) {
		try {
			System.out.println("==============IY_re03============");
			response.setCharacterEncoding("UTF-8");
			String td_location =request.getParameter("td_locationI");
			String td_title =request.getParameter("theater_nameI");
			String td_runtime =request.getParameter("td_runtimeI");
			String td_stprice =request.getParameter("td_stpriceI");
			String value1 =request.getParameter("value1I");
			String cost2 =request.getParameter("cost2I");
			String totalCost =request.getParameter("totalCostI");
			String td_mainposter = request.getParameter("td_mainposterI");
			
			System.out.println(td_location);
			System.out.println(td_title);
			System.out.println(td_runtime);
			System.out.println(td_stprice);
			System.out.println(value1);
			System.out.println(cost2);
			System.out.println(totalCost);
			System.out.println(td_mainposter);

			m.addAttribute("td_location",td_location);
			m.addAttribute("td_title",td_title);
			m.addAttribute("td_runtime",td_runtime);
			m.addAttribute("td_stprice",td_stprice);
			m.addAttribute("value1",value1);
			m.addAttribute("cost2",cost2);
			m.addAttribute("totalCost",totalCost);
			m.addAttribute("td_mainposter",td_mainposter);
			
			MergeBasicTheaterTicketInfoVO mbttvo = new MergeBasicTheaterTicketInfoVO();
			mbttvo.setTd_location(td_location);
			mbttvo.setTd_title(td_title);
			mbttvo.setTd_runtime(td_runtime);
			
			int td_no = this.gugunService.getTheaterNumber(mbttvo);
			
			System.out.println("td_no ="+td_no);
			
			//번호로 td_tinfo값 가져오기 
			mbttvo.setTd_no(td_no);
			MergeBasicTheaterTicketInfoVO mbttvo3 = this.gugunService.getTinfo(mbttvo);
			
			System.out.println(mbttvo3.getTd_tinfo());
			String td_tinfo = mbttvo3.getTd_tinfo();
			m.addAttribute("td_tinfo",td_tinfo);
			m.addAttribute("mbttvo", mbttvo3);
		}catch(Exception e) {
			System.out.println(e);
		}
		return "reservation/re03";
	} //IY_re03
	
	
	
	@GetMapping("IY_re04")
	public String fastreservation04(Model m,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		try {
			System.out.println("==============IY_re04============");
			response.setCharacterEncoding("UTF-8");
			String td_location =request.getParameter("td_locationI");
			String td_title =request.getParameter("theater_nameI");
			String td_runtime =request.getParameter("td_runtimeI");
			String td_stprice =request.getParameter("td_stpriceI");
			String value1 =request.getParameter("value1I");
			String cost2 =request.getParameter("cost2I");
			String totalCost =request.getParameter("totalCostI");
	
			System.out.println(td_location);
			System.out.println(td_title);
			System.out.println(td_runtime);
			System.out.println(td_stprice);
			System.out.println(value1);
			System.out.println(cost2);
			System.out.println(totalCost);

			ReservationVO revo = new ReservationVO();
			//디비에 입력하기 이제 ReservationVO 통해서
			
			revo.setTd_location(td_location);
			revo.setTd_title(td_title);
			revo.setTd_runtime(td_runtime);
			revo.setTd_stprice(td_stprice);
			revo.setValue1(value1);
			revo.setTotalCost(totalCost);
			
			String email= null;
			if(session.getAttribute("login") != null) {
				UserVO uservo = (UserVO)session.getAttribute("login");
				email = uservo.getEmail();
			}
			revo.setEmail(email);
			
				
			this.gugunService.insertResInfo(revo);
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return "reservation/re04";
	}
}
