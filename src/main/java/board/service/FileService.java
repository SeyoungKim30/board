package board.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Path;
import java.nio.file.Paths;
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
	
	//파일 업로드
	public String fileUpload(Board board) {
		BoardFile boardFile = new BoardFile();
		boardFile.setPostid(board.getPostid());
		for(MultipartFile each:board.getFilelist()) {
			if(each.getSize()<10485760) {
				String fileName=board.getPostid()+each.getOriginalFilename().replaceAll(" ", "");
				if(each.getOriginalFilename().length()>15) {
					fileName = fileName.substring(0, 15)+each.getOriginalFilename().substring(each.getOriginalFilename().lastIndexOf("."));
				}else {
					fileName = fileName+each.getOriginalFilename().substring(each.getOriginalFilename().lastIndexOf("."));
				}
				boardFile.setFilename(fileName);
				File file = new File(filepath+fileName);
				try {
					each.transferTo(file);	//파일 저장
					dao.insertFile(boardFile);	//DB에 등록
				}catch (IllegalStateException | IOException e) {
					e.getStackTrace();
					return e.getMessage();
				}
			}else{
				return "10MB 이상의 파일은 첨부할 수 없습니다.";
			}
			
		}
		return "fileUpload Success";
	}
	public String deleteFile(BoardFile boardFile) {
	//서버에서 파일 삭제
		Path file=Paths.get(filepath+boardFile.getFilename());
		try {
			Files.delete(file);
		}catch(NoSuchFileException e) {
			return "NoSuchFileException";
		}catch (IOException e) {
			return e.getMessage();
		}
		return dao.deleteFile(boardFile)+"";	//db에서 파일 삭제
	};
	
	public List<BoardFile> selectFile(int postid){
		return dao.selectFile(postid);
	}
}
