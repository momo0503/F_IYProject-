package com.lifetheater.service;

import java.util.List;

import com.lifetheater.dao.BasicTheaterDAO;
import com.lifetheater.vo.BasicTheaterVO;
import com.lifetheater.vo.TicketingInfoVO;


public interface BasicTheaterService {

	int basictheaterInsert(BasicTheaterVO basictheaterVO); //이미지 있는 게시판 등록

	void basictheaterImgInsert(BasicTheaterVO basicTheaterVO); //이미지 삽입
	
	
	BasicTheaterVO basictheaterCont(int td_no); //시퀀스 번호 기준으로 내용 가져오기
	
	void basictheaterUpdate(BasicTheaterVO basictheaterVO); //게시물 수정

	void basictheaterDelete(BasicTheaterVO basictheaterVO); //게시물 삭제
	
	List<BasicTheaterVO> gettdlist(BasicTheaterVO basictheaterVO); // 게시물 list로 넘길때 사용
	
	void ticketInsert(TicketingInfoVO ticketVO);
	
	
	
}
