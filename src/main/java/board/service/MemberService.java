package board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.dao.MemberDao;
import board.vo.Board;
import board.vo.BoardSch;
import board.vo.Comment;
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

	public List<Board> selectBoardListByWriter(BoardSch boardSch){
		return dao.selectBoardListByWriter(boardSch);
	}
	public List<Comment> selectCommentListByWriter(BoardSch boardSch){
		return dao.selectCommentListByWriter(boardSch);
	}
	
}
