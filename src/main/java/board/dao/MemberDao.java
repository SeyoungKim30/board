package board.dao;

import java.util.List;

import board.vo.Board;
import board.vo.BoardSch;
import board.vo.Comment;
import board.vo.Member;

public interface MemberDao {

	public Member selectMemberSignIn(Member member);
	public int insertMember(Member member);
	public int selectMemberID(String id);
	//my account
	public List<Board> selectBoardListByWriter(BoardSch boardSch);
	public List<Comment> selectCommentListByWriter(BoardSch boardSch);
}
