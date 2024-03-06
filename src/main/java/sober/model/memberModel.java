package sober.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class memberModel {
	private String id;
	private String passwd;
	private String nickname;
	private String name;
	private String jumin1;
	private String jumin2;
	private String mailid;
	private String domain;
	private String region;
	private String sub_region;
	private String gender;
	private String profile;
	private Timestamp reg_date;
	private String state;
	private int worst;
	private String delcontent;
	private Timestamp deldate;
	private String phone;
	
	private int startRow;
	private int endRow;
	
	private String search;
	private String keyword;
}