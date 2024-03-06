package sober.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import sober.model.PagingCriteria;
import sober.model.MessageDTO;

@Repository
public interface MessageMapper {
	
	public List<MessageDTO> getReceiveList(PagingCriteria cri);
	
	public int getReceiveTotal(PagingCriteria cri);
	
	public List<MessageDTO> getSendList(PagingCriteria cri);
	
	public int getSendTotal(PagingCriteria cri);
	
//	public int replyMessage(MessageDTO message);
	
	public MessageDTO getMessage(int message_num);
	
	public int deleteMessage(int message_num);

	public void changeReadYN(int message_num);

	public void changeReplyYN(int old_message_num);

	public int sendMessage(MessageDTO message);
	
	public void alarmSendMessage(MessageDTO message);
	
	public void alarmReplyMessage(MessageDTO message);

	public void deleteMessageAlarm(int message_num);
	
	public int getUnreadTotal(String nickname);
}
