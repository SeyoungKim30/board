package board;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import board.vo.Board;
import board.vo.BoardFile;

@Service
public class A02_Service {

	@Autowired
	A03_Dao dao;
	
	@Value("${doc.path}")
	String path;
	
	public List<Board> selectBoardList(Board search){
		if(search.getSubject()==null) {search.setSubject("");}
		if(search.getWriter()==null) {search.setWriter("");}
		return dao.selectBoardList(search);
	}
	
	public Board insertBoard(Board board) {
		dao.insertBoard(board);
		//파일첨부
		if(board.getDoc()!=null) {
		for(MultipartFile bf:board.getDoc()) {	
			String filename=board.getNo()+"_"+bf.getOriginalFilename();
			File fileobj = new File(path+filename);	
			try {
				bf.transferTo(fileobj);		//설정한 file객체 정보로 파일 생성
				dao.insertFile(new BoardFile(0,board.getNo(),filename));	//각각 설정해서 불러옴
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}}
		//파일첨부 끝
		
		return board;
	}
	
	public Board selectBoard(Board board) {
		dao.updateReadcnt(board);	//조회수 증가
		board = dao.selectBoard(board);	//글번호로 뭔지 찾아서
		return board;
	}
	
	public List<Board> selectReplyList(Board search){
		return dao.selectReplyList(search);
	}
	
	public List<BoardFile> selectFile(Board board){
		return dao.selectFile(board);
	}
	
	public void updateBoard(Board board) {
		dao.updateBoard(board);
	}
	public void deleteBoard(Board board) {
		dao.deleteBoard(board);
	}
}
