package sober.dao;

import java.util.List;
import java.util.Map;

import sober.model.AlarmDTO;
import sober.model.Party;
import sober.model.PartyList;

public interface PartyListDAO {

	//int getPk_num(PartyList parli);
	int getPk_num(int bo_num);

	int insert_list_Member(Party p);

	List<PartyList> getPartyList(int bo_num);

	int party_apply_insert(PartyList mem);

	String userAttending(Party userParty);

	int party_cancel(PartyList mem);

	List<PartyList> getPartyApplyList(int bo_num);

	int updateAccepted(int li_num);

	int deleteApply(int li_num);

	List<String> getPartyMemberList(int bo_num);

	List<String> getGenderList(int bo_num);

	void sendUpdateMessage(AlarmDTO dto);

	int checkDuplicate(Map<String, String> map);

	void partyAlarmAllDel(int bo_num);



}
