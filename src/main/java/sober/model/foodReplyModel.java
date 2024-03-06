package sober.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class foodReplyModel {
	private int re_num;
	private int f_num;
	private String nickname;
	private String content;
	private Timestamp reg_date;
	private int re_ref;
	private int re_step;
	private String del_yn;
	private String profile_img;
}
