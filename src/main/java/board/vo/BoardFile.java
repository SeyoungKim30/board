package board.vo;

public class BoardFile {
	int fileno;
	int refno;
	String filename;
	public BoardFile(int fileno, int refno, String filename) {
		super();
		this.fileno = fileno;
		this.refno = refno;
		this.filename = filename;
	}
	public BoardFile() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getFileno() {
		return fileno;
	}
	public void setFileno(int fileno) {
		this.fileno = fileno;
	}
	public int getRefno() {
		return refno;
	}
	public void setRefno(int refno) {
		this.refno = refno;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}


}
