package sober.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import lombok.Setter;
import sober.dao.HomeMapper;
import sober.model.HomeVO;
import sober.model.PagingCriteria;

@Controller
public class HomeServiceImpl implements HomeService{
	
	@Setter(onMethod_ = @Autowired)
	private HomeMapper homeMapper;
	
	@Override
	public List<HomeVO> getPopularCocktail() {
		return homeMapper.getPopularCocktail();
	}

	@Override
	public List<HomeVO> getPopularParty() {
		return homeMapper.getPopularParty();
	}

	@Override
	public List<HomeVO> getPopularFood() {
		return homeMapper.getPopularFood();
	}

	@Override
	public List<HomeVO> getRecentNotice() {
		return homeMapper.getRecentNotice();
	}

	@Override
	public List<HomeVO> entireSearch(PagingCriteria cri) {
		
		switch(cri.getTable_num()) {
		case "0" : return homeMapper.entireSearch(cri);
		case "1" : return homeMapper.entireSearchC(cri);
		case "2" : return homeMapper.entireSearchP(cri);
		case "3" : return homeMapper.entireSearchF(cri);
		case "5" : return homeMapper.entireSearchN(cri);
		default : return null;
		}
	}

	@Override
	public int entireSearchTotal(PagingCriteria cri) {
		
		switch(cri.getTable_num()) {
		case "0" : return homeMapper.entireSearchTotal(cri);
		case "1" : return homeMapper.entireSearchTotalC(cri);
		case "2" : return homeMapper.entireSearchTotalP(cri);
		case "3" : return homeMapper.entireSearchTotalF(cri);
		case "5" : return homeMapper.entireSearchTotalN(cri);
		default : return 0;
		}
		
	}

}
