package sober.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class RecipeReply {

	private int re_num;
	private int r_num;
	private String content;
	private Timestamp register;
	private int re_ref;
	private int re_level;
	private String nickname;
	private String del_yn;
	
	// 프사
	private String profile_img;
	
}
