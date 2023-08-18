package board.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import board.Komo;
import board.dao.BoardDao;
import board.vo.Board;
import board.vo.BoardSch;
import board.vo.Comment;
import board.vo.Member;
import board.vo.Voca;

@Service
public class BoardService {

	@Autowired
	BoardDao dao;
	
	@Autowired
	Komo komo;
	
	@Autowired
	FileService fileService;
	

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
		//파일첨부
		if(board.getFilelist()!=null) {
			fileService.fileLoad(board);
		}
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
		dao.deleteBoardVoca(board);
		
		Voca voca= new Voca(board.getPostid(), komo.analyzingList(board.getContent()+board.getSubject()));
		dao.insertVoca(voca);
	//파일추가할때 기존파일 냅두고 새 파일추가하거나, 기존파일 삭제하는 기능 필요
	}
	
	public void deleteBoard(Board board) {
		dao.deleteBoard(board);
		dao.deleteBoardVoca(board);
	}
	
	public String insertComment(Comment comment,Member member) {
		if(member!=null) {
			comment.setWriter(member.getId());
			return dao.insertComment(comment)+"";
		}else {
			return "로그인 세션이 만료되었습니다.";
		}
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
