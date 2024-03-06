package sober.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Recipe {

	private int r_num;
	private String nickname;
	private String flavor;
	private String cocktail_name;
	private String detail;
	private String img_url;
	private Timestamp register;
	private int readcount;
	private int like_count;
	
	// 프사
	private String profile_img;
	
	// 댓글 카운트
	private int replycount;
	
	// page
	private int startRow;
	private int endRow;
	
	// 도수 계산
	private double abv_result;
	
	// 검색
	private String search_m;
	private String search_f;
	private String search_abv;
	private String keyword;
	
}
