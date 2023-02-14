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
import board.vo.BoardSch;

@Service
public class A02_Service {

	@Autowired
	A03_Dao dao;
	
	@Value("${doc.path}")
	String path;
	
	public List<Board> selectBoardList(BoardSch search){
		//search 세팅 : 페이지관련
		if(search.getHowmanyInonepage()==0) {search.setHowmanyInonepage(10);}
		if(search.getHowmanyInoneblock()==0) {search.setHowmanyInoneblock(5);}
		
		if(search.getBlockIndex()==0&&search.getPageIndex()==0) {search.setPageIndex(1);	search.setBlockIndex(1);}	//위치정보 아무것도 없으면 1
		if(search.getBlockIndex()==0&&search.getPageIndex()!=0) {
			search.setBlockIndex((int) Math.ceil(search.getPageIndex()/search.getHowmanyInoneblock()));}	//블락= 올림(페이지수/블락당)
		if(search.getBlockIndex()!=0&&search.getPageIndex()==0) {
			search.setPageIndex(search.getHowmanyInoneblock()*(search.getBlockIndex()-1)+1);	//3블락이고 블락에 4개씩이면 10페이지= howmany*(블락-1)+1
		}
		search.setTotalPage(dao.totalPage(search));
		search.setTotalBlock((int) Math.ceil(search.getTotalPage()/search.getHowmanyInoneblock()));	//올림(전체페이지(11) / 한블락당페이지(5)) = 블락 3개
		//search 세팅 : 페이지관련 끝
		if(search.getSearch_subject()==null) {search.setSearch_subject("");}
		if(search.getSearch_writer()==null) {search.setSearch_writer("");}
		
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
		dao.updateBoard(board);
	}
	public void deleteBoard(Board board) {
		dao.deleteBoard(board);
	}
	
	
}
