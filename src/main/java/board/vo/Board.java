package board.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Board {
	int no; 
    int refno;
	String subject;
	String content ;
	String writer ;
	int readcnt;
    String regdte ;
    String uptdte ;
    int recount;
    List<MultipartFile> doc;
    
    int rnum;
    int level;

	public Board() {
		super();
	}


	public Board(int no, int refno, String subject, String content, String writer, int readcnt, String regdte,
			String uptdte, int recount, List<MultipartFile> doc) {
		super();
		this.no = no;
		this.refno = refno;
		this.subject = subject;
		this.content = content;
		this.writer = writer;
		this.readcnt = readcnt;
		this.regdte = regdte;
		this.uptdte = uptdte;
		this.recount = recount;
		this.doc = doc;
	}



	public int getRnum() {
		return rnum;
	}


	public void setRnum(int rnum) {
		this.rnum = rnum;
	}


	public int getLevel() {
		return level;
	}


	public void setLevel(int level) {
		this.level = level;
	}


	public List<MultipartFile> getDoc() {
		return doc;
	}


	public void setDoc(List<MultipartFile> doc) {
		this.doc = doc;
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public int getRefno() {
		return refno;
	}


	public void setRefno(int refno) {
		this.refno = refno;
	}


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	public int getReadcnt() {
		return readcnt;
	}


	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}


	public String getRegdte() {
		return regdte;
	}


	public void setRegdte(String regdte) {
		this.regdte = regdte;
	}


	public String getUptdte() {
		return uptdte;
	}


	public void setUptdte(String uptdte) {
		this.uptdte = uptdte;
	}


	public int getRecount() {
		return recount;
	}


	public void setRecount(int recount) {
		this.recount = recount;
	}

	

}