package board.vo;

public class Comment {
	private int id;
	private int postid;
	private String writer;
	private String comments;
	private String writedate;
	
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Comment(int id, int postid, String writer, String comments, String writedate) {
		super();
		this.id = id;
		this.postid = postid;
		this.writer = writer;
		this.comments = comments;
		this.writedate = writedate;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	
	
}
