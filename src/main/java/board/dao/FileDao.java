package board.dao;

import java.util.List;

import board.vo.BoardFile;

public interface FileDao {
	
	public int insertFile(BoardFile boardFile);
	public int deleteFile(BoardFile boardFile);
	public List<BoardFile> selectFile(int postid);
}
