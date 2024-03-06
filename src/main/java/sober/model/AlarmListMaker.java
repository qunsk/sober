package sober.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AlarmListMaker {
	private int alarm_num;
	private String receiver_nickname;
	private int comment_num;
	private Timestamp happen_time; 
	private String read_yn; 
	private int board_pk;
	private String comment_msg;
	private String table_url;
	private String sender_nickname;
}
