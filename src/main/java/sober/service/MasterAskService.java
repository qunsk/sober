package sober.service;

import java.util.List;

import sober.model.MasterAsk;
import sober.model.ReAsk;

public interface MasterAskService {
	int getTotal(MasterAsk ask);
	
	List<MasterAsk> list(MasterAsk ask);
	
	MasterAsk select(int ask_no);

	void see(int ask_no);
	
	ReAsk reselect(int ask_no);
	
	void insert(ReAsk reask);
	
	void check(int ask_no);
	
	void alert(MasterAsk ask);
	
	String getMemberProfile(String attribute);
}
