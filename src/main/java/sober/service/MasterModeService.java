package sober.service;

import java.util.List;
import java.util.Map;

import sober.model.MasterAsk;
import sober.model.memberModel;

public interface MasterModeService {
	List<memberModel> memberlist(memberModel member);
	
	int getTotal(memberModel member);
	
	void update(String id);
	
	List<memberModel> deletelist(memberModel member);
	
	int unread();
	
	int noticeupdate();

	int recent();
	
	List<Map<String, Integer>> graphlist();
	
	List<MasterAsk> asklist();
	
	int recipe();
	
	int party();
	
	int food();
	
	
}
