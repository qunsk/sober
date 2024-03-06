package sober.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import sober.dao.AskMapper;
import sober.model.AskDTO;

@Service
public class AskServiceImpl implements AskService{
	
	
	@Setter(onMethod_ =@Autowired)
	private AskMapper mapper;
	
	@Override
	public List<AskDTO> getList(int pageNum, String nickname) {
		return mapper.getList(pageNum, nickname);
	}
	
	@Override
	public List<AskDTO> getListOrder(int pageNum, String nickname) {
		return mapper.getListOrder(pageNum, nickname);
	}

	@Override
	public AskDTO get(int ask_no) {
		// TODO Auto-generated method stub
		AskDTO dto = mapper.get(ask_no);
		return dto;
	}
	
	@Override
	public boolean post(AskDTO dto) {
		return mapper.post(dto) == 1;
	}
	
	@Override
	public int delete(int ask_no) {
		return mapper.delete(ask_no);
		
	}

	@Override
	public int modify(AskDTO dto) {
		return mapper.modify(dto);
	}
	
	@Override
	public int getTotal(String nickname) {
		return mapper.getTotal(nickname);
	}
	
	@Override
	public String getReply(int ask_no) {
		return mapper.getReply(ask_no);
	}
	
}
