package com.lifetheater.scheduler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.lifetheater.dao.UserDAO;
import com.lifetheater.vo.UserVO;

@Component//xml에 스캔
public class IY_Scheduler {
	
	@Autowired 
	private UserDAO UserDao;
	
	//스케쥴러 등록
	@Scheduled(cron="0 0 12 * * *")//실행할 시간
	public void autoDelete() {
		this.UserDao.autoDelUser();
		System.out.println("이메일 미 인증자 삭제");
	}
}
