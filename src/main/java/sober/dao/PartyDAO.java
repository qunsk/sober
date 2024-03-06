package sober.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;

import sober.model.AlarmDTO;
import sober.model.Party;
import sober.model.PartyList;
import sober.model.PartyMemInfo;

@Mapper
public interface PartyDAO {

	int par_insert(Party p);

	int getBoardCount(Party pa);

	List<Party> getBoardList(Party pa);
	
	int getReplyCount(int bo_num);

	Party getPartyBoard(int bo_num);

	void readupdate(int bo_num);

	String getMemberProfile(String attribute);

	PartyMemInfo getMember(String nickname);

	int boardDelete(Party pa);

	int applyAlarm(AlarmDTO alarm);

	int sendCapacityFullAlert(AlarmDTO dto);

	void updateNumLimit(int bo_num);

	void updateNumLimitZero(int bo_num);

	void sendCancel(AlarmDTO alarm);

	String getNickname(int bo_num);

	void sendAcceted(AlarmDTO dto);

	void sendDeclined(AlarmDTO dto);

	void sendPartyCancel(AlarmDTO dto);

	List<String> getMemberProfile(int bo_num);

	int par_update(Party p);

	Timestamp getPartySchedule(int bo_num);







}
