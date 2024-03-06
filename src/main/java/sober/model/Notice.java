package sober.model;


import java.sql.Timestamp;

import lombok.Data;

@Data
public class Notice {
	private int notice_no;
	private String notice_type;
	private String notice_title;
	private String notice_content;
	private Timestamp notice_time;
	private int readcount;
	
	private int startRow;
	private int endRow;
	
	private String search;
	private String keyword;
}
