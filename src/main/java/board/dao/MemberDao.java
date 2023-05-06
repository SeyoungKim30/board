package board.dao;

import board.vo.Member;

public interface MemberDao {

	public Member selectMemberSignIn(Member member);
	public int insertMember(Member member);
	public int selectMemberID(String id);
	
}
