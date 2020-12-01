package com.lifetheater.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lifetheater.vo.BasicTheaterListVO;
import com.lifetheater.vo.UserListVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getTotalCout(UserListVO userListVO) {
		return this.sqlSession.selectOne("getUserTotalCount",userListVO);
	}

	@Override
	public List<UserListVO> getUserList(UserListVO userListVO) {
		return this.sqlSession.selectList("getUserList", userListVO);
	}

	@Override
	public void general_memberCh(UserListVO user) {
		this.sqlSession.update("general_memberCh",user);
	}

	@Override
	public void show_memberCh(UserListVO user) {
		this.sqlSession.update("show_memberCh", user);
		
	}

	@Override
	public int getTotalTheaterCount(BasicTheaterListVO tdlvo) {
		return this.sqlSession.selectOne("getTotalTheaterCount",tdlvo);
	}

	@Override
	public List<BasicTheaterListVO> getTheaterList(BasicTheaterListVO tdlvo) {
		return this.sqlSession.selectList("getTheaterList",tdlvo);
	}

	@Override
	public void tdCancle(int td_no) {
		this.sqlSession.update("tdCancle", td_no);
	}

	@Override
	public void tdApprove(int td_no) {
		this.sqlSession.update("tdApprove", td_no);
		
	}
}
