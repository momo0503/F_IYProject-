package com.lifetheater.dao;

import java.util.List;

import com.lifetheater.vo.SupportHelpVO;

public interface SupportDAO {

	List<SupportHelpVO> getHelpList(SupportHelpVO shvo);

	
}
