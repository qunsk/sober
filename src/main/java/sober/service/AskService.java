package sober.service;

import java.util.List;

import sober.model.AskDTO;

public interface AskService {

	public List<AskDTO> getList(int pageNum, String nickname);
	
	public List<AskDTO> getListOrder(int pageNum, String nickname);
	
	public AskDTO get(int ask_no);
	
	public boolean post(AskDTO dto);
	
	public int delete(int ask_no);

	public int modify(AskDTO dto);

	public int getTotal(String nickname);
	
	public String getReply(int ask_no);

}
