package com.lifetheater.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lifetheater.API.TheaterAPI;
import com.lifetheater.vo.TListVO;
import com.lifetheater.vo.TRankVO;
import com.lifetheater.vo.UserVO;


@Controller
public class IY_index {

	@GetMapping("/lifetheater")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/lifetheater/main_reco")
	@ResponseBody
	public ResponseEntity<List<TListVO>> getTodayReco(HttpSession session){
		/*
		 * String userId = (String)session.getAttribute("login"); List<TListVO> list;
		 * list = TheaterAPI.getInstance().getTheaterList();
		 */
		
		UserVO vo = (UserVO)session.getAttribute("login");//login이 vo로 저장되어있음
		String id = null;
		if(vo != null) {//로그인인상황
			id = vo.getEmail();
		}
		else {//비로그인인 상황
			id = null;
		}
		List<TListVO> list = TheaterAPI.getInstance().getTheaterList();
		//System.out.println("total len : " + list.size());
		List<TListVO> tmpList = new ArrayList<>();
		for(int i=0; i<4; i++) {
			int r = (int)(Math.random()*list.size());
			tmpList.add(list.get(r));
			//System.out.println(tmpList.get(i).getTheater_name());
		}
		ResponseEntity<List<TListVO>> entity = new ResponseEntity<>(tmpList,HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/lifetheater/main_rank/type={type}")
	@ResponseBody
	public ResponseEntity<List<TRankVO>> getTRank(@PathVariable("type") String type){
		//System.out.println("rank type : " + type);
		List<TRankVO> list = TheaterAPI.getInstance().getTRanking(type);
		
		List<TRankVO> tmpList = new ArrayList<>();
		
		for(int i=0; i<3; i++) {
			tmpList.add(list.get(i));
			//System.out.println("poster url  "+tmpList.get(i).getPoster_url());
		}
		return new ResponseEntity<List<TRankVO>>(tmpList,HttpStatus.OK);
	}
}
