package sober.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MasterAsk {
	private int ask_no;
	private String ask_confirm;
	private String ask_content;
	private Timestamp ask_date;
	private String nickname;
	//여기를 추가함
	private String ask_re_content;
	
	private String profile_img;
		
	private int startRow;
	private int endRow;
	
}
