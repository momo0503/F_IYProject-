package com.lifetheater.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lifetheater.service.BoardService;
import com.lifetheater.service.RepService;
import com.lifetheater.service.UserService;
import com.lifetheater.service.UserSha256;
import com.lifetheater.vo.FBoardVO;
import com.lifetheater.vo.UserVO;

@Controller
public class IY_mypage {

	@Autowired
	private BoardService boardService;
	@Autowired
	private RepService repService;
	@Autowired
	private UserService userService;
	
	
	
	@GetMapping("IY_mypage_board")
	public String mypage_board(Model m,HttpSession session,HttpServletRequest request,HttpServletResponse response,@ModelAttribute FBoardVO fBoard) throws Exception{
		
		UserVO user = (UserVO)session.getAttribute("login");
		if(user==null) {
			response.setContentType("text/html; charset=UTF-8");

		   PrintWriter out = response.getWriter();
		   out.println("<script>alert('로그인이 필요한 서비스입니다.');"
		   		+ "location.href='/controller/IY_login'</script>");
		   return null;
		}
		

		String userEmail = user.getEmail();
		if(user.getMembertype()=='1') {
			// 예매매내역
			
			//System.out.println("user prefTheater : " + user.getPrefTheater01());
			m.addAttribute("login",user);
			
			// 자유 게시글 목록
			fBoard.setEmail(userEmail);
			fBoard.setCondition("fb_email");
			fBoard.setKeyword(userEmail);
			fBoard.setStartrow(1);
			fBoard.setEndrow(3);// endrow need to set limit and calc
			
			int page=1;
			int limit=5;
			if(request.getParameter("page")!=null) {
				page=Integer.parseInt(request.getParameter("page"));
			}
			String condition = fBoard.getCondition();
			String keyword=fBoard.getKeyword();
			
			m.addAttribute("condition", condition);
			m.addAttribute("keyword", keyword);
			
			fBoard.setStartrow((page-1)*limit+1);//시작행 번호
			fBoard.setEndrow(fBoard.getStartrow()+limit-1);//끝행번호
			
			int totalCnt = this.boardService.getFTotalCount(fBoard);//총게시물 수
			
			List<FBoardVO> list = boardService.getflist(fBoard);
			System.out.println("board List size : " + list.size());
			List<FBoardVO> flist = new ArrayList<FBoardVO>();
			
			int maxPage = (int)((double)totalCnt/limit+0.95);
			int startPage = (((int)((double)page/limit+limit+0.9))-1)*limit+1;
			int endPage = maxPage;
			
			if(endPage>startPage+limit-1) {
				endPage = startPage + limit - 1;
			}
			
			for(FBoardVO f : list) {
				f.setFb_date(f.getFb_date().substring(0,10));
			}
			
			// list set limit under 3
			m.addAttribute("boardlist",list);
			m.addAttribute("totalCnt",totalCnt);
			m.addAttribute("startPage",startPage);
			m.addAttribute("endPage", endPage);
			m.addAttribute("maxPage",maxPage);
			m.addAttribute("page",page);
			
			
		}
		
		return "mypage/mypage_board";
	}// mypage_board
	
	
	@GetMapping("IY_mypage_edit_user")
	public String mypage_edit_user(Model m,HttpSession session,HttpServletResponse response) throws Exception {
		
		UserVO user = (UserVO)session.getAttribute("login");
		if(user==null) {
			response.setContentType("text/html; charset=UTF-8");

			   PrintWriter out = response.getWriter();
			   out.println("<script>alert('로그인이 필요한 서비스입니다.');"
			   		+ "location.href='/controller/IY_login'</script>");
			   return null;
		}
		
		if(user.getLoginWay()!="1") {
			/*
			 * response.setContentType("text/html; charset=UTF-8");
			 * 
			 * PrintWriter out = response.getWriter();
			 * out.println("<script>alert('권한이 없습니다.');" + "history.go(-1)</script>");
			 */
			user = userService.searchUser(user);
			m.addAttribute("userInfo",user);
			   return "mypage/mypage_info";
		}
		
		return "mypage/mypage_edit_user";
	}//mypage_edit_user()
	
	@RequestMapping("IY_mypage_edit_user_ok")
	public String mypage_edit_user_ok(HttpSession session,HttpServletRequest request,HttpServletResponse response) throws Exception {
		String inPwd = (String)request.getParameter("pw");
		System.out.println(inPwd);

		UserVO user = (UserVO)session.getAttribute("login");
		if(user==null) {
			response.setContentType("text/html; charset=UTF-8");

		   PrintWriter out = response.getWriter();
		   out.println("<script>alert('로그인이 필요한 서비스입니다.');"
		   		+ "location.href='/controller/IY_login'</script>");
		   return null;
		}
		System.out.println("user pwd : " + user.getPw());
		// compare input pwd and login pwd
		if(!UserSha256.encrypt(inPwd).equals(user.getPw())) {
			response.setContentType("text/html; charset=UTF-8");

			   PrintWriter out = response.getWriter();
			   out.println("<script>alert('비밀번호가 일치하지 않습니다');"
			   		+ "history.go(-1);"+"</script>");
			   return null;
		}
		return "mypage/mypage_info";
	}
	
	@RequestMapping(value = "IY_mypage_edit_pwd",method= {RequestMethod.GET,RequestMethod.POST})
	public String mypage_edit_pwd() {
		return "mypage/mypage_edit_pwd";
	}
	@RequestMapping("IY_mypage_edit_pwd_ok")
	public String mypage_edit_pwd_ok(HttpSession session, HttpServletRequest request,HttpServletResponse response) throws Exception{
		String curPwd = (String)request.getParameter("curpwd");
		String chgPwd = (String)request.getParameter("chgpwd");
		String pwdCheck = (String)request.getParameter("pwdcheck");
		
		// session 의 이메일로 비밀번호 데려와서
		// curPwd 와 비교하기
		UserVO suser = (UserVO) session.getAttribute("login");
		if(!UserSha256.encrypt(curPwd).equals(suser.getPw())) {
			response.setContentType("text/html; charset=UTF-8");

			   PrintWriter out = response.getWriter();
			   out.println("<script>alert('비밀번호가 일치하지 않습니다');"
			   		+ "history.go(-1);"+"</script>");
			   return null;
		}
		suser.setPw(UserSha256.encrypt(chgPwd));
		userService.pwupdate(suser);
		return "IY_mypage";
	}
	
	@GetMapping("IY_mypage_point")
	public String mypage_point(HttpSession session,HttpServletResponse response)throws Exception {
		
		UserVO user = (UserVO)session.getAttribute("login");
		if(user==null) {
			response.setContentType("text/html; charset=UTF-8");

		   PrintWriter out = response.getWriter();
		   out.println("<script>alert('로그인이 필요한 서비스입니다.');"
		   		+ "location.href='/controller/IY_login'</script>");
		   return null;
		}
		
		
		return "mypage/mypage_point";
	}
	@GetMapping("IY_mypage_reservation")
	public String mypage_reservation() {
		return "mypage/mypage_reservation";
	}

	/*
	 * @GetMapping("IY_mypage_edit_theater") public String mypage_edit() { return
	 * "mypage/mypage-edit-theater"; }
	 */
	@GetMapping("info")
	public String mypage_reservation(Model m,HttpSession session,HttpServletResponse response) throws Exception {
		UserVO user = (UserVO)session.getAttribute("login");
		if(user==null) {
			response.setContentType("text/html; charset=UTF-8");

		   PrintWriter out = response.getWriter();
		   out.println("<script>alert('로그인이 필요한 서비스입니다.');"
		   		+ "location.href='/controller/IY_login'</script>");
		   return null;
		}
		
		user = userService.searchUser(user);
		m.addAttribute("userInfo",user);
		
		return "mypage/mypage_info";
	}
	
	@GetMapping("userPwdChangePage")
	public String mypage_chgPwd() {
		
		
		
		return "mypage/mypage_edit_pwd";
	}
	
	@GetMapping("IY_mypage")
	public String mypage(Model m, HttpSession session,HttpServletResponse response) throws Exception {

		UserVO user = (UserVO)session.getAttribute("login");
		if(user==null) {
			response.setContentType("text/html; charset=UTF-8");

		   PrintWriter out = response.getWriter();
		   out.println("<script>alert('로그인이 필요한 서비스입니다.');"
		   		+ "location.href='/controller/IY_login'</script>");
		   return null;
		}
		
		String userEmail = user.getEmail();
		// membertype -> Normarl이면
		if(user.getMembertype()=='1') {
			// 예매매내역
			
			//System.out.println("user prefTheater : " + user.getPrefTheater01());
			m.addAttribute("login",user);
			
			// 자유 게시글 목록
			FBoardVO fBoard = new FBoardVO();
			fBoard.setEmail(userEmail);
			fBoard.setCondition("fb_email");
			fBoard.setKeyword(userEmail);
			fBoard.setStartrow(1);
			fBoard.setEndrow(3);// endrow need to set limit and calc
			/*
			 * fboard.setStartrow((page-1)*10+1);//시작행 번호
			 * fboard.setEndrow(fboard.getStartrow()+limit-1);//끝행번호
			 */			
			List<FBoardVO> list = boardService.getflist(fBoard);
			//System.out.println("board List size : " + list.size());
			
			for(int i=0; i<list.size(); ++i) {
				list.get(i).setFb_date(list.get(i).getFb_date().substring(0,10));
			}
			
			
			// list set limit under 3
			m.addAttribute("boardlist",list);
			
		}
		else if(user.getMembertype()=='2') {
			// 홍보 게시글 목록
		}
		
		
		
		return "mypage/mypage";
	}
	
	
	/*
	 * @GetMapping("mypage_get_board/email={useremail}") public List<FBoardVO>
	 * getFBoardList(@PathVariable(name="useremail")String email){
	 * 
	 * // 이메일에 해당하는 // 게시글 검색하여 // 리스트로 반환하기 return null; }
	 */
}
