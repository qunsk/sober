package sober.model;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class PartyList {

	private int li_num;
	private int bo_num;
	private Timestamp apply_date;
	private String status;
	private String nickname;
	private String isLeader;
	private String profile_img;
	private String message;
	private String gender;
	
}
