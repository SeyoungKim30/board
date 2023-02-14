package board.vo;
// board.vo.BoardSch
public class BoardSch {
	String search_writer;
	String search_subject;
	
	int pageIndex;	//매번 페이지 파라미터로 받기
	int totalPage;
	int howmanyInonepage;
	
	int blockIndex;	//페이지 인덱스에 맞춰서? 
	int totalBlock;
	int howmanyInoneblock;
	public BoardSch() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardSch(int pageIndex, int totalPage, int howmanyInonepage, int blockIndex, int totalBlock,
			int howmanyInoneblock) {
		super();
		this.pageIndex = pageIndex;
		this.totalPage = totalPage;
		this.howmanyInonepage = howmanyInonepage;
		this.blockIndex = blockIndex;
		this.totalBlock = totalBlock;
		this.howmanyInoneblock = howmanyInoneblock;
	}
	
	
	public String getSearch_writer() {
		return search_writer;
	}
	public void setSearch_writer(String search_writer) {
		this.search_writer = search_writer;
	}
	public String getSearch_subject() {
		return search_subject;
	}
	public void setSearch_subject(String search_subject) {
		this.search_subject = search_subject;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getHowmanyInonepage() {
		return howmanyInonepage;
	}
	public void setHowmanyInonepage(int howmanyInonepage) {
		this.howmanyInonepage = howmanyInonepage;
	}
	public int getBlockIndex() {
		return blockIndex;
	}
	public void setBlockIndex(int blockIndex) {
		this.blockIndex = blockIndex;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getHowmanyInoneblock() {
		return howmanyInoneblock;
	}
	public void setHowmanyInoneblock(int howmanyInoneblock) {
		this.howmanyInoneblock = howmanyInoneblock;
	}
	
	
}
