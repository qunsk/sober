package sober.service;

import lombok.Data;

@Data
public class PagingMem {
	private int totalData;
	private int row;
	private int pagePer = 5;
	private int currentPage;
	
	private int startPage;
	private int endPage;
	private int totalPage;
	
	public PagingMem(int totalData, int row, int currentPage) {
		this.totalData = totalData;
		this.row = row;
		this.currentPage = currentPage;
		
		totalPage = (int)Math.ceil((double)totalData/row);
		startPage = currentPage - (currentPage - 1)%pagePer;
		endPage = startPage + pagePer - 1;
		
		if(endPage > totalPage)
			endPage = totalPage;
	}
	
}
