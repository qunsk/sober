package sober.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import sober.model.AlarmDTO;
import sober.model.Party;
import sober.model.PartyList;
import sober.model.PartyMemInfo;

public interface PartyService {

	int par_insert(Party p);

	int getBoardCount(Party pa);

	List<Party> getBoardList(Party pa);


	Party getPartyBoard(int bo_num);

	void readupdate(int bo_num);

	String getMemberProfile(String attribute);


	PartyMemInfo getMember(String nickname);


	int boardDelete(Party pa);

	int applyAlarm(AlarmDTO alarm);

	int sendCapacityFullAlert(AlarmDTO dto);

	void updateNumLimit(int bo_num);

	void updateNumLimitZero(int board_pk);

	void sendCancel(AlarmDTO alarm);

	String getNickname(int bo_num);

	void sendAcceted(AlarmDTO dto);

	void sendDeclined(AlarmDTO dto);

	void sendPartyCancel(AlarmDTO dto);

	int getAgeGroup(String nickname);

	String setGender(String gender);

	int checkAgeGroup(String userage, String nickname);

	int getAgeLimitToUpdate(int bo_num,String nickname);

	int par_update(Party p);

	int getPartySchedule(int bo_num);

 

	
}
