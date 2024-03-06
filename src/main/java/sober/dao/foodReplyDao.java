package sober.dao;

import java.util.List;

import sober.model.AlarmDTO;
import sober.model.foodReplyModel;

public interface foodReplyDao {

	List<foodReplyModel> relist(int f_num);

	int replyInsert(foodReplyModel reply);

	int reLevelUp(int re_ref);

	int reUpCont(foodReplyModel reply);

	int getReReplyNum(int re_ref);

	void replyDelUp(int re_num);

	int replyDel(int re_num);

	int re_replyInsert(foodReplyModel reply);

	int replyTotal(int f_num);

	void reply_alarm(AlarmDTO alarm);
	
	String getNick(int re_ref);

	void re_reply_alarm(AlarmDTO alarm);

	void reply_alarm_del(AlarmDTO alarm);
	
	
}
