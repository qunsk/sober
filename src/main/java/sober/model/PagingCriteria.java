package sober.model;

import lombok.Data;

@Data
public class PagingCriteria {
	
	private String nickname;
	private int pageNum;
	private int amount;
	private String keyword;
	private String table_num = "0";
	
	public PagingCriteria() {
		this(1, 10);
	}
	
	public PagingCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
