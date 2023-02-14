package board;

import java.util.List;

import board.vo.Board;
import board.vo.BoardFile;
import board.vo.BoardSch;

// board.A03_Dao
public interface A03_Dao {

	public List<Board> selectBoardList(BoardSch search);
	public int insertBoard(Board board);
	public Board selectBoard(Board board);
	public void updateReadcnt(Board board);
	public List<Board> selectReplyList(Board search);
	
	public void updateBoard(Board board);
	public void deleteBoard(Board board);
	
	public void insertFile(BoardFile bf);
	public List<BoardFile> selectFile(Board board);
	
	public int totalPage(BoardSch search);
}
