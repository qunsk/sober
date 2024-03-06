package sober.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Heart {

	private int r_num;
	private String nickname;
	private Timestamp like_dt;
	
	
}