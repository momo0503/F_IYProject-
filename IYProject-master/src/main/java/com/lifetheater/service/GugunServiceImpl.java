package com.lifetheater.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lifetheater.dao.GugunDAO;
import com.lifetheater.vo.BasicTheaterVO;
import com.lifetheater.vo.MergeBasicTheaterTicketInfoVO;
import com.lifetheater.vo.ReservationVO;
import com.lifetheater.vo.TheaterTimeVO;

@Service
public class GugunServiceImpl implements GugunService {

	@Autowired
	private GugunDAO gugunDao;

	@Override
	public List<BasicTheaterVO> getTheater(String td_location) {
		
		return this.gugunDao.getTheater(td_location);
	}


	@Override
	public List<TheaterTimeVO> getTime(String theater_Name) {
		return this.gugunDao.getTime(theater_Name);
	}


	@Override
	public int getTheaterNumber(MergeBasicTheaterTicketInfoVO mbttvo) {
		
		return this.gugunDao.getTheaterNumber(mbttvo);
	}


	@Override
	public MergeBasicTheaterTicketInfoVO getTheaterInfo(MergeBasicTheaterTicketInfoVO td) {

		return this.gugunDao.getTheaterNumber2(td);
	}


	@Override
	public MergeBasicTheaterTicketInfoVO getTinfo(MergeBasicTheaterTicketInfoVO td) {
		
		return this.gugunDao.getTinfo(td);
	}

	
	@Override
	public void insertResInfo(ReservationVO revo) {
		
		this.gugunDao.insertResInfo(revo);
		
	}



//
//	@Override
//	public BasicTheaterVO getTheaterInfo2(int td_no) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//
//	@Override
//	public MergeBasicTheaterTicketInfoVO getTheaterInfo3(int td_no) {
//		// TODO Auto-generated method stub
//		return null;
//	}


//	@Override
//	public List<BasicTheaterVO> getTheaterInfo(int td_no) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//
//	@Override
//	public BasicTheaterVO getTheaterInfo2(int td_no) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//
//	@Override
//	public MergeBasicTheaterTicketInfoVO getTheaterInfo3(int td_no) {
//		// TODO Auto-generated method stub
//		return null;
//	}


//	@Override
//	public List<BasicTheaterVO> getTheaterInfo(int td_no) {
//		return this.gugunDao.getTheaterInfo(td_no);
//	}
//
//
//	@Override
//	public BasicTheaterVO getTheaterInfo2(int td_no) {
//	
//		return this.gugunDao.getTheaterInfo2(td_no);
//	}
//
//
//	@Override
//	public MergeBasicTheaterTicketInfoVO getTheaterInfo3(int td_no) {
//		
//		return this.gugunDao.getTheaterInfo3(td_no);
//	}
	
	
//	@Override
//	public List<GugunVO> getGugun(int sido_code) {
//		
//		return this.gugunDao.getGugun(sido_code);
//	}
//
//
//	@Override
//	public List<TheaterVO> getGugunName(String gugun_name) {
//		
//		return this.gugunDao.getGugunName(gugun_name);
//	}
//
//
//	@Override
//	public List<TheaterDListVO> getTheaterTime(String theater_name) {
//		
//		return this.gugunDao.getTheaterTime(theater_name);
//	}

	
	

	
	
}
