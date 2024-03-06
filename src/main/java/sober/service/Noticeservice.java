package sober.service;

import java.util.List;

import sober.model.Notice;

public interface Noticeservice {
	
	void insert(Notice notice);
	
	void update(Notice notice);
	
	int delete(int notice_no);

	int getNotice(Notice notice);

	List<Notice> noticelist(Notice notice);

	Notice select(int notice_no);

	void read(int notice_no);
}
