package sober.model;

import java.sql.Date;

import lombok.Data;

@Data
public class MessageDTO {
	private int message_num;
	private String receiver_nickname;
	private String sender_nickname;
	private String title;
	private String content;
	private Date reg_date;
	private Date read_time;
	private String read_yn;
	private String reply_yn;
}
