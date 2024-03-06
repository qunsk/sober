package sober.service;

import lombok.Data;

@Data
public class foodPaging {
	private int total;
	private int rowPage;
	private int pageBlk = 5;
	private int currentPage;
	private int startPage;
	private int endPage;
	private int totalPage;
	
	public foodPaging(int total, int rowPage, int currentPage) {
		this.total = total;
		this.rowPage = rowPage;
		this.currentPage = currentPage;

		totalPage = (int) Math.ceil((double) total / rowPage);
		startPage = currentPage - (currentPage -1) % pageBlk;
		endPage = startPage + pageBlk - 1;
		if(endPage > totalPage)
			endPage = totalPage;
	}
	
	
}
