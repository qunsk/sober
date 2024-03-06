package sober.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import sober.model.ActiveDTO;
import sober.model.AlarmListMaker;
import sober.model.PagingCriteria;
import sober.model.Party;
import sober.model.PartyScheduleDTO;
import sober.model.ProfileDTO;

public interface MypageMapper {
	
	public ProfileDTO getProfile(String nickname);

	public int modifyProfile(ProfileDTO profile);
	
	public int getUnreadAlarmCount(String nickname);
	
	public List<AlarmListMaker> getAlarmList(PagingCriteria cri);
	
	public int getAlarmTotal(String nickname);

	public int readAlarm(int alarm_num);

	public boolean deleteAlarm(int alarm_num);

	public List<PartyScheduleDTO> getSchedules(@Param("nickname") String nickname,@Param("year") String year,@Param("month") String month);
	
	public List<ActiveDTO> getMyPostList(PagingCriteria cri);
	public int getMyPostTotal(String nickname);
	
	public List<ActiveDTO> getMyLikePostList(PagingCriteria cri);
	public int getMyLikePostTotal(String nickname);
	
	public List<ActiveDTO> getMyReplyList(PagingCriteria cri);
	public int getMyReplyTotal(String nickname);
	
	public List<Party> getAttendingPartyList(PagingCriteria cri);
	public int getAttendingPartyTotal(String nickname);

	public String checkUnsigned(String nickname);
}
