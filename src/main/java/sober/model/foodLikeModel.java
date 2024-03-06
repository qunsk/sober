package sober.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class foodLikeModel {
	private int f_num;
	private String nickname;
	private Timestamp like_dt;
}
