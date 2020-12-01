package com.lifetheater.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lifetheater.vo.BasicTheaterVO;
import com.lifetheater.vo.MergeBasicTheaterTicketInfoVO;
import com.lifetheater.vo.ReservationVO;
import com.lifetheater.vo.TheaterTimeVO;

@Service
public class GugunDAOImpl implements GugunDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BasicTheaterVO> getTheater(String td_location) {
		
		return this.sqlSession.selectList("glist",td_location);
	}

	@Override
	public List<TheaterTimeVO> getTime(String theater_Name) {

		return this.sqlSession.selectList("g2list",theater_Name);
	}

	@Override
	public int getTheaterNumber(MergeBasicTheaterTicketInfoVO mbttvo) {
		
		return this.sqlSession.selectOne("td_no",mbttvo);
	}

	@Override
	public MergeBasicTheaterTicketInfoVO getTheaterNumber2(MergeBasicTheaterTicketInfoVO td) {
		System.out.println("번호 : "+td.getTd_no());
		System.out.println("날짜 : "+td.getTd_runtime());
		return this.sqlSession.selectOne("mbttvo2",td);
	}

	@Override
	public MergeBasicTheaterTicketInfoVO getTinfo(MergeBasicTheaterTicketInfoVO td) {
		
		return this.sqlSession.selectOne("mbttvo3",td);
	}

	@Override
	public void insertResInfo(ReservationVO revo) {
		this.sqlSession.insert("revo",revo);
		
	}


//	@Override
//	public BasicTheaterVO getTheaterInfo2(int td_no) {
//		return this.sqlSession.selectOne("btvo",td_no);
//	}
//
//	@Override
//	public MergeBasicTheaterTicketInfoVO getTheaterInfo3(int td_no) {
//		
//		return this.sqlSession.selectOne("mbttvo",td_no);
//	}



	
//	@Override
//	public List<GugunVO> getGugun(int sido_code) {
//		
//		//return this.sqlSession.selectOne("glist", sido_code);
//		return this.sqlSession.selectList("glist", sido_code);
//	}
//
//	@Override
//	public List<TheaterVO> getGugunName(String gugun_name) {
//		return this.sqlSession.selectList("g2list",gugun_name);
//	}
//
//	@Override
//	public List<TheaterDListVO> getTheaterTime(String theater_name) {
//		
//		return this.sqlSession.selectList("g3list",theater_name);
//	}

	
	

}
