package com.lifetheater.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lifetheater.kakao.model.KakaoVO;
import com.lifetheater.naver.model.NaverVO;
import com.lifetheater.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void sendEmail(UserVO user) {
		System.out.printf("\n중간 확인dao:%s,%s,%s,%s,%s\n",user.getEmail(),user.getPw(),user.getName(),user.getPhone(),user.getUserKey());
		this.sqlSession.insert("Tem_email",user);
	}

	@Override
	public String confirmEmail(UserVO user) {
		return this.sqlSession.selectOne("conf_Email", user);
	}

	@Override
	public void change_key(UserVO user) {
		this.sqlSession.update("ch_key", user);
	}

	@Override
	public List<UserVO> selectUser() {
		return this.sqlSession.selectList("user_list");
	}

	@Override
	public void autoDelUser() {
		this.sqlSession.delete("auto_del");
	}

	@Override
	public void testDel() {
		this.sqlSession.delete("test_del");
	}

	@Override
	public String confirmPhone(UserVO user) {
		return this.sqlSession.selectOne("conf_phone", user);
	}

	@Override
	public UserVO searchUser(UserVO user) {
		return this.sqlSession.selectOne("searchUser", user);
	}

	@Override
	public UserVO searchid(UserVO id) {
		return this.sqlSession.selectOne("searchid", id);
	}

	@Override
	public UserVO searchpw(UserVO pw) {
		return this.sqlSession.selectOne("searchpw",pw);
	}

	@Override
	public void pwupdate(UserVO pw) {
		this.sqlSession.update("pwupdate",pw);
	}

	@Override
	public NaverVO searchNaver(NaverVO id) {
		return this.sqlSession.selectOne("searchNaver",id);
	}

	@Override
	public void naverinsert(NaverVO insert) {
		this.sqlSession.insert("naverinsert", insert);
	}

	@Override
	public void naverupdate(UserVO update) {
		this.sqlSession.update("naverupdate", update);
	}

	@Override
	public KakaoVO searchKakao(KakaoVO id) {
		return this.sqlSession.selectOne("searchKakao",id);
	}

	@Override
	public void kakaoinsert(KakaoVO insert) {
		this.sqlSession.insert("kakaoinsert", insert);
	}

	@Override
	public void kakaoupdate(UserVO update) {
		this.sqlSession.update("kakaoupdate", update);
	}
}
