package board.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.dao.BoardDao;
import board.vo.Board;
import board.vo.BoardSch;
import board.vo.Comment;
import board.vo.Member;
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

		//voca 저장
		Voca voca= new Voca(board.getPostid(), Komo.analyzingList(board.getContent()+board.getSubject()));
		dao.insertVoca(voca);
		return board;
	}
	
	public Board selectBoard(Board board) {
		board = dao.selectBoard(board);	//글번호로 뭔지 찾아서
		return board;
	}
	
	public void updateBoard(Board board) {
		dao.updateBoard(board);
		dao.deleteBoardVoca(board);
		
		Voca voca= new Voca(board.getPostid(), Komo.analyzingList(board.getContent()+board.getSubject()));
		dao.insertVoca(voca);
	}
	
	public void deleteBoard(Board board) {
		dao.deleteBoard(board);
		dao.deleteBoardVoca(board);
	}
	
	public int insertComment(Comment comment,Member member) {
		comment.setWriter(member.getId());
		return dao.insertComment(comment);
	}
	
	public int deleteComment(Comment comment) {
		return dao.deleteComment(comment);
	}
	
	public List<Comment> selectComment(int postid){
		return dao.selectComment(postid);
	}
	
	
	public List<Board> selectRelative(int postid) {
		return dao.selectRelative(postid);
	}
	
	
}
