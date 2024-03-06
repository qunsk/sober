package sober.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sober.dao.VisitCountDAO;
import sober.model.VisitCountVO;

@Service
public class VisitServiceImpl implements VisitService {
	@Autowired
	private VisitCountDAO visitCountDAO;

	@Override
	public int insert(VisitCountVO vo) {
		return visitCountDAO.insert(vo);
	}

	@Override
	public List<VisitCountVO> iplist() {
		return visitCountDAO.iplist();
	}

	@Override
	public List<Map<String, String>> mcount() {
		return visitCountDAO.mcount();
	}

	public int host() {
		return visitCountDAO.host();
	}

	public int naver() {
		return visitCountDAO.naver();
	}

	public int google() {
		return visitCountDAO.google();
	}
	
	
}
	 