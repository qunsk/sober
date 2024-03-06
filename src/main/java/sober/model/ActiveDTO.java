package sober.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ActiveDTO {
	private int pk_num;
	private String title;
	private Timestamp regdate;
	private String nickname;
	private String table_name;
	private String table_url;
}
