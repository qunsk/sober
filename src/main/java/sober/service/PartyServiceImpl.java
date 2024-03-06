package sober.service;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sober.dao.PartyDAO;
import sober.dao.PartyListDAO;
import sober.model.AlarmDTO;
import sober.model.Party;
import sober.model.PartyMemInfo;

@Service
public class PartyServiceImpl implements PartyService {

	@Autowired
	private PartyDAO dao;
	@Autowired
	private PartyListDAO parlist;

	@Override
	public int par_insert(Party p) {
		return dao.par_insert(p);
	}

	@Override
	public int getBoardCount(Party pa) {
		return dao.getBoardCount(pa);
	}

	@Override
	public List<Party> getBoardList(Party pa) {
		return dao.getBoardList(pa);
	}

	@Override
	public Party getPartyBoard(int bo_num) {
		return dao.getPartyBoard(bo_num);
	}

	@Override
	public void readupdate(int bo_num) {
		dao.readupdate(bo_num);
	}

	@Override
	public String getMemberProfile(String attribute) {
		return dao.getMemberProfile(attribute);
	}

	@Override
	public PartyMemInfo getMember(String nickname) {
		return dao.getMember(nickname);
	}
	
	@Override
	public int boardDelete(Party pa) {
		return dao.boardDelete(pa);
	}
	
	@Override
	public int applyAlarm(AlarmDTO alarm) {
		return dao.applyAlarm(alarm);
	}
	
	@Override
	public int sendCapacityFullAlert(AlarmDTO dto) {
		return dao.sendCapacityFullAlert(dto);
	}
	
	@Override
	public void updateNumLimit(int bo_num) {
	   dao.updateNumLimit(bo_num);
	}
	
	@Override
	public void updateNumLimitZero(int bo_num) {
		dao.updateNumLimitZero(bo_num);
	}
	
	@Override
	public void sendCancel(AlarmDTO alarm) {
		dao.sendCancel(alarm);
	}
	
	@Override
	public String getNickname(int bo_num) {
		return dao.getNickname(bo_num);
	}
	
	@Override
	public void sendAcceted(AlarmDTO dto) {
		dao.sendAcceted(dto);
	}

	@Override
	public void sendDeclined(AlarmDTO dto) {
		dao.sendDeclined(dto);
	}
	
	@Override
	public void sendPartyCancel(AlarmDTO dto) {
		dao.sendPartyCancel(dto);
	}
	
	@Override
	public int par_update(Party p) {
		return dao.par_update(p);
	}
	
	@Override
	public int getPartySchedule(int bo_num) {
		
		Timestamp schd = dao.getPartySchedule(bo_num);
	    int result = compareTimestamp(schd);
		
		return result;
	}
	
	
	public int compareTimestamp(Timestamp timestamp) {
        Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());

        if (timestamp.before(currentTimestamp)) {
            return -1; // 이전 일정이라면
        } else if (timestamp.equals(currentTimestamp)) {
            return 0; // 동일한 시간과 날짜라면
        } else {
            return 1;
        }
    }
	
	
	
	
	@Override
	public int getAgeGroup(String nickname) {
		int age = 0;
		
		PartyMemInfo mem = dao.getMember(nickname);//960219-2
		
		
		int birthYear = Integer.parseInt(mem.getJumin().substring(0, 2));
		int currentYear = Calendar.getInstance().get(Calendar.YEAR) % 100;
		age = currentYear - birthYear + 1;
		if (mem.getJumin().charAt(7) == '1' || mem.getJumin().charAt(7) == '2') {
			age += 100;
		}
		
		int result = 0;
		
		if(age%10>=0 && age%10<=3) {
			result = age/10*10;
		}else if(age%10>=4 && age%10<=6) {
			result = age/10*10+5;
		}else if(age%10>=7 && age%10<=9) {
			result = age/10*10+9;
		}
		
		return result;
	}
	
	
	
	
	@Override
	public String setGender(String gender) {
		String krGender = "";
		
		if(gender.equals("male")) {
			krGender = "남성";
		}else if(gender.equals("female")){
			krGender = "여성";
		}else {
			krGender = "성별 무관";
		}
		
		return krGender;
	}
	
	
	
	@Override
	public int checkAgeGroup(String userage, String nickname) {
	    int fail = 0;
		
        String age_limit = userage;
		
		// 연령 무관이 아니라면 실행된다.
		if(!age_limit.equals("나이 무관")) {
		
			// 우선 연령대에서 거른다.
		    int age = getAgeGroup(nickname);
			
		    if(age_limit.length()==3) {
		    	if(!age_limit.substring(0,1).equals(String.valueOf(age/10))) {
		    		fail = 1;
		    	}
		    }else {

		    	String age_suf = age_limit.substring(4);
		    	
				switch (age_suf) {
				case "초반":
					if(age!=20)fail=1;
					break;
				case "중반":
					if(age!=25)fail=1;
					break;
				case "후반":
					if(age!=29)fail=1;
					break;
				}
		    	
		    }
	
		}    
		return fail;
	}
	
	
	@Override
	public int getAgeLimitToUpdate(int bo_num,String nickname) {
		
		int result = 5;
		List<String> nickArr = parlist.getPartyMemberList(bo_num);
		
		int count1 = 0;
		int count2 = 0;
		
		int userAge = getAgeGroup(nickname);
		int user_pre = userAge/10; //2
		int user_suf = userAge%10; //9
		
		for(int i=0; i<nickArr.size() ; i++) {
			int tmp = getAgeGroup(nickArr.get(i));
			
			if(tmp/10 > user_pre || tmp/10 < user_pre) {
				count1 ++;
			}else if(tmp%10 != user_suf) {
				count2 ++;
			}
		}
		
		if(count1!=0) {
			result = 10;
		}else if(count1==0 && count2!=0) {
			result = -1;
		}
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
