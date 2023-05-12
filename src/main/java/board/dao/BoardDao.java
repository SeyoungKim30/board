package board.dao;

import java.util.List;

import board.vo.Board;
import board.vo.BoardSch;
import board.vo.Comment;
import board.vo.Voca;

// board.A03_Dao
public interface BoardDao {

	public List<Board> selectBoardList(BoardSch search);
	public int insertBoard(Board board);
	public Board selectBoard(Board board);
	
	public void updateBoard(Board board);
	
	public void deleteBoard(Board board);
	public void deleteBoardVoca(Board board);

	public int insertComment(Comment comment);
	public int deleteComment(Comment comment);
	public List<Comment> selectComment(int postid);
	
	public int totalPage(BoardSch search);
	
	public int insertVoca(Voca voca);
	public List<Board> selectRelative(int postid);
	

}
