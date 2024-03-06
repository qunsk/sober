package sober.model;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PagingMaker {
	
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private PagingCriteria cri;
	
	public PagingMaker(PagingCriteria cri, int total) {
		
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum() / (double)cri.getAmount())) * cri.getAmount(); //선택할 수 있는 페이지 5개씩
		this.startPage = this.endPage - (cri.getAmount()-1);
		
		int realEnd = (int)(Math.ceil((total*1.0) / cri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
