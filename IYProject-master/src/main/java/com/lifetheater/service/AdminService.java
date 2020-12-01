package com.lifetheater.service;

import java.util.List;

import com.lifetheater.vo.BasicTheaterListVO;
import com.lifetheater.vo.UserListVO;

public interface AdminService {

	int getTotalCount(UserListVO userListVO);

	List<UserListVO> getUserList(UserListVO userListVO);

	void general_memberCh(UserListVO user);

	void show_memberCh(UserListVO user);

	int getTotalTheaterCount(BasicTheaterListVO tdlvo);

	List<BasicTheaterListVO> getTheaterList(BasicTheaterListVO tdlvo);

	void tdCancle(int td_no);

	void tdApprove(int td_no);

}
