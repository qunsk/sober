package sober.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class foodBoardModel {
	private int f_num;
	private String nickname;	
	private String title;
	private String content;
	private Timestamp reg_date;
	private int readcount;
	private String img;
	private int like_count;
	private int replycount;
	private String profile_img;
	
	private int startRow; 
	private int endRow; 
	
	private String search;
	private String keyword;
	
}
