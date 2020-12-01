package com.lifetheater.controller;


import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.lifetheater.service.BasicTheaterService;
import com.lifetheater.service.BoardService;
import com.lifetheater.service.GugunService;
import com.lifetheater.service.RepService;
import com.lifetheater.service.UserService;
import com.lifetheater.service.UserSha256;
import com.lifetheater.vo.BasicTheaterVO;
import com.lifetheater.vo.FBoardVO;
import com.lifetheater.vo.FRepContVO;
import com.lifetheater.vo.FReplyVO;
import com.lifetheater.vo.GugunVO;
import com.lifetheater.vo.LocationTitleTimeJsonVO;
import com.lifetheater.vo.NBoardVO;
import com.lifetheater.vo.PBoardVO;
import com.lifetheater.vo.TheaterTimeVO;
import com.lifetheater.vo.TicketingInfoVO;
import com.lifetheater.vo.UserVO;

@RestController
public class RestProjectController {//ajax로 문자열을 받기위해 사용

	@Autowired
	private UserService user_Service;
	@Autowired
	private RepService repService;
	@Autowired
	private GugunService gugunService;
	
	@Autowired
	private BoardService bservice;
	
	@Autowired
	private BasicTheaterService basicTheaterService;

	@RequestMapping(value="/confirmEmail",method=RequestMethod.POST)
	public ResponseEntity<String> confiem_email(@RequestBody UserVO user) {//이메일중복확인
		ResponseEntity<String> entity=null;

		try { 
		String result = this.user_Service.confirmEmail(user);
		System.out.println(result);
		if(result == null){ 
			entity = new ResponseEntity<String>("YES",HttpStatus.OK);
		} else { 
			entity = new ResponseEntity<String>("NO",HttpStatus.OK);
			}

		}catch(Exception e) { e.printStackTrace();entity = new
				ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST); }

		/* entity = new ResponseEntity<String>("YES",HttpStatus.OK); */
		return entity;
	}
	
	
	@RequestMapping(value="/confirmPhone",method=RequestMethod.POST)
	public ResponseEntity<String> confiem_phone(@RequestBody UserVO user) {//폰번호 중복 확인
		ResponseEntity<String> entity=null;
		
		try { 
			String result = this.user_Service.confirmPhone(user);
			System.out.println(result);
			if(result == null){ 
				entity = new ResponseEntity<String>("YES",HttpStatus.OK);
			} else { 
				entity = new ResponseEntity<String>("NO",HttpStatus.OK);
			}
			
		}catch(Exception e) { e.printStackTrace();entity = new
				ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST); }
		
		/* entity = new ResponseEntity<String>("YES",HttpStatus.OK); */
		return entity;
	}
	
	
		//로그인 요청 (사용자 정보를 세션 "login" 이름으로 담음)
		@PostMapping("/IY_login")
		public String login(@RequestBody UserVO uservo ,HttpSession session ,HttpServletResponse response,HttpServletRequest request) {					
			String result=null;
			UserVO user=user_Service.searchUser(uservo);
			
			//정보가 일치할시 로그인 성공
			if(user!=null) {
				System.out.println(user.getLoginWay());
				if(user.getLoginWay().equals("1")) {
				String user_pw = uservo.getPw();
		 		uservo.setPw(UserSha256.encrypt(user_pw));
				if(user.getPw().equals(uservo.getPw())) {
					if(user.getUserKey().equals("hye_ah")) {
					
					session.setAttribute("login", user);
					result="loginok";
					}else {
						result="loginno";
					}
				
					
					//자동로그인 체크시 발동
					if(uservo.getAutologin()) {
					/* Cookie loginCookie =new Cookie("loginCookie", session.getId()); */
						
						Cookie loginCookie =new Cookie("loginCookie",uservo.getEmail() );
					loginCookie.setPath("/");
					loginCookie.setMaxAge(60);
					response.addCookie(loginCookie);
					System.out.println(loginCookie.getValue());
					System.out.println(session.getId());
					
					//자동로그인 유지시간을 날짜객체로 변환
					/* Date limitDate =new Date(System.currentTimeMillis()+(1000*60 )); */
					
					//자동로그인 세션 정보 업데이트
					/* service.keepLogin(session.getId(),limitDate,id.getEmail()); */
			
					}
					//아이디 저장에 필요
					if(uservo.getLoginsave()) {
						Cookie cookiesave=WebUtils.getCookie(request,"loginsave");
						System.out.println("야야야야");
						System.out.println(cookiesave);
						if(cookiesave==null) {
							Cookie loginsave=new Cookie("loginsave", uservo.getEmail());
							loginsave.setPath("/");
							loginsave.setMaxAge(60);
							response.addCookie(loginsave);
							System.out.println("으으으");
							System.out.println(loginsave.getValue());
						}
					}else {
						Cookie loginsave=new Cookie("loginsave", "");
						loginsave.setPath("/");
						loginsave.setMaxAge(0);
						response.addCookie(loginsave);
					}
				}else {
					result="pwfail";
				}
			}
		}
			return result;
	
}	
		
		//로그아웃 요청
		@GetMapping("IY_logout")
		public ModelAndView logout(HttpSession session, HttpServletResponse response, HttpServletRequest request) {
			Cookie loginCookie =new Cookie("loginCookie", null);
			loginCookie.setPath("/");
			loginCookie.setMaxAge(0);
			response.addCookie(loginCookie);
			session.invalidate();
			
			
			return new ModelAndView("redirect:"+request.getHeader("REFERER"));
		}
		
		//이메일 아이디 찾기 요청
		@PostMapping("IY_searchid")
		public String searchid(@RequestBody UserVO uservo) {
			UserVO user=user_Service.searchid(uservo);
			String id=user.getEmail();
			return id;
		}
		
		
		//비밀번호 찾기 요청
		@PostMapping("IY_searchpw")
		public String searchpw(@RequestBody UserVO uservo) {
			String check="no";
			UserVO user=user_Service.searchpw(uservo);
			
			
			if(user!=null) {
				check="ok";
			}
							
			return check;
		}
		
		//비밀번호 변경 요청
		@PostMapping(value = "IY_pwupdate",produces ="application/text; charset=utf8")
		public String pwupdate(@RequestBody UserVO uservo) {
			String pw = uservo.getPw();
			uservo.setPw(UserSha256.encrypt(pw));
			user_Service.pwupdate(uservo);
			String ok="비밀번호 변경 완료";
			return ok;
		}
		
		@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json")
		public Object uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
			Map<String, Object> object = new HashMap<String, Object>();
			
			String fileRoot = "C:\\summernote\\board\\";	//저장될 외부 파일 경로
			
			String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
			String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
			
			File targetFile = new File(fileRoot + savedFileName);	
			
			try {
				InputStream fileStream = multipartFile.getInputStream();
				FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
				System.out.println("파일 저장 성공");
			/*
			 * object.put("url",fileRoot); object.put("fileName", savedFileName);
			 */
				object.put("url","/controller/summernote/board/"+savedFileName);
			System.out.println("등록 성공");
			} catch (IOException e) {
				FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
				object.put("responseCode", "error");
				e.printStackTrace();
				System.out.println("에러발생");
			}
			return object;
		}
		
		
		@PostMapping("/fb_rep_insert")
		public ResponseEntity<Void> fb_rep_insert(@RequestBody FReplyVO re) {
			ResponseEntity<Void> entity = null;
			try { 
				System.out.println("일반 댓글 실행됨");
				this.repService.repInsert(re);
					entity = new ResponseEntity<Void>(HttpStatus.OK);
	
			}catch(Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
		@PostMapping("/fb_rep_rep_insert")
		public ResponseEntity<Void> fb_rep_rep_insert(@RequestBody FReplyVO re) {
			ResponseEntity<Void> entity = null;
			try { 
				System.out.println("중간 확인 : "+re.getFb_reply_reply_name()+", "+re.getFb_reply_reply_cont());
				this.repService.rep_repInsert(re);
				entity = new ResponseEntity<Void>(HttpStatus.OK);
				
			}catch(Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}

		
		@PostMapping("/fbdelete")
		public void fbdelete(@RequestBody FBoardVO fboard) {
			System.out.println(fboard.getFb_num());
			bservice.fBoardDelete(fboard);
		}
		
		@PostMapping("/pbdelete")
		public void pbdelete(@RequestBody PBoardVO pboard) {
			System.out.println(pboard.getPb_num());
			bservice.pBoardDelete(pboard);
			
		}
		
		@PostMapping("/nbdelete")
		public void nbdelete(@RequestBody NBoardVO nboard) {
			System.out.println(nboard.getNb_num());
			bservice.nBoardDelete(nboard);	
			
			
		}
		
		@PostMapping("/fbreplydelete")
		public void fbreplydelete(@RequestBody FRepContVO freply) {
			System.out.println(freply);
			repService.fReplyDelete(freply);
		}
		
		@PostMapping("frep_update")
		public ResponseEntity<Void> frepUpdate(@RequestBody FReplyVO rvo){
			ResponseEntity<Void> entity = null;
			try {
				System.out.println("rvo중간 확인 : "+rvo.getFreply_num()+", "+rvo.getFb_reply_cont());
				this.repService.frepUpdate(rvo);
				
			}catch(Exception e) {
				e.printStackTrace();
				entity =new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			
			return entity;
		}
		
		@PostMapping(value="/td_imgInsert",produces = "application/json")
		public Object tdImgInsert(@RequestParam("file") MultipartFile multipartFile) {
			
			
			Map<String, Object> object = new HashMap<String, Object>();
			
			String fileRoot = "C:\\theater\\board\\";	//저장될 외부 파일 경로
			
			String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
			String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
			
			File targetFile = new File(fileRoot + savedFileName);	
			
			try {
				InputStream fileStream = multipartFile.getInputStream();
				FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
				System.out.println("파일 저장 성공");
			/*
			 * object.put("url",fileRoot); object.put("fileName", savedFileName);
			 */
				object.put("url","/controller/theater/board/"+savedFileName);
				//this.Service.basictheaterInsert(tdVO);
			System.out.println("등록 성공");
			} catch (IOException e) {
				FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
				object.put("responseCode", "error");
				e.printStackTrace();
				System.out.println("에러발생");
			}
			return object;
		}
		
		@PostMapping(value="/td_insert",produces = "application/json")
		public Object tdInsert(@RequestBody BasicTheaterVO basicTheaterVO) {
			Map<String,Object> object = new HashMap<>();
			basicTheaterService.basictheaterInsert(basicTheaterVO);
			int td_no = basicTheaterVO.getTd_no();
			System.out.println(td_no);
			object.put("td_no",td_no);
			return object;
		}
		
		@PostMapping(value="/ticket_insert")
		public ResponseEntity<Void> ticketInsert(@RequestBody TicketingInfoVO ticketVO){
			ResponseEntity<Void> entity = null;
			try {				
				this.basicTheaterService.ticketInsert(ticketVO);
				entity = new ResponseEntity<Void>(HttpStatus.OK);
			}catch(Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
		
		//첫번째 예매 페이지에서 시도를 클릭하면 시도엥 해당하는 연극을 페이지에 출력하는 메서드
		@PostMapping(value = "IY_getTheater",produces="application/json")
		public List<BasicTheaterVO> getTheaterName(@RequestBody LocationTitleTimeJsonVO lotitivo, Model m){
			System.out.println(lotitivo.getTd_locationI());
			System.out.println(lotitivo.getTheater_nameI());
			System.out.println(lotitivo.getTd_runtimeI());
			List<BasicTheaterVO> glist = this.gugunService.getTheater(lotitivo.getTd_locationI());
			for(BasicTheaterVO vo : glist) {
				System.out.println(vo.getTd_title());
			}
			return glist;
		}
		
		//첫번째 예매 페이지에서 연극을 클릭하면 , 연극의 예약 가능 날짜를 출력하는 메서드
		@PostMapping(value = "IY_getTheaterTime",produces="application/json")
		public List<TheaterTimeVO> getTheaterTime(@RequestBody LocationTitleTimeJsonVO lotitivo, Model m){
			System.out.println(lotitivo.getTd_locationI());
			System.out.println(lotitivo.getTheater_nameI());
			System.out.println(lotitivo.getTd_runtimeI());
			List<TheaterTimeVO> g2list = this.gugunService.getTime(lotitivo.getTheater_nameI());
			for(TheaterTimeVO vo : g2list) {
				System.out.println(vo.getTd_runtime());
				System.out.println(vo.getTd_location());
				
			}
			return g2list;
		}
		
		
		
		
}














