package board.vo;

public class BoardFile {
	int postid;
	int fileid;
	String filename;
	
	public BoardFile() {
		super();
	}
	
	public BoardFile(int postid, int fileid, String filename) {
		super();
		this.postid = postid;
		this.fileid = fileid;
		this.filename = filename;
	}
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public int getFileid() {
		return fileid;
	}
	public void setFileid(int fileid) {
		this.fileid = fileid;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	
}
