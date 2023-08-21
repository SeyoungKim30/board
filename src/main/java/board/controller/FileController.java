package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import board.service.FileService;

@Controller
public class FileController {

	@Autowired
	FileService service;
	
	@GetMapping("/download.do")
	public String download(String downloadFileName, Model d) {
		d.addAttribute("downloadFileName", downloadFileName);
		return "downloadViewer";
	}
}
