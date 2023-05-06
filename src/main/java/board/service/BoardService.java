package board.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.dao.BoardDao;
import board.vo.Board;
import board.vo.BoardSch;
import board.vo.Voca;
import resource.Komo;

@Service
public class BoardService {

	@Autowired
	BoardDao dao;
	
	
	public List<Board> selectBoardList(BoardSch search){
		//search 세팅 : 페이지관련
		if(search.getPageIndex()==0) {search.setPageIndex(1);}	//위치정보 아무것도 없으면 1
		
		search.setTotalPage(dao.totalPage(search));
		//search 세팅 : 페이지관련 끝
		if(search.getSearchSubject()==null) {search.setSearchSubject("");}
		if(search.getSearchWriter()==null) {search.setSearchWriter("");}
		
		return dao.selectBoardList(search);
	}
	
	public Board insertBoard(Board board) {
		dao.insertBoard(board);

		//본문 내용으로 voca만들기
		Komo komo = new Komo();
		//voca 저장
		Voca voca= new Voca(board.getPostid(), komo.analyzingList(board.getContent()+board.getSubject()));
		dao.insertVoca(voca);
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
	
	public List<Board> selectRelative(int postid) {
		return dao.selectRelative(postid);
	}
	
	
}
