package board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import board.service.MemberService;
import board.vo.Member;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	@RequestMapping("/signin.do")
	public String signin(Member member,HttpSession session) {
		member=service.selectMemberSignIn(member);
		if(member!=null) {
			session.setAttribute("logon",member);
		}
		return "redirect:/selectBoardList.do";
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
	
	@ResponseBody
	@RequestMapping("/id-duplicationCheck.do")
	public String idDuplication(String id){
		return service.selectMemberID(id)+"";
	}
	
}
