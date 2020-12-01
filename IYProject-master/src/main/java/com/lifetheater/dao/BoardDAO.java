package com.lifetheater.dao;

import java.util.List;

import com.lifetheater.vo.FBoardContVO;
import com.lifetheater.vo.FBoardVO;
import com.lifetheater.vo.NBoardContVO;
import com.lifetheater.vo.NBoardVO;
import com.lifetheater.vo.PBoardContVO;
import com.lifetheater.vo.PBoardVO;

public interface BoardDAO {


	void fBoardInsert(FBoardVO fBoardVO);

	void fBoardNoImgInsert(FBoardVO fBoardVO);

	void pBoardNoImgInsert(PBoardVO pBoardVO);

	void pBoardInsert(PBoardVO pBoardVO);

	void nBoardNoImgInsert(NBoardVO nBoardVO);

	void nBoardInsert(NBoardVO nBoardVO);

	FBoardContVO selectFBCont(int fb_num);

	void fHitUp(int fb_num);

	void fBoardUpdate(FBoardVO fBoardVO);

	void fBoardNoUpdate(FBoardVO fBoardVO);
	
	public List<FBoardVO> getflist(FBoardVO fboard);
	
	public List<PBoardVO> getplist(PBoardVO pboard);
	
	public List<NBoardVO> getnlist(NBoardVO nboard);
	
	int getFTotalCount(FBoardVO fboard);
	
	int getPTotalCount(PBoardVO pboard);
	
	int getNTotalCount(NBoardVO nboard);
	
	public String getusername(String email);
	

	//게시물 삭제
	
	void fBoardDelete(FBoardVO fBoardVO);
	
	void pBoardDelete(PBoardVO pBoardVO);
	
	void nBoardDelete(NBoardVO nBoardVO);

	NBoardContVO selectNBCont(int nb_num);
	
	PBoardContVO selectPBCont(int pb_num);

	void pHitUp(int pb_num);
	
	void nHitUp(int nb_num);

	FBoardVO selectFCont(int fb_num);

	NBoardVO selectNCont(int nb_num);

	PBoardVO selectPCont(int pb_num);

	void pBoardNoUpdate(PBoardVO pBoardVO);

	void pBoardUpdate(PBoardVO pBoardVO);

	void nBoardNoUpdate(NBoardVO nBoardVO);

	void nBoardUpdate(NBoardVO nBoardVO);
	
}
