package sober.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReAsk {
	private int ask_no;
	private String ask_re_content;
	private Timestamp ask_re_date;
}
