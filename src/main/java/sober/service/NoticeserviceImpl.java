package sober.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sober.dao.NoticeDAO;
import sober.model.Notice;

@Service
public class NoticeserviceImpl implements Noticeservice{

	@Autowired
	private NoticeDAO dao;

	@Override
	public void insert(Notice notice) {
		dao.insert(notice);
	}

	@Override
	public void update(Notice notice) {
		dao.update(notice);
	}

	@Override
	public int delete(int notice_no) {
		return dao.delete(notice_no);
	}

	@Override
	public int getNotice(Notice notice) {
		return dao.getNotice(notice);
	}

	@Override
	public List<Notice> noticelist(Notice notice) {
		return dao.noticelist(notice);
	}
	
	@Override
	public Notice select(int notice_no) {
		return dao.select(notice_no);
	}

	public void read(int notice_no) {
		dao.read(notice_no);
	}
}
