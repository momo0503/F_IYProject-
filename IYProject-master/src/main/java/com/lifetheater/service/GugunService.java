package com.lifetheater.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.lifetheater.vo.BasicTheaterVO;
import com.lifetheater.vo.GugunVO;
import com.lifetheater.vo.MergeBasicTheaterTicketInfoVO;
import com.lifetheater.vo.ReservationVO;
import com.lifetheater.vo.TheaterTimeVO;
import com.lifetheater.vo.TheaterVO;
import com.lifetheater.vo.TicketingInfoVO;

@Service
public interface GugunService {

	List<BasicTheaterVO> getTheater(String td_location);


	List<TheaterTimeVO> getTime(String theater_Name);


	int getTheaterNumber(MergeBasicTheaterTicketInfoVO mbttvo);


	MergeBasicTheaterTicketInfoVO getTheaterInfo(MergeBasicTheaterTicketInfoVO td);


	MergeBasicTheaterTicketInfoVO getTinfo(MergeBasicTheaterTicketInfoVO td);


	void insertResInfo(ReservationVO revo);


//
//
//	BasicTheaterVO getTheaterInfo2(int td_no);
//
//
//	MergeBasicTheaterTicketInfoVO getTheaterInfo3(int td_no);


	

	//List<GugunVO> getGugun(int sido_code);

	//List<TheaterVO> getGugunName(String gugun_name);

	//List<TheaterDListVO> getTheaterTime(String theater_name);
	

}
