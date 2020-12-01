package com.lifetheater.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.lifetheater.service.BoardService;
import com.lifetheater.service.RepService;
import com.lifetheater.vo.FBoardContVO;
import com.lifetheater.vo.FBoardVO;
import com.lifetheater.vo.FRepContVO;
import com.lifetheater.vo.NBoardContVO;
import com.lifetheater.vo.NBoardVO;
import com.lifetheater.vo.PBoardContVO;
import com.lifetheater.vo.PBoardVO;
import com.lifetheater.vo.UserVO;

@Controller
public class IY_board {
	
	@Autowired
	private BoardService Service;
	@Autowired
	private RepService repService;
	
	/*
	 * @Autowired BoardService boardService;
	 */
	
	@GetMapping("/IY_board_flist")
	public String board_flist(Model model,HttpServletRequest request,@ModelAttribute FBoardVO fboard){
		int page=1;
		int limit=10;
		if(request.getParameter("page")!=null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		String condition = fboard.getCondition();
		String keyword=fboard.getKeyword();
	
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		
		fboard.setStartrow((page-1)*10+1);//시작행 번호
		fboard.setEndrow(fboard.getStartrow()+limit-1);//끝행번호
		
		int totalCount=this.Service.getFTotalCount(fboard);//총게시물수
		
		System.out.println(totalCount);
			
		
		List<FBoardVO> list=Service.getflist(fboard);
		List<FBoardVO> flist=new ArrayList<FBoardVO>();
		
		int maxpage=(int)((double)totalCount/limit+0.95);
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		int endpage=maxpage;
		if(endpage>startpage+10-1) endpage=startpage+10-1;
		
		model.addAttribute("totalCount",totalCount);
		request.setAttribute("list", list);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("page", page);
		
		int count=0;
		for(FBoardVO f:list) {
			f.setEmail(Service.getusername(f.getEmail()));
			flist.add(count, f);
			count+=1;
			System.out.println(f.getKeyword());
		}
		
		model.addAttribute("flist", flist);
		return "board/board_flist";
	}
	@GetMapping("/IY_board_fwrite")
	public String board_fwrite(HttpSession session) {
		UserVO u = null;
		if(session.getAttribute("login") == null) {
			return "/user/login";
		}else{//로그인정보안에 membertype을 확인해야대요
			u = (UserVO)session.getAttribute("login");
			if(u.getMembertype()!='1') {
				return "redirect:/IY_board_flist";
			}else {
				return "board/board_fwrite";
			}
		}
	}
	@GetMapping("/IY_board_fedit")
	public String board_fedit() {
		return "board/board_fedit";
	}
	@GetMapping("IY_board_fcont")
	public String board_fcont(int fb_num,Model m,HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		List<FRepContVO> frContList = null;
		if(request.getParameter("order") == null) {
			frContList = this.repService.selectFreCont(fb_num);//등록순
		}
		else if(Integer.parseInt((String)request.getParameter("order")) == 1) {
			 frContList = this.repService.selectFreCont(fb_num);//등록순
			 System.out.println("등록순");
		}else if(Integer.parseInt((String)request.getParameter("order")) == 2) {
			 frContList = this.repService.selectFreCont2(fb_num);//최신순
			 System.out.println("최신순");
		}
		FBoardContVO fbCont = this.Service.selectFBCont(fb_num);
		//this.Service.fHitUp(fb_num);
		int totalRep = this.repService.totalRep(fb_num);
		m.addAttribute("fbCont",fbCont);
		m.addAttribute("frContList", frContList);
		m.addAttribute("totalRep",totalRep);
		for(FRepContVO a : frContList) {
			System.out.println("중간 확인 : "+a.getName()+", "+a.getFb_reply_cont()+", "+a.getFb_reply_date()+ 
					", "+a.getFb_reply_reply_name()+", "+a.getFb_reply_reply_cont()+", "+a.getDel_ck());
		}
		return "board/board_fcont";
	}

	@GetMapping("/IY_board_plist")
	public String board_plist(Model model,HttpServletRequest request,@ModelAttribute PBoardVO pboard){
		int page=1;
		int limit=10;
		if(request.getParameter("page")!=null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		
		String condition = pboard.getCondition();
		String keyword=pboard.getKeyword();
	
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		pboard.setStartrow((page-1)*10+1);//시작행 번호
		pboard.setEndrow(pboard.getStartrow()+limit-1);//끝행번호
		
		int totalCount=this.Service.getPTotalCount(pboard);//총게시물수
		
		
		
		List<PBoardVO> list=Service.getplist(pboard);
		List<PBoardVO> plist=new ArrayList<PBoardVO>();
		
		int maxpage=(int)((double)totalCount/limit+0.95);
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		int endpage=maxpage;
		if(endpage>startpage+10-1) endpage=startpage+10-1;
		
		model.addAttribute("totalCount",totalCount);
		request.setAttribute("list", list);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("page", page);
		
		int count=0;
		for(PBoardVO p:list) {
			p.setEmail(Service.getusername(p.getEmail()));
			plist.add(count, p);
			count+=1;
		}
		model.addAttribute("plist", plist);
		return "board/board_plist";
	}
	@GetMapping("/IY_board_pwrite")
	public String board_pwrite(HttpSession session) {
		UserVO u = null;
		if(session.getAttribute("login") == null) {
			return "/user/login";
		}else{//로그인정보안에 membertype을 확인해야대요
			u = (UserVO)session.getAttribute("login");
			if(u.getMembertype()!='2') {
				return "redirect:/IY_board_plist";
			}else {
				return "board/board_pwrite";
			}
		}
	}
	@GetMapping("/IY_board_pedit")
	public String board_pedit() {
		return "board/board_pedit";
	}
	@GetMapping("IY_board_pcont")
	public String board_pcont(int pb_num,Model m) {
		//this.Service.pHitUp(pb_num);
		PBoardContVO pbCont = this.Service.selectPBCont(pb_num);
		m.addAttribute("pbCont",pbCont);
		return "board/board_pcont";
	}
	
	@GetMapping("/IY_board_nlist")
	public String board_nlist(Model model,HttpServletRequest request,@ModelAttribute NBoardVO nboard){
		int page=1;
		int limit=10;
		if(request.getParameter("page")!=null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		String condition = nboard.getCondition();
		String keyword=nboard.getKeyword();
	
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		nboard.setStartrow((page-1)*10+1);//시작행 번호
		nboard.setEndrow(nboard.getStartrow()+limit-1);//끝행번호
		
		int totalCount=this.Service.getNTotalCount(nboard);//총게시물수
		
		
		List<NBoardVO> list=Service.getnlist(nboard);
		List<NBoardVO> nlist=new ArrayList<NBoardVO>();
		
		int maxpage=(int)((double)totalCount/limit+0.95);
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		int endpage=maxpage;
		if(endpage>startpage+10-1) endpage=startpage+10-1;
		
		model.addAttribute("totalCount",totalCount);
		request.setAttribute("list", list);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("page", page);
		
		int count=0;
		for(NBoardVO n:list) {
			n.setEmail(Service.getusername(n.getEmail()));
			nlist.add(count, n);
			count+=1;
		}
		model.addAttribute("nlist", nlist);
		
		return "board/board_nlist";
	}
	@GetMapping("/IY_board_nwrite")
	public String board_nwrite(HttpSession session) {
		UserVO u = null;
		if(session.getAttribute("login") == null) {
			return "/user/login";
		}else{//로그인정보안에 membertype을 확인해야대요
			u = (UserVO)session.getAttribute("login");
			if(u.getMembertype()!='3') {
				return "redirect:/IY_board_nlist";
			}else {
				return "board/board_nwrite";
			}
		}
	}
	@GetMapping("/IY_board_nedit")
	public String board_nedit(HttpSession session) {
		return "board/board_nedit";
	}
	@GetMapping("IY_board_ncont")
	public String board_ncont(int nb_num,Model m){
		//this.Service.nHitUp(nb_num);
		NBoardContVO nbCont = this.Service.selectNBCont(nb_num);
		m.addAttribute("nbCont",nbCont);
		return "board/board_ncont";
	}
	
	@PostMapping("/fb_insert")
	public String fbInsert(@RequestBody FBoardVO fBoardVO) {
		this.Service.fBoardInsert(fBoardVO);
		return "redirect:IY_board_flist";
	}
	
	@PostMapping("/fb_update")
	public String fbUpdate(@RequestBody FBoardVO fBoardVO) {
		this.Service.fBoardUpdate(fBoardVO);
		System.out.println("중간 확인 : "+fBoardVO.getFb_title()+", "+fBoardVO.getFb_cont()+","+fBoardVO.getFb_img_url());
		return "redirect:IY_board_flist";
	}
	
	@PostMapping("/pb_update")
	public String pbUpdate(@RequestBody PBoardVO pBoardVO) {
		this.Service.pBoardUpdate(pBoardVO);
		return "redirect:IY_board_plist";
	}
	
	@PostMapping("/nb_update")
	public String nbUpdate(@RequestBody NBoardVO nBoardVO) {
		this.Service.nBoardUpdate(nBoardVO);
		return "redirect:IY_board_nlist";
	}
	
	
	@PostMapping("/pb_insert")
	public String pbInsert(@RequestBody PBoardVO pBoardVO) {
		this.Service.pBoardInsert(pBoardVO);
		return "redirect:IY_board_flist";
	}
	
	@PostMapping("/nb_insert")
	public String nbInsert(@RequestBody NBoardVO nBoardVO) {
		this.Service.nBoardInsert(nBoardVO);
		return "redirect:IY_board_flist";
	}
	
	@GetMapping("/IY_fboardEdit")
	public String fboardFedit(int fb_num,Model m,HttpSession session){
		FBoardVO fb = this.Service.selectFCont(fb_num);
		m.addAttribute("fbCont", fb);
		UserVO u = null;
		if(session.getAttribute("login") == null) {
			return "/user/login";
		}else{//로그인정보안에 membertype을 확인해야대요
			u = (UserVO)session.getAttribute("login");
			if(u.getMembertype()!='1') {
				return "redirect:/IY_board_flist";
			}else {
				return "board/board_fedit";
			}
		}
		
	}
	
	@GetMapping("/IY_nboardEdit")
	public String nboardFedit(int nb_num,Model m,HttpSession session){
		NBoardVO nb = this.Service.selectNCont(nb_num);
		m.addAttribute("nbCont", nb);
		UserVO u = null;
		if(session.getAttribute("login") == null) {
			return "/user/login";
		}else{//로그인정보안에 membertype을 확인해야대요
			u = (UserVO)session.getAttribute("login");
			if(u.getMembertype()!='3') {
				return "redirect:/IY_board_nlist";
			}else {
				return "board/board_nedit";
			}
		}
	}
	
	@GetMapping("/IY_pboardEdit")
	public String pboardFedit(int pb_num,Model m,HttpSession session){
		PBoardVO pb = this.Service.selectPCont(pb_num);
		m.addAttribute("pbCont", pb);
		UserVO u = null;
		if(session.getAttribute("login") == null) {
			return "/user/login";
		}else{//로그인정보안에 membertype을 확인해야대요
			u = (UserVO)session.getAttribute("login");
			if(u.getMembertype()!='2') {
				return "redirect:/IY_board_plist";
			}else {
				return "board/board_pedit";
			}
		}
	}
	
}
