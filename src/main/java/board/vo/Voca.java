package board.vo;

public class Voca {
	private int postid;
	private String[] vocaarr;
	
	public Voca() {
		super();
	}

	public Voca(int postid, String[] vocaarr) {
		super();
		this.postid = postid;
		this.vocaarr = vocaarr;
	}

	public int getPostid() {
		return postid;
	}

	public void setPostid(int postid) {
		this.postid = postid;
	}

	public String[] getVocaarr() {
		return vocaarr;
	}

	public void setVocaarr(String[] vocaarr) {
		this.vocaarr = vocaarr;
	}
}
