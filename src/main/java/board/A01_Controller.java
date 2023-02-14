package board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.vo.Board;
import board.vo.BoardFile;
import board.vo.BoardSch;

@Controller
public class A01_Controller {

	@Autowired
	A02_Service service;
	
	@RequestMapping("/selectBoardList.do")
	public String selectBoardList(@ModelAttribute("search") BoardSch search, Model d) {
		System.out.println(search.getPageIndex());
		System.out.println(search.getTotalPage());
		System.out.println(search.getHowmanyInonepage());
		System.out.println(search.getBlockIndex());
		System.out.println(search.getTotalBlock());
		System.out.println(search.getHowmanyInoneblock());
		d.addAttribute("boardList",service.selectBoardList(search));
		return "a01_boardList";
	}
	
	@RequestMapping("/insertBoard.do")
	public String insertBoard(Board board,Model d) {
		int boardNo=service.insertBoard(board).getNo();
		return "redirect:/selectBoard.do?no="+boardNo;
	}
	
	@RequestMapping("/selectBoard.do")
	public String selectBoard(@ModelAttribute("search") BoardSch search,Board board,Model d) {
		d.addAttribute("boardList",service.selectBoardList(search));	//글쓴이랑 글 제목으로 검색
		board = service.selectBoard(board);	//글 넘버로 검색
		d.addAttribute("board",board);
		d.addAttribute("replyList", service.selectReplyList(board));
		List<BoardFile> fileList=service.selectFile(board);
		if(fileList!=null) {
			d.addAttribute("fileList",fileList);
		}
		return "a02_detail";		//search, board, boardlist, replyList, fileList 전달
	}
	
	@RequestMapping("/updateBoard.do")
	public String updateBoard(Board board) {
		service.updateBoard(board);
		return "redirect:/selectBoard.do?no="+board.getNo();
	}
	
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(Board board) {
		service.deleteBoard(board);
		return "redirect:/selectBoardList.do";
	}
	
	@RequestMapping("/download.do")
	public String download(@RequestParam("filename") String filename,Model d) {
		d.addAttribute("downloadFileName", filename);
		return "downloadViewer";
	}
}
