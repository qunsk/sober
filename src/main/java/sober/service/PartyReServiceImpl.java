package sober.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sober.dao.PartyReDAO;
import sober.model.AlarmDTO;
import sober.model.PartyRe;

@Service
public class PartyReServiceImpl implements PartyReService {

	
	@Autowired
	private PartyReDAO dao;
	
	@Override
	public List getPartyList(int bo_num) {
		return dao.getPartyList(bo_num);
	}
	
	@Override
	public int re_insert(PartyRe reply) {
		return dao.re_insert(reply);
	}
	
	@Override
	public int re_insert_re(PartyRe reply) {
		return dao.re_insert_re(reply);
	}
	
	@Override
	public int re_step_update(int re_ref) {
		return dao.re_step_update(re_ref);
	}
	
	@Override
	public int re_update_con(PartyRe reply) {
		return dao.re_update_con(reply);
	}
	
	@Override
	public int getReReplyNum(int re_ref) {
		return dao.getReReplyNum(re_ref);
	}
	
	
	@Override
	public int deleteReply(int re_num) {
		return dao.deleteReply(re_num);
	}
	
	@Override
	public void deleteUpdateRe(int re_num) {
		dao.deleteUpdateRe(re_num);
	}
	
	@Override
	public int deleteReplyParent(PartyRe reply) {
		return dao.deleteReplyParent(reply);
	}
	
	@Override
	public int replyinsertAlarm(AlarmDTO alarm) {
		return dao.replyinsertAlarm(alarm);
	}
	
	@Override
	public String getNickname(int re_ref) {
		return dao.getNickname(re_ref);
	}
	@Override
	public int reReplyinsertAlarm(AlarmDTO alarm) {
		return dao.reReplyinsertAlarm(alarm);
	}
	
	@Override
	public void deleteReplyAlarm(AlarmDTO alarm) {
		dao.deleteReplyAlarm(alarm);
	}
	
}
