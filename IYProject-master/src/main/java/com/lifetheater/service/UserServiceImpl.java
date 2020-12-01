package com.lifetheater.service;

import java.util.Random;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.lifetheater.dao.UserDAO;
import com.lifetheater.kakao.model.KakaoVO;
import com.lifetheater.naver.model.NaverVO;
import com.lifetheater.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {


	@Autowired
	private JavaMailSender mailSender;

	@Autowired 
	private UserDAO UserDao;
	
	private String init() {//랜덤 키 값 생성 메소드
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {//영문 대소문자 숫자 범위
				sb.append((char) num);//String 문자열 증가
			} else {
				continue;
			}

		} while (sb.length() < size);//StringBuffer길이 만큼만 반복
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}

	// user_key의 대소문자 구분 및 길이 조건
	private boolean lowerCheck;
	private int size;

	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;//대소문자 구분 유무
		this.size = size;//길이
		return init();
	}

	@Override
	public void mailSendWithUserKey(UserVO user, HttpServletRequest request) {
		String key = getKey(false, 20);//대소문자 구분 유무 및 길이 설정
		user.setUserKey(key);//랜덤 키값 저장
		System.out.printf(user.getEmail(),user.getName(),user.getUserKey(),user.getPhone());//중간 확인
		this.UserDao.sendEmail(user);//랜덤 키값이 추가된 회원정보 db저장

		MimeMessage mail = mailSender.createMimeMessage(); 
		String htmlStr = "<h2>안녕하세요 MS :p 혜아~ 입니다!</h2><br><br>" 
				+ "<h3>" + user.getName() + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
				+ "<a href='http://localhost:8011/controller/MemberShip_email_ch?email="+ user.getEmail() +"&userKey="+key+"'>인증하기</a></p>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";//이메일 본문 내용
		try {
			mail.setSubject("[본인인증] IY : 인연 인증메일입니다", "utf-8");//이메일 제목
			mail.setText(htmlStr, "utf-8", "html");//이메일 본문내용 및 설정
			mail.addRecipient(RecipientType.TO, new InternetAddress(user.getEmail()));
			mailSender.send(mail);//이메일 보내기
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	@Override
	public String confirmEmail(UserVO user) {
		return this.UserDao.confirmEmail(user);
	}

	@Override
	public void change_key(UserVO user) {
		this.UserDao.change_key(user);
		
	}

	@Override
	public String confirmPhone(UserVO user) {
		return this.UserDao.confirmPhone(user);
	}
	
	
	
	@Override
	public UserVO searchUser(UserVO id) {
		return this.UserDao.searchUser(id) ;
	}

	/*
	 * @Override public void keepLogin(String sessionId, Date limitDate, String
	 * email) { Map<String, Object> sessionData=new HashMap<String, Object>();
	 * sessionData.put("sessionId", sessionId); sessionData.put("limitDate",
	 * limitDate); sessionData.put("email", email);
	 * 
	 * mapper.keepLogin(sessionData);
	 * 
	 * }
	 */
	/*
	 * @Override public UserVO getUserSessionId(String sessionId) {
	 * 
	 * return mapper.getUserSessionId(sessionId); }
	 */

	@Override
	public NaverVO searchNaver(NaverVO id) {
		return this.UserDao.searchNaver(id);
	}

	@Override
	public void naverinsert(NaverVO insert) {
		this.UserDao.naverinsert(insert);
	}
	
	public void naverupdate(UserVO update) {
		this.UserDao.naverupdate(update);
	}

	@Override
	public KakaoVO searchKakao(KakaoVO id) {
		
		return this.UserDao.searchKakao(id);
	}

	@Override
	public void kakaoinsert(KakaoVO insert) {
		this.UserDao.kakaoinsert(insert);
		
	}

	@Override
	public void kakaoupdate(UserVO update) {
		this.UserDao.kakaoupdate(update);
		
	}

	@Override
	public UserVO searchid(UserVO id) {	
		return this.UserDao.searchid(id);
	}

	@Override
	public UserVO searchpw(UserVO pw) {
		return this.UserDao.searchpw(pw);
	}

	@Override
	public void pwupdate(UserVO pw) {
		this.UserDao.pwupdate(pw);
	}

	





}
