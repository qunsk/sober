package sober.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AskReDTO {

	private int ask_re_no;
	private String ask_re_content;
	private int ask_no;
	private Timestamp ask_re_date;
	
	
}
