package sober.model;

import java.sql.Date;

import lombok.Data;

@Data
public class AskDTO {
	private int ask_no;
	private String ask_content;
	private String nickname;
	private Date ask_date;
	private String ask_confirm;  
}
