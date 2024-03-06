package sober.service;

import java.util.List;

import sober.model.AlarmDTO;
import sober.model.PartyRe;

public interface PartyReService {

	List<PartyRe> getPartyList(int bo_num);

	int re_insert(PartyRe reply);

	int re_insert_re(PartyRe reply);

	int re_step_update(int re_ref);

	int re_update_con(PartyRe reply);

	int getReReplyNum(int re_ref);

	int deleteReply(int re_num);

	void deleteUpdateRe(int re_num);

	int deleteReplyParent(PartyRe reply);

	int replyinsertAlarm(AlarmDTO alarm);

	String getNickname(int re_ref);

	int reReplyinsertAlarm(AlarmDTO alarm);

	void deleteReplyAlarm(AlarmDTO alarm);


}
