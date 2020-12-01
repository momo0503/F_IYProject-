package com.lifetheater.service;

import java.util.List;

import com.lifetheater.vo.FBoardContVO;
import com.lifetheater.vo.FBoardVO;
import com.lifetheater.vo.NBoardContVO;
import com.lifetheater.vo.NBoardVO;
import com.lifetheater.vo.PBoardContVO;
import com.lifetheater.vo.PBoardVO;

public interface BoardService{


	void fBoardInsert(FBoardVO fBoardVO);

	void pBoardInsert(PBoardVO pBoardVO);

	void nBoardInsert(NBoardVO nBoardVO);

	FBoardContVO selectFBCont(int fb_num);

	//void fHitUp(int fb_num);



	void fBoardUpdate(FBoardVO fBoardVO);

	//리스트 목록
	List<FBoardVO> getflist(FBoardVO fboard);

	List<PBoardVO> getplist(PBoardVO pboard);

	List<NBoardVO> getnlist(NBoardVO nboard);

	int getFTotalCount(FBoardVO fboard);// F 총게시물수

	int getPTotalCount(PBoardVO pboard);// P 총게시물수

	int getNTotalCount(NBoardVO nboard);// N 총게시물수



	//게시판에서 사용할 작성자 이름을 가져오기
	String getusername(String email);


	//게시물 삭제

	void fBoardDelete(FBoardVO fBoardVO);

	void pBoardDelete(PBoardVO pBoardVO);

	void nBoardDelete(NBoardVO nBoardVO);

		NBoardContVO selectNBCont(int nb_num);

		PBoardContVO selectPBCont(int pb_num);

		//void pHitUp(int pb_num);
		
		//void nHitUp(int nb_num);

		FBoardVO selectFCont(int fb_num);

		NBoardVO selectNCont(int nb_num);

		PBoardVO selectPCont(int pb_num);

		void pBoardUpdate(PBoardVO pBoardVO);

		void nBoardUpdate(NBoardVO nBoardVO);

}
