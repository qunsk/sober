package sober.model;

import java.util.Date;

import lombok.Data;

@Data
public class HomeVO {
	private String uri;
	private int pk_num;
	private String img;
	private String title;
	private String nickname;
	private int readcount;
	private Date regdate;
	private String location;
	private String table_name;
	
	public void setLocation(String location) {
		this.location = location.substring(0, 2);
	}
}
