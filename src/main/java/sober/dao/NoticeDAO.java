package sober.dao;

import java.util.List;

import sober.model.Notice;

public interface NoticeDAO {
	void insert(Notice notice);
	
	void update(Notice notice);

	int getNotice(Notice notice);

	List<Notice> noticelist(Notice notice);

	Notice select(int notice_no);

	void read(int notice_no);

	int delete(int notice_no);
}
