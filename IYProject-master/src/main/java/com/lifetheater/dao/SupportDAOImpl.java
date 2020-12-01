package com.lifetheater.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lifetheater.vo.SupportHelpVO;

@Repository
public class SupportDAOImpl implements SupportDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<SupportHelpVO> getHelpList(SupportHelpVO shvo) {
		return sqlSession.selectList("support_help_list",shvo);
	}

}
