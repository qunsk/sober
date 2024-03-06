package sober.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sober.dao.foodReplyDao;
import sober.model.AlarmDTO;
import sober.model.foodReplyModel;

@Service
public class foodReplyService {

	@Autowired
	foodReplyDao frd;

	public List<foodReplyModel> relist(int f_num) {
		return frd.relist(f_num);
	}

	public int replyInsert(foodReplyModel reply) {
		return frd.replyInsert(reply);
	}

	public int reLevelUp(int re_ref) {
		return frd.reLevelUp(re_ref);
	}

	public int reUpCont(foodReplyModel reply) {
		return frd.reUpCont(reply);
	}

	public int getReReplyNum(int re_ref) {
		return frd.getReReplyNum(re_ref);
	}

	public void replyDelUp(int re_num) {
		frd.replyDelUp(re_num);
	}

	public int replyDel(int re_num) {
		return frd.replyDel(re_num);
	}
	
	public int re_replyInsert(foodReplyModel reply) {
		return frd.re_replyInsert(reply);
	}

	public int replyTotal(int f_num) {
		return frd.replyTotal(f_num);
	}

	public void reply_alarm(AlarmDTO alarm) {
		frd.reply_alarm(alarm);
	}

	public String getNick(int re_ref) {
		return frd.getNick(re_ref);
	}

	public void re_reply_alarm(AlarmDTO alarm) {
		frd.re_reply_alarm(alarm);
		
	}

	public void reply_alarm_del(AlarmDTO alarm) {
		frd.reply_alarm_del(alarm);
		
	}
}
