package sober.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import sober.model.AskDTO;


public interface AskMapper {
	
	public AskDTO get(int no);

	public int post(AskDTO dto);
	
	public int delete(int no);

	public int modify(AskDTO dto);

	public List<AskDTO> getList(@Param("pageNum") int pageNum, @Param("nickname") String nickname);
	
	public int getTotal(String nickname);

	public List<AskDTO> getListOrder(@Param("pageNum") int pageNum, @Param("nickname") String nickname);

	public String getReply(int ask_no);
	

}
