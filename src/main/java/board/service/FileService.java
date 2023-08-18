package board.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import board.dao.FileDao;
import board.vo.Board;
import board.vo.BoardFile;

@Service
public class FileService {
	
	@Autowired
	FileDao dao;
	
	@Value("${file.path}")
	String filepath;
	
	public void fileLoad(Board board) {
		int filenumber=0;
		BoardFile boardFile = new BoardFile();
		boardFile.setPostid(board.getPostid());
		for(MultipartFile each:board.getFilelist()) {
			if(each.getSize()<10485760) {
				filenumber++;
				String fileName = each.getOriginalFilename().substring(0, 20)+each.getOriginalFilename().substring(each.getOriginalFilename().lastIndexOf("."));
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
	
	
	public List<BoardFile> selectFile(int postid){
		return dao.selectFile(postid);
	}
}
