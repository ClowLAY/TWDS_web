package com.zzptc.twds.pojo;

public class PageInfor {
	protected int page;
	protected int rows;
	protected int beginIndex;
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getBeginIndex() {
		return (this.page-1)*rows;
	}
	/*public void setBeginIndex(int beginIndex) {
		this.beginIndex = beginIndex;
	}*/
	
	
}
