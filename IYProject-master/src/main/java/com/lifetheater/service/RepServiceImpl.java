package com.lifetheater.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lifetheater.dao.RepDAO;
import com.lifetheater.vo.FRepContVO;
import com.lifetheater.vo.FReplyVO;

@Service
public class RepServiceImpl implements RepService {
	
	@Autowired
	private RepDAO repDao;


	@Override
	public void repInsert(FReplyVO re) {
		this.repDao.repInsert(re);
	}

	@Override
	public List<FRepContVO> selectFreCont(int fb_num) {
		return this.repDao.selectFreCont(fb_num);
	}

	
	  @Override public int totalRep(int fb_num) {
		  return this.repDao.totalRep(fb_num); 
	  }
	 

	@Override
	public void rep_repInsert(FReplyVO re) {
		this.repDao.rep_repInsert(re);
		
	}

	@Override
	public void fReplyDelete(FRepContVO freply) {
		this.repDao.fReplyDelete(freply);
		
	}

	@Override
	public List<FRepContVO> selectFreCont2(int fb_num) {
		return this.repDao.selectFreCont2(fb_num);
	}

	@Override
	public void frepUpdate(FReplyVO rvo) {
		this.repDao.frepUpdate(rvo);
		
	}
	
}
