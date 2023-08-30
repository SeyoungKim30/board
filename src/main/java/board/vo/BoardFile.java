package board.vo;

public class BoardFile {
	int postid;
	String filename;
	
	public BoardFile() {
		super();
	}
	
	public BoardFile(int postid, int fileid, String filename) {
		super();
		this.postid = postid;
		this.filename = filename;
	}
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	
}
