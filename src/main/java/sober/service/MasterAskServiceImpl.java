package sober.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sober.dao.MasterAskDAO;
import sober.model.MasterAsk;
import sober.model.ReAsk;

@Service
public class MasterAskServiceImpl implements MasterAskService{
	@Autowired
	private MasterAskDAO dao;

	public int getTotal(MasterAsk ask) {
		return dao.getTotal(ask);
	}

	public List<MasterAsk> list(MasterAsk ask) {
		return dao.list(ask);
	}

	public MasterAsk select(int ask_no) {
		return dao.select(ask_no);
	}

	public void see(int ask_no) {
		dao.see(ask_no);
	}

	public ReAsk reselect(int ask_no) {
		return dao.reselect(ask_no);
	}

	public void insert(ReAsk reask) {
		dao.insert(reask);
	}

	public void check(int ask_no) {
		dao.check(ask_no);
	}


	public void alert(MasterAsk ask) {
		dao.alert(ask);
	}

	public String getMemberProfile(String attribute) {
		return dao.getMemberProfile(attribute);
	}

}
