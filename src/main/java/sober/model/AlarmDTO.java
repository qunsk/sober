package sober.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AlarmDTO {

	private int alarm_num;
	private String receiver_nickname;
	private int comment_num;
	private Timestamp happen_time; 
	private String read_yn; 
	private int board_pk;
	private String sender_nickname;
	
}
