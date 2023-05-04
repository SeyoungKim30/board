package board;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import board.vo.Board;
import board.vo.BoardSch;

@Service
public class A02_Service {

	@Autowired
	A03_Dao dao;
	
	@Value("${doc.path}")
	String path;
	
	public List<Board> selectBoardList(BoardSch search){
		//search 세팅 : 페이지관련
		search.setHowmanyInonepage(30);
		search.setHowmanyInoneblock(5);
		
		if(search.getBlockIndex()==0&&search.getPageIndex()==0) {search.setPageIndex(1);}	//위치정보 아무것도 없으면 1
		if(search.getBlockIndex()==0) {
			double a = (double)search.getPageIndex()/search.getHowmanyInoneblock(); //블락= 올림(페이지수/블락당)
			search.setBlockIndex((int)Math.ceil(a)) ;
			}
		if(search.getBlockIndex()!=0&&search.getPageIndex()==0) {
			search.setPageIndex(search.getHowmanyInoneblock()*(search.getBlockIndex()-1)+1);	//3블락이고 블락에 4개씩이면 10페이지= howmany*(블락-1)+1
		}
		search.setTotalPage(dao.totalPage(search));
		search.setTotalBlock((int) Math.ceil(search.getTotalPage()/search.getHowmanyInoneblock()));	//올림(전체페이지(11) / 한블락당페이지(5)) = 블락 3개
		//search 세팅 : 페이지관련 끝
		if(search.getSearchSubject()==null) {search.setSearchSubject("");}
		if(search.getSearchWriter()==null) {search.setSearchWriter("");}
		
		return dao.selectBoardList(search);
	}
	
	public Board insertBoard(Board board) {
		dao.insertBoard(board);
		return board;
	}
	
	public Board selectBoard(Board board) {
		board = dao.selectBoard(board);	//글번호로 뭔지 찾아서
		return board;
	}
	
	public void updateBoard(Board board) {
		dao.updateBoard(board);
	}
	public void deleteBoard(Board board) {
		dao.deleteBoard(board);
	}
	
	
}
