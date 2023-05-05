package board.vo;

public class Board {
	int postid;
	String subject;
	String content ;
	String writer ;
    String regdte ;

	public Board() {
		super();
	}

	public Board(int postid, String subject, String content, String writer, String regdte) {
		super();
		this.postid = postid;
		this.subject = subject;
		this.content = content;
		this.writer = writer;
		this.regdte = regdte;
	}

	public int getPostid() {
		return postid;
	}

	public void setPostid(int postid) {
		this.postid = postid;
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

	public String getRegdte() {
		return regdte;
	}

	public void setRegdte(String regdte) {
		this.regdte = regdte;
	}


	
}