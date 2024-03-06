package sober.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import sober.model.ActiveDTO;
import sober.model.AlarmListMaker;
import sober.model.MessageDTO;
import sober.model.PagingCriteria;
import sober.model.Party;
import sober.model.PartyScheduleDTO;
import sober.model.ProfileDTO;

public interface MypageService {
	
//	******************************************************************************
//	메세지 관련 서비스 메서드
	
	public List<MessageDTO> getReceiveList(PagingCriteria cri);
	
	public int getReceiveTotal(PagingCriteria cri);
	
	public boolean replyMessage(MessageDTO message, int old_message_num);
	
	//받은 쪽지함에서 쪽지 읽기
	public MessageDTO readMessage(int Message_num);
	//보낸 쪽지함에서 쪽지 읽기
	public MessageDTO getMessage(int message_num);
	
	public boolean deleteReceiveMessage(int message_num);

	public boolean deleteSendMessage(int message_num);
	
	public int getUnreadTotal(String nickname);
	
//	메세지 관련 서비스 메서드
//	******************************************************************************
	
//	******************************************************************************
//	프로필 관련 서비스 메서드
	
	public ProfileDTO getProfile(String nickname);
	
	public boolean modifyProfile(MultipartFile file, ProfileDTO profile, String[] keywords, HttpSession session);
	
	public boolean sendMessage(MessageDTO message);

	public Object getSendList(PagingCriteria cri);

	public int getSendTotal(PagingCriteria cri);
	
//	프로필 관련 서비스 메서드
//	******************************************************************************
	
//	******************************************************************************
//	마이페이지/활동내역 메인 관련 메서드
	
	public int getAlarmTotal(String nickname);
	
	public int getUnreadAlarmCount(String nickname);
	
	public List<AlarmListMaker> getAlarmList(PagingCriteria cri);

	public boolean readAlarm(int alarm_num);

	public boolean deleteAlarm(int alarm_num);
	
	public List<PartyScheduleDTO> getSchedules(String nickname, String year, String month);
	
	public List<ActiveDTO> getMyPostList(PagingCriteria cri);
	public int getMyPostTotal(String nickname);
	
	public List<ActiveDTO> getMyLikePostList(PagingCriteria cri);
	public int getMyLikePostTotal(String nickname);
	
	public List<ActiveDTO> getMyReplyList(PagingCriteria cri);
	public int getMyReplyTotal(String nickname);
	
	
	public List<Party> getAttendingPartyList(PagingCriteria cri);
	public int getAttendingPartyTotal(String nickname);
//	마이페이지 메인 관련 메서드 END
//	******************************************************************************

	public boolean checkUnsigned(String nickname);
}
