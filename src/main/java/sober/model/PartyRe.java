package sober.model;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class PartyRe {

	private int re_num;
	private int bo_num;
	private String nickname;
	private String content;
	private Timestamp reg_date;
	private int re_ref;
	private int re_step;
	private String profile_img;
	private String re_del;
	
	
}
