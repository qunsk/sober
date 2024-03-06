package sober.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sober.dao.RecipeReplyMapper;
import sober.model.AlarmDTO;
import sober.model.RecipeReply;

@Service
public class RecipeReplyServiceImpl implements RecipeReplyService {

	@Autowired
	RecipeReplyMapper rrm;
	
	public int replyInsert(RecipeReply reply) {
		return rrm.replyInsert(reply);
	}

	public List<RecipeReply> relist(int r_num) {
		return rrm.relist(r_num);
	}

	public int getReReplyNum(int re_ref) {
		return rrm.getReReplyNum(re_ref);
	}

	public void replyDelUp(int re_num) {
		rrm.replyDelUp(re_num);
	}

	public int replyDel(int re_num) {
		return rrm.replyDel(re_num);
	}

	public int reUpCont(RecipeReply reply) {
		return rrm.reUpCont(reply);
	}

	public int reLevelUp(int re_ref) {
		return rrm.reLevelUp(re_ref);
	}

	public int re_replyInsert(RecipeReply reply) {
		return rrm.re_replyInsert(reply);
	}

	public int replyTotal(int r_num) {
		return rrm.replyTotal(r_num);
	}

	public void reply_alarm(AlarmDTO alarm) {
		rrm.reply_alarm(alarm);
	}

	public void re_reply_alarm(AlarmDTO alarm) {
		rrm.re_reply_alarm(alarm);
	}

	public String getNick(int re_ref) {
		return rrm.getNick(re_ref);
	}

	public void reply_alarm_del(AlarmDTO alarm) {
		rrm.reply_alarm_del(alarm);
	}

}
