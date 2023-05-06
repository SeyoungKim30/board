package board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.dao.MemberDao;
import board.vo.Member;

@Service
public class MemberService {

	@Autowired
	MemberDao dao;
	
	
	public Member selectMemberSignIn(Member member) {
		return dao.selectMemberSignIn(member);
	}
	
	public int insertMember(Member member) {
		return dao.insertMember(member);
	}
	
	public int selectMemberID(String id){
		return dao.selectMemberID(id);
	}

	
}
