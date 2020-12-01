package com.lifetheater.service;

import java.util.List;

import com.lifetheater.vo.FRepContVO;
import com.lifetheater.vo.FReplyVO;

public interface RepService {

	void repInsert(FReplyVO re);

	List<FRepContVO> selectFreCont(int fb_num);

	int totalRep(int fb_num);

	void rep_repInsert(FReplyVO re);
	
	void fReplyDelete(FRepContVO freply);

	List<FRepContVO> selectFreCont2(int fb_num);

	void frepUpdate(FReplyVO rvo);

}
