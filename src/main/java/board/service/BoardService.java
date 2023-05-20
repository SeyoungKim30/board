package board.service;


import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import board.dao.BoardDao;
import board.vo.Board;
import board.vo.BoardFile;
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
	
	@Value("${file.path}")
	String filepath;

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
			fileLoad(board);
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
	
	public void fileLoad(Board board) {
		int filenumber=0;
		BoardFile boardFile = new BoardFile();
		boardFile.setPostid(board.getPostid());
		for(MultipartFile each:board.getFilelist()) {
			if(each.getSize()<10485760) {
				filenumber++;
				String fileName = board.getPostid()+"_"+filenumber+each.getOriginalFilename().substring(each.getOriginalFilename().lastIndexOf("."));
				boardFile.setFileid(filenumber);
				boardFile.setFilename(fileName);
				File file = new File(filepath+fileName);
				try {
					each.transferTo(file);	//파일 저장
					dao.insertFile(boardFile);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
			
		}
	}
}
