package com.lifetheater.dao;

import java.util.List;

import com.lifetheater.vo.BasicTheaterVO;
import com.lifetheater.vo.MergeBasicTheaterTicketInfoVO;
import com.lifetheater.vo.ReservationVO;
import com.lifetheater.vo.TheaterTimeVO;

public interface GugunDAO {

//	List<GugunVO> getGugun(int sido_code);
//
//	List<TheaterVO> getGugunName(String gugun_name);
//
//	List<TheaterDListVO> getTheaterTime(String theater_name);

	List<BasicTheaterVO> getTheater(String td_location);


	List<TheaterTimeVO> getTime(String theater_Name);


	int getTheaterNumber(MergeBasicTheaterTicketInfoVO mbttvo);


	MergeBasicTheaterTicketInfoVO getTheaterNumber2(MergeBasicTheaterTicketInfoVO td);


	MergeBasicTheaterTicketInfoVO getTinfo(MergeBasicTheaterTicketInfoVO td);


	void insertResInfo(ReservationVO revo);




//	BasicTheaterVO getTheaterInfo2(int td_no);
//
//
//	MergeBasicTheaterTicketInfoVO getTheaterInfo3(int td_no);


}
	