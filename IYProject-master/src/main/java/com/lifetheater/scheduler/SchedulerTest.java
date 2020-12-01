package com.lifetheater.scheduler;
/*
package net.abc.scheduler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import net.abc.dao.UserDAO;
import net.abc.vo.UserVO;

@Component

public class SchedulerTest {
	
	@Autowired 
	private UserDAO UserDao;
	
	@Scheduled(cron="0 28 14 * * *")
	public void autoSelect() {
		
		List<UserVO> list = this.UserDao.selectUser();
		for(UserVO u : list) {
			System.out.println(u.getEmail());
			System.out.println(u.getPassword());
			System.out.println(u.getUsername());
			System.out.println(u.getUser_key());
			System.out.println(u.getCell_phone());
			System.out.println(u.getSub_date());
		}
		
		this.UserDao.testDel();
		System.out.println("삭제 성공");
	}
	
}
*/