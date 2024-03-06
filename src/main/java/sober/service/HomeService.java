package sober.service;

import java.util.List;

import sober.model.HomeVO;
import sober.model.PagingCriteria;

public interface HomeService {
	public List<HomeVO> getPopularCocktail();
	public List<HomeVO> getPopularParty();
	public List<HomeVO> getPopularFood();
	public List<HomeVO> getRecentNotice();
	public List<HomeVO> entireSearch(PagingCriteria cri);
	public int entireSearchTotal(PagingCriteria cri);
}
