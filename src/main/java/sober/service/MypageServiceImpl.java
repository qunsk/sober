package sober.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.Setter;
import sober.dao.MessageMapper;
import sober.dao.MypageMapper;
import sober.model.ActiveDTO;
import sober.model.AlarmListMaker;
import sober.model.MessageDTO;
import sober.model.PagingCriteria;
import sober.model.Party;
import sober.model.PartyScheduleDTO;
import sober.model.ProfileDTO;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Setter(onMethod_ = @Autowired)
	private MessageMapper messageMapper;
	
	@Setter(onMethod_ = @Autowired)
	private MypageMapper mypageMapper;
	
	
//	******************************************************************************
//	메세지 관련 서비스 메서드
	@Override
	public List<MessageDTO> getReceiveList(PagingCriteria cri) {
		return messageMapper.getReceiveList(cri);
	}

	@Override
	public int getReceiveTotal(PagingCriteria cri) {
		return messageMapper.getReceiveTotal(cri);
	}
	//프론트에서 미리 읽은 메시지인지 아닌지 보고 changeReplyYN() 메서드 호출이  하는게 효율적? 근데 개 귀찮지?? 야쓰
	@Override
	public boolean replyMessage(MessageDTO message, int old_message_num) {
		boolean check = messageMapper.sendMessage(message) == 1;
		messageMapper.changeReplyYN(old_message_num);
		messageMapper.alarmReplyMessage(message);
		return check;
	}
	
//	메세지 읽음 = readYN -> Y로 변경
	@Override
	public MessageDTO readMessage(int message_num) {
		messageMapper.changeReadYN(message_num);
		return messageMapper.getMessage(message_num);
	}
	
//	메세지 내용만 가지고 옴
	@Override
	public MessageDTO getMessage(int message_num) {
		return messageMapper.getMessage(message_num);
	}

	@Override
	public boolean deleteReceiveMessage(int message_num) {
		messageMapper.deleteMessageAlarm(message_num);
		return messageMapper.deleteMessage(message_num) == 1;
	}
	
	@Override
	public boolean deleteSendMessage(int message_num) {
		messageMapper.deleteMessageAlarm(message_num);
		return messageMapper.deleteMessage(message_num) == 1;
	}
	
	
	@Override
	public Object getSendList(PagingCriteria cri) {
		return messageMapper.getSendList(cri);
	}
	

	@Override
	public int getSendTotal(PagingCriteria cri) {
		return messageMapper.getSendTotal(cri);
	}
	
	@Override
	public int getUnreadTotal(String nickname) {
		return messageMapper.getUnreadTotal(nickname);
	}

//	메세지 관련 서비스 메서드 END
//	******************************************************************************
	
	
//	******************************************************************************
//	프로필 관련 메서드
	
	@Override
	public ProfileDTO getProfile(String nickname) {
		return mypageMapper.getProfile(nickname);
	}

	@Override
	public boolean sendMessage(MessageDTO message) {
		boolean check = messageMapper.sendMessage(message) == 1; 
		messageMapper.alarmSendMessage(message);
		return check;
	}

	@Override
	public boolean modifyProfile(MultipartFile file, ProfileDTO profile, String[] keywords, HttpSession session) {
		String fileRealName = file.getOriginalFilename();
		String oldFileName = mypageMapper.getProfile(profile.getNickname()).getProfile_img();
		
		if(!fileRealName.equals("")) {
			String fileExtension = FilenameUtils.getExtension(fileRealName);
			String uploadFolder = session.getServletContext().getRealPath("/resources/upload/mypage/");
			
			UUID uuid = UUID.randomUUID();
			
			File saveFile = new File(uploadFolder+uuid+"."+fileExtension);
			
			try {
				file.transferTo(saveFile);
				if(!oldFileName.equals("defaultProfileIMG.png")) {
					File oldFile = new File(uploadFolder+oldFileName);
					oldFile.delete();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			//프로필 테이블에 첨부파일 이름.확장자 저장
			profile.setProfile_img(uuid+"."+fileExtension);
			
		}else{
			profile.setProfile_img(oldFileName);
		}
		
		String keyword = "";
		for(String temp : keywords) {
			keyword += temp+",";
		}
		profile.setKeyword(keyword);
		
		//프로필 체크 여부 검사
		if(profile.getMbtiYN() == null) profile.setMbtiYN("N");
		if(profile.getAgeYN() == null) profile.setAgeYN("N");
		if(profile.getMovieYN() == null) profile.setMovieYN("N");
		if(profile.getMusicYN() == null) profile.setMusicYN("N");
		if(profile.getStrongYN() == null) profile.setStrongYN("N");
		if(profile.getStateYN() == null) profile.setStateYN("N");

		return mypageMapper.modifyProfile(profile) == 1;
	}


	
//	프로필 관련 메서드 END
//	******************************************************************************

//	******************************************************************************
//	마이페이지 메인 관련 메서드
	
	//전체 알람 글 수
	@Override
	public int getAlarmTotal(String nickname) {
		return mypageMapper.getAlarmTotal(nickname);
	}
	
	//읽지 않은 알람개수
	@Override
	public int getUnreadAlarmCount(String nickname) {
		return mypageMapper.getUnreadAlarmCount(nickname);
	}

	@Override
	public List<AlarmListMaker> getAlarmList(PagingCriteria cri) {
		return mypageMapper.getAlarmList(cri);
	}

	@Override
	public boolean readAlarm(int alarm_num) {
		return mypageMapper.readAlarm(alarm_num) == 1;
	}

	@Override
	public boolean deleteAlarm(int alarm_num) {
		return mypageMapper.deleteAlarm(alarm_num);
	}

	@Override
	public List<PartyScheduleDTO> getSchedules(String nickname, String year, String month) {
		return mypageMapper.getSchedules(nickname, year, month);
	}

	@Override
	public List<ActiveDTO> getMyPostList(PagingCriteria cri) {
		return mypageMapper.getMyPostList(cri);
	}

	@Override
	public List<ActiveDTO> getMyLikePostList(PagingCriteria cri) {
		return mypageMapper.getMyLikePostList(cri);
	}

	@Override
	public List<ActiveDTO> getMyReplyList(PagingCriteria cri) {
		return mypageMapper.getMyReplyList(cri);
	}

	@Override
	public int getMyPostTotal(String nickname) {
		return mypageMapper.getMyPostTotal(nickname);
	}

	@Override
	public int getMyLikePostTotal(String nickname) {
		return mypageMapper.getMyLikePostTotal(nickname);
	}

	@Override
	public int getMyReplyTotal(String nickname) {
		return mypageMapper.getMyReplyTotal(nickname);
	}

	@Override
	public List<Party> getAttendingPartyList(PagingCriteria cri) {
		return mypageMapper.getAttendingPartyList(cri);
	}

	@Override
	public int getAttendingPartyTotal(String nickname) {
		return mypageMapper.getAttendingPartyTotal(nickname);
	}

	@Override
	public boolean checkUnsigned(String nickname) {
		return mypageMapper.checkUnsigned(nickname).equals("X");
	}

	
//	마이페이지 메인 관련 메서드 END
//	******************************************************************************

}
