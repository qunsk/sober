package sober.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sober.dao.PartyListDAO;
import sober.model.AlarmDTO;
import sober.model.Party;
import sober.model.PartyList;

@Service
public class PartyListServiceImpl implements PartyListService {

	@Autowired
	private PartyListDAO dao;

	/*
	 * @Override public int getPk_num(PartyList parli) { return
	 * dao.getPk_num(parli); }
	 */

	@Override
	public int getPk_num(int bo_num) {
		return dao.getPk_num(bo_num);
	}

	@Override
	public int insert_list_Member(Party p) {
		return dao.insert_list_Member(p);
	}

	@Override
	public List<PartyList> getPartyList(int bo_num) {
		return dao.getPartyList(bo_num);
	}

	@Override
	public int party_apply_insert(PartyList mem) {
		return dao.party_apply_insert(mem);
	}

	@Override
	public String userAttending(Party userParty) {
		return dao.userAttending(userParty);
	}

	@Override
	public int party_cancel(PartyList mem) {
		return dao.party_cancel(mem);
	}

	@Override
	public List<PartyList> getPartyApplyList(int bo_num) {
		return dao.getPartyApplyList(bo_num);
	}

	@Override
	public int updateAccepted(int li_num) {
		return dao.updateAccepted(li_num);
	}

	@Override
	public int deleteApply(int li_num) {
		return dao.deleteApply(li_num);
	}

	@Override
	public List<String> getPartyMemberList(int bo_num) {
		return dao.getPartyMemberList(bo_num);
	}

	@Override
	public List<String> getGenderList(int bo_num) {
		return dao.getGenderList(bo_num);
	}

	@Override
	public int getGroupGender(int bo_num) {
		int result = 0;

		List<String> genderlist = getGenderList(bo_num);
		for (int i = 0; i < genderlist.size() - 1; i++) {
			if (!genderlist.get(i).equals(genderlist.get(i + 1))) {
				result = 1;
			}
		}

		return result;
	}
	
	@Override
	public void sendUpdateMessage(AlarmDTO dto) {
	      dao.sendUpdateMessage(dto); 	
	}
	
	@Override
	public int checkDuplicate(Map<String, String> map) {
		return dao.checkDuplicate(map);
	}
	
	
	@Override
	public void partyAlarmAllDel(int bo_num) {
	    dao.partyAlarmAllDel(bo_num);
	}
	
	
}
