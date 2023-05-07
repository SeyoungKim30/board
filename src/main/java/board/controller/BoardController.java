package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import board.service.BoardService;
import board.vo.Board;
import board.vo.BoardSch;


@Controller
public class BoardController {

	@Autowired
	BoardService service;
	
	//게시글 목록
	@RequestMapping("/selectBoardList.do")
	public String selectBoardList(@ModelAttribute("search") BoardSch search, Model d) {
		d.addAttribute("boardList",service.selectBoardList(search));
		return "page01boardlist";
	}
	
	//새 게시글 등록
	@RequestMapping("/insertBoard.do")
	public String insertBoard(Board board,Model d) {
		int postid=service.insertBoard(board).getPostid();
		return "redirect:/selectBoard.do?postid="+postid;
	}
	
	//게시글 조회
	@RequestMapping("/selectBoard.do")
	public String selectBoard(@ModelAttribute("search") BoardSch search,Board board,Model d) {
		d.addAttribute("boardList",service.selectBoardList(search));	//글쓴이랑 글 제목으로 검색
		board = service.selectBoard(board);	//글 넘버로 검색
		d.addAttribute("board",board);
		return "page2read";	
	}
	
	//게시글 수정
	@RequestMapping("/updateBoard.do")
	public String updateBoard(Board board) {
		service.updateBoard(board);
		return "redirect:/selectBoard.do?postid="+board.getPostid();
	}
	
	//게시글 삭제
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(Board board) {
		service.deleteBoard(board);
		return "redirect:/selectBoardList.do";
	}
	
	//연관 게시글
	@CrossOrigin(origins = "*",allowedHeaders = "*")
	@RequestMapping("/selectRelative.do")
	public String selectRelative(int postid,Model d) {
		d.addAttribute("relativePosts",service.selectRelative(postid));
		return "pageJsonReport";
	}
	
}
