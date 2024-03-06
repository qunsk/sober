package sober.dao;

import java.util.List;

import sober.model.HomeVO;
import sober.model.PagingCriteria;

public interface HomeMapper {

	public List<HomeVO> getPopularCocktail();
	public List<HomeVO> getPopularParty();
	public List<HomeVO> getPopularFood();
	public List<HomeVO> getRecentNotice();
	
	public List<HomeVO> entireSearch(PagingCriteria cri);
	public int entireSearchTotal(PagingCriteria cri);
	
	public List<HomeVO> entireSearchC(PagingCriteria cri);
	public int entireSearchTotalC(PagingCriteria cri);
	
	public List<HomeVO> entireSearchP(PagingCriteria cri);
	public int entireSearchTotalP(PagingCriteria cri);
	
	public List<HomeVO> entireSearchF(PagingCriteria cri);
	public int entireSearchTotalF(PagingCriteria cri);
	
	public List<HomeVO> entireSearchN(PagingCriteria cri);
	public int entireSearchTotalN(PagingCriteria cri);
	
	
}
