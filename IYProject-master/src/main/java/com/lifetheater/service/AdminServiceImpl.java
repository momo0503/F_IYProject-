package com.lifetheater.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lifetheater.dao.AdminDAO;
import com.lifetheater.vo.BasicTheaterListVO;
import com.lifetheater.vo.UserListVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO dao;

	@Override
	public int getTotalCount(UserListVO userListVO) {
		return this.dao.getTotalCout(userListVO);
	}

	@Override
	public List<UserListVO> getUserList(UserListVO userListVO) {
		return this.dao.getUserList(userListVO);
	}

	@Override
	public void general_memberCh(UserListVO user) {
		this.dao.general_memberCh(user);
		
	}

	@Override
	public void show_memberCh(UserListVO user) {
		this.dao.show_memberCh(user);
		
	}

	@Override
	public int getTotalTheaterCount(BasicTheaterListVO tdlvo) {
		return this.dao.getTotalTheaterCount(tdlvo);
	}

	@Override
	public List<BasicTheaterListVO> getTheaterList(BasicTheaterListVO tdlvo) {
		return this.dao.getTheaterList(tdlvo);
	}

	@Override
	public void tdCancle(int td_no) {
		this.dao.tdCancle(td_no);
	}

	@Override
	public void tdApprove(int td_no) {
		this.dao.tdApprove(td_no);
		
	}

}
