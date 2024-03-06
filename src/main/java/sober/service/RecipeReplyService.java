package sober.service;

import java.util.List;

import sober.model.AlarmDTO;
import sober.model.RecipeReply;

public interface RecipeReplyService {

	int replyInsert(RecipeReply reply);

	List<RecipeReply> relist(int r_num);

	int getReReplyNum(int re_ref);

	void replyDelUp(int re_num);

	int replyDel(int re_num);

	int reUpCont(RecipeReply reply);

	int reLevelUp(int re_ref);

	int re_replyInsert(RecipeReply reply);

	int replyTotal(int r_num);

	void reply_alarm(AlarmDTO alarm);

	void re_reply_alarm(AlarmDTO alarm);

	String getNick(int re_ref);

	void reply_alarm_del(AlarmDTO alarm);
	

	
}
