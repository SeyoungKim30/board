package board;

import java.util.List;

import board.vo.Board;

import board.vo.BoardSch;

// board.A03_Dao
public interface A03_Dao {

	public List<Board> selectBoardList(BoardSch search);
	public int insertBoard(Board board);
	public Board selectBoard(Board board);
	
	public void updateBoard(Board board);
	public void deleteBoard(Board board);

	
	public int totalPage(BoardSch search);
}
