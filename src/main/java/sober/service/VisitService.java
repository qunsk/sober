package sober.service;

import java.util.List;
import java.util.Map;

import sober.model.VisitCountVO;

public interface VisitService {
	int insert(VisitCountVO vo);
	
	List<VisitCountVO> iplist();
	
	List<Map<String, String>> mcount();
	
	int host();
	
	int naver();
	
	int google();
}
