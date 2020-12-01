package com.lifetheater.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lifetheater.dao.SupportDAO;
import com.lifetheater.vo.SupportHelpVO;

@Service
public class SupportServiceImpl implements SupportService {

	@Autowired
	SupportDAO supportDAO;

	@Override
	public List<SupportHelpVO> getHelpList(SupportHelpVO shvo) {
		return supportDAO.getHelpList(shvo);
	}
}
