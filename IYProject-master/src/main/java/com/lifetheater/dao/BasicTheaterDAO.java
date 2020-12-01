package com.lifetheater.dao;

import java.util.List;

import com.lifetheater.vo.BasicTheaterVO;
import com.lifetheater.vo.TicketingInfoVO;

public interface BasicTheaterDAO {

	int theaterDInsert(BasicTheaterVO theaterVO); //이미지 있는 게시판 등록
	
	void theaterImgInsert(BasicTheaterVO theaterVO);
	
	BasicTheaterVO basictheaterCont(int td_no); //시퀀스 번호 기준으로 내용 가져오기
	
	void theaterDUpdate(BasicTheaterVO theaterVO); //게시물 수정

	void theaterDDelete(BasicTheaterVO theaterVO); //게시물 삭제
	
	public List<BasicTheaterVO> gettdlist(BasicTheaterVO theaterboard); // 게시물 list로 넘길때 사용

	void ticketInsert(TicketingInfoVO ticketVO);
	
}
