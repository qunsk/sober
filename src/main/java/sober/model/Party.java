package sober.model;

import java.sql.Timestamp;


import lombok.Data;
@Data
public class Party {
	private int bo_num;
	private String location;
	private Timestamp schedule;
	private String age;
	private int num_of_people;
	private String gender;
	private String title;
	private String content;
	private Timestamp reg_date;
	private int readcount;
	private String bar_name;
	private String nickname;
	private String region;
	private int num_limit;
	private String profile_img;
	
	//검색 조회용
	private String search;
	private String keyword;
	
	private int startRow;
	private int endRow;
	
}
 