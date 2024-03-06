package sober.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sober.dao.MasterModeDAO;
import sober.model.MasterAsk;
import sober.model.memberModel;

@Service
public class MasterModeServiceImpl implements MasterModeService{
	@Autowired
	private MasterModeDAO dao;
	@Override
	public int recipe() {
		return dao.recipe();
	}

	@Override
	public int party() {
		return dao.party();
	}

	@Override
	public int food() {
		return dao.food();
	}


	public List<memberModel> memberlist(memberModel member) {
		return dao.memberlist(member);
	}

	public int getTotal(memberModel member) {
		return dao.getTotal(member);
	}

	public void update(String id) {
		dao.update(id);
	}

	public List<memberModel> deletelist(memberModel member) {
		return dao.deletelist(member);
	}
	
	public int unread() {
		return dao.unread();
	}

	public int noticeupdate() {
		return dao.noticeupdate();
	}

	public int recent() {
		return dao.recent();
	}

	public List<Map<String, Integer>> graphlist() {
		return dao.graphlist();
	}

	@Override
	public List<MasterAsk> asklist() {
		return dao.asklist();
	}

	
}
