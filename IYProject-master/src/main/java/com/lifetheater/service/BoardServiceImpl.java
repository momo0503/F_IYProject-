package com.lifetheater.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lifetheater.dao.BoardDAO;
import com.lifetheater.vo.FBoardContVO;
import com.lifetheater.vo.FBoardVO;
import com.lifetheater.vo.NBoardContVO;
import com.lifetheater.vo.NBoardVO;
import com.lifetheater.vo.PBoardContVO;
import com.lifetheater.vo.PBoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO BoardDao;
	

	@Override
	public void fBoardInsert(FBoardVO fBoardVO) {
		if(fBoardVO.getFb_img_url() == null)
			this.BoardDao.fBoardNoImgInsert(fBoardVO);
		else 
			this.BoardDao.fBoardInsert(fBoardVO);
	}

	@Override
	public void pBoardInsert(PBoardVO pBoardVO) {
		if(pBoardVO.getPb_img_url() == null)
			this.BoardDao.pBoardNoImgInsert(pBoardVO);
		else 
			this.BoardDao.pBoardInsert(pBoardVO);
	}

	@Override
	public void nBoardInsert(NBoardVO nBoardVO) {
		if(nBoardVO.getNb_img_url() == null)
			this.BoardDao.nBoardNoImgInsert(nBoardVO);
		else 
			this.BoardDao.nBoardInsert(nBoardVO);
		
	}
	
	@Transactional
	@Override
	public FBoardContVO selectFBCont(int fb_num) {
		FBoardContVO fb =  this.BoardDao.selectFBCont(fb_num);
		this.BoardDao.fHitUp(fb_num);
		return fb;
	}

	/*
	@Override
	public void fHitUp(int fb_num) {
		this.BoardDao.fHitUp(fb_num);
	}
	 */
	@Override
	public void fBoardUpdate(FBoardVO fBoardVO) {
		
		if(fBoardVO.getFb_img_url() == null)
			this.BoardDao.fBoardNoUpdate(fBoardVO);//추가이미지없는 업데이트
		else 
			this.BoardDao.fBoardUpdate(fBoardVO);//추가이미지 있는 업데이트
	}
	
	@Override
	public void pBoardUpdate(PBoardVO pBoardVO) {
		if(pBoardVO.getPb_img_url() == null)
			this.BoardDao.pBoardNoUpdate(pBoardVO);
		else 
			this.BoardDao.pBoardUpdate(pBoardVO);
	}

	@Override
	public void nBoardUpdate(NBoardVO nBoardVO) {
		if(nBoardVO.getNb_img_url() == null)
			this.BoardDao.nBoardNoUpdate(nBoardVO);
		else 
			this.BoardDao.nBoardUpdate(nBoardVO);
	}
	
	
	@Override
	public List<FBoardVO> getflist(FBoardVO fboard) {
		return this.BoardDao.getflist(fboard);
	}

	@Override
	public List<PBoardVO> getplist(PBoardVO pboard) {
		return this.BoardDao.getplist(pboard);
	}

	@Override
	public List<NBoardVO> getnlist(NBoardVO nboard) {
		return this.BoardDao.getnlist(nboard);
	}

	@Override
	public String getusername(String email) {
		return this.BoardDao.getusername(email);
	}

	@Override
	public int getFTotalCount(FBoardVO fboard) {
		return this.BoardDao.getFTotalCount(fboard);
	}

	@Override
	public int getPTotalCount(PBoardVO pboard) {
		return this.BoardDao.getPTotalCount(pboard);
	}

	@Override
	public int getNTotalCount(NBoardVO nboard) {
		return this.BoardDao.getNTotalCount(nboard);
	}
	
	@Override
	public void fBoardDelete(FBoardVO fBoardVO) {
		this.BoardDao.fBoardDelete(fBoardVO);
	}

	@Override
	public void pBoardDelete(PBoardVO pBoardVO) {
		this.BoardDao.pBoardDelete(pBoardVO);
	}

	@Override
	public void nBoardDelete(NBoardVO nBoardVO) {
		this.BoardDao.nBoardDelete(nBoardVO);
	}

	@Transactional
	@Override
	public NBoardContVO selectNBCont(int nb_num) {
		NBoardContVO nb =this.BoardDao.selectNBCont(nb_num);
		this.BoardDao.nHitUp(nb_num);
		return nb;
	}
/*
	@Override
	public void nHitUp(int nb_num) {
		this.BoardDao.nHitUp(nb_num);
	}
*/
	@Transactional
	@Override
	public PBoardContVO selectPBCont(int pb_num) {
		PBoardContVO pb=this.BoardDao.selectPBCont(pb_num);
		this.BoardDao.pHitUp(pb_num);
		return pb;
	}
/*
	@Override
	public void pHitUp(int pb_num) {
		this.BoardDao.pHitUp(pb_num);
	}
*/

	@Override
	public FBoardVO selectFCont(int fb_num) {
		return this.BoardDao.selectFCont(fb_num);
	}

	@Override
	public NBoardVO selectNCont(int nb_num) {
		return this.BoardDao.selectNCont(nb_num);
	}

	@Override
	public PBoardVO selectPCont(int pb_num) {
		return this.BoardDao.selectPCont(pb_num);
	}


	
	
}
