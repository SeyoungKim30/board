package board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import board.service.MemberService;
import board.vo.BoardSch;
import board.vo.Member;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	@RequestMapping("/signin.do")
	public String signin(Member member,HttpSession session,Model d) {
		member=service.selectMemberSignIn(member);
		if(member!=null) {
			session.setAttribute("logon",member);
			return "redirect:/selectBoardList.do";
		}else {
			d.addAttribute("signinFail", "로그인에 실패했습니다.");
			return "redirect:/login.jsp";
		}
	}
	
	@RequestMapping("/signout.do")
	public String singout(HttpSession session) {
		session.removeAttribute("logon");
		return "redirect:/selectBoardList.do";
	}
	
	@RequestMapping("/signup.do")
	public String signup(Member member,HttpSession session) {
		service.insertMember(member);	//회원가입
		member=service.selectMemberSignIn(member);
		if(member!=null) {		//로그인
			session.setAttribute("logon",member);
		}
		return "redirect:/selectBoardList.do";
	}
	
	//아이디 중복검사
	@ResponseBody
	@RequestMapping("/id-duplicationCheck.do")
	public String idDuplication(String id){
		return service.selectMemberID(id)+"";
	}
	
	
	//my account
	
	@RequestMapping("/myaccount.do")
	public String myAccount(HttpSession session, Model d) {
		if(session.getAttribute("logon")==null) {
			return "redirect:/login.jsp";
		}else {
			BoardSch boardSch = new BoardSch();
			boardSch.setPageIndex(1);
			boardSch.setHowmanyInonepage(10);
			boardSch.setSearchWriter( ((Member)session.getAttribute("logon")).getId() );
			d.addAttribute("boardList",service.selectBoardListByWriter(boardSch) );
			d.addAttribute("commentList",service.selectCommentListByWriter(boardSch) );
			return "page06myaccount";
		}
	}
	
	
}
