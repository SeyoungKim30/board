package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import board.service.FileService;
import board.vo.BoardFile;

@Controller
public class FileController {

	@Autowired
	FileService service;
	
	@GetMapping("/download.do")
	public String download(String downloadFileName, Model d) {
		d.addAttribute("downloadFileName", downloadFileName);
		return "downloadViewer";
	}
	
	@ResponseBody
	@GetMapping("/deleteFile.do")
	public String deleteFile(BoardFile file) {
		return service.deleteFile(file);
	}
	
}
