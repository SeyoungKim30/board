package board.vo;

import java.util.List;

public class Voca {
	private int postid;
	private String voca;
	private int frequency;
	
	private List<Voca> vocalist;
	
	public Voca() {
		super();
	}
	
	public Voca(String voca, int frequency) {
		super();
		this.voca = voca;
		this.frequency = frequency;
	}
	public Voca(int postid, List<Voca> vocalist) {
		super();
		this.postid = postid;
		this.vocalist = vocalist;
	}
	
	
	public Voca(int postid, String voca, int frequency, List<Voca> vocalist) {
		super();
		this.postid = postid;
		this.voca = voca;
		this.frequency = frequency;
		this.vocalist = vocalist;
	}

	public int getPostid() {
		return postid;
	}

	public void setPostid(int postid) {
		this.postid = postid;
	}

	public String getVoca() {
		return voca;
	}

	public void setVoca(String voca) {
		this.voca = voca;
	}

	public int getFrequency() {
		return frequency;
	}

	public void setFrequency(int frequency) {
		this.frequency = frequency;
	}

	public List<Voca> getVocalist() {
		return vocalist;
	}

	public void setVocalist(List<Voca> vocalist) {
		this.vocalist = vocalist;
	}

	
}
