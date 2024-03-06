package sober.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import sober.model.VisitCountVO;

@Mapper
public interface VisitCountDAO {

	int insert(VisitCountVO vo);
	
	List<VisitCountVO> iplist();
	
	List<Map<String, String>> mcount();

	int host();

	int naver();

	int google();
}
