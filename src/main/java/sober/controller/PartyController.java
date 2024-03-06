package sober.controller;

import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sober.model.AlarmDTO;
import sober.model.Party;
import sober.model.PartyList;
import sober.model.PartyMemInfo;
import sober.service.PartyListService;
import sober.service.PartyService;

@Controller
public class PartyController {
	
	@Value("${kakaomap_key}")
	private String kakaokey;

	
	@Autowired
	private PartyService party;
	@Autowired
	private PartyListService parlist;
	
	@RequestMapping("partylist")
	public String partylist() {
		return "public/paging_page";
	}
	
	
	
	
	
	
	@RequestMapping("partywriteform")
	public String partywriteform(Model model,HttpSession session) {	
		
		String nickname = (String)session.getAttribute("nickname");
		
		// 연령대와 성별을 구해서 Member 객체로 리턴
	    PartyMemInfo mem = party.getMember(nickname);
	   
	    int age = party.getAgeGroup(nickname);
	    
	    model.addAttribute("agegroup",age);
	    model.addAttribute("usergender",mem.getGender());
		model.addAttribute("key",kakaokey);
		return "party/partywriteform";
	}
	
	// 해당 유저의 닉네임과 날짜로 해당 날짜에 다른 일정이 있는지 확인한다. 
	@RequestMapping("memberScheduleCheck")
	@ResponseBody
	public String memberScheduleCheck(String nickname,String date) {
		int result = 0;
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("nickname", nickname);
		map.put("day", date);
		result = parlist.checkDuplicate(map);
		
		return String.valueOf(result);
	}
	
	
	
	// 글작성 -> 상세페이지
	@RequestMapping("party_insert")
	public String result(Party p,String schedule_,String hour,Model model,
			HttpSession session) {
		String t = schedule_+" "+hour+":00.0";
		Timestamp schedule = Timestamp.valueOf(t);
		
		
		p.setSchedule(schedule);
		p.setNickname((String)session.getAttribute("nickname"));
		
		String region = p.getLocation().substring(0, p.getLocation().indexOf(" "));
		p.setRegion(region);
        
		int result = party.par_insert(p);
		if(result==1) {
		}
		
		result = parlist.insert_list_Member(p);
		if(result == 1) {
		}
		
		// 유니코드는 인코딩 해준다. (닉네임이 한글인 경우)
		 String encodedNickname = URLEncoder.encode(p.getNickname());
		 String redirectURL = "redirect:party_detailpage?bo_num=" + p.getBo_num() + "&nickname=" + encodedNickname;
		  
		return redirectURL;
	}
	
	
	
	
	    // 리스트 -> 상세 페이지
		@RequestMapping("party_detailpage")
		public String party_detailpage(@RequestParam(value="page", defaultValue = "1") String page,
				Party partydto,
				HttpSession session,
				Model model,
				RedirectAttributes rdatt) {
			
			// 원문을 가져오기 전에 readcount ++1 시킴.
			String user = (String)session.getAttribute("nickname");
			if(user == null) {
				user=""; // NullPointer 에러를 막기 위해 빈문자열을 준다. 
			}
			
			// 만약 작성자가 아닌 유저 또는 비회원이라면 readcount 를 증가시킨다. 
			if(partydto.getNickname()!=null && !(user.equals(partydto.getNickname()))) {
				party.readupdate(partydto.getBo_num()); // 조회수 증가
			}
			
			// 원문 정보를 가져온다. 
			Party board = party.getPartyBoard(partydto.getBo_num());
		    
			// 완전 삭제된 게시글이면 마이페이지로 보낸다. 
			if(board==null) {
				//model.addAttribute("deletedPost","deletedPost");
				//return "/mypage/alarmList";
				System.out.println("여기서 멈추는데?");
				rdatt.addFlashAttribute("isdeletedboard","isdeletedboard");
				return "redirect:party_paging";
			}
					
			board.setProfile_img(party.getMemberProfile(board.getNickname()));
			
			//성별을 한국어로 세팅한다. 
			String gender = party.setGender(board.getGender());
			
			board.setGender(gender);
			board.setContent(board.getContent().replace("\n","<br>"));
			
			if(session.getAttribute("nickname")!=null) {
		    	String profile = party.getMemberProfile((String)session.getAttribute("nickname"));
		        model.addAttribute("userProfile",profile);
		    }
			
			// 접속중인 유저가 해당 파티에 참가신청(참가중)을 했는지 유무를 가져온다. 
			Party userParty = new Party();
			userParty.setBo_num(partydto.getBo_num());
			userParty.setNickname(user);
			
			String isAttending =  parlist.userAttending(userParty);
			
			model.addAttribute("page",page);
			model.addAttribute("pageinf",partydto);
			model.addAttribute("p",board);
			model.addAttribute("key",kakaokey);
			model.addAttribute("isAttending",isAttending); 
			
			return "party/party_detailpage";
		}
	
		
		
		

        // board 수정 폼으로 이동
		@RequestMapping("partyboardUpdate")
		public String partyboardUpdate(@RequestParam(value="page",defaultValue = "1") String page
				,Party dto
				,int memCount
				,Model model) {
			
			Party board = party.getPartyBoard(dto.getBo_num());
			
			// 연령대와 성별을 구해서 Member 객체로 리턴
		    PartyMemInfo mem = party.getMember(board.getNickname());
		    int age = party.getAgeGroup(board.getNickname());


		    String schedule = String.valueOf(board.getSchedule());
		    String date = schedule.substring(0,10);
		    String time = schedule.substring(11,16);
		    
		    int bo_num = board.getBo_num();
		    int group_gender = 0;
            if(memCount > 1) {
		        // 파티장 외에 파티원이 있다면 현재 참가 확정자 성별을 구해온다. ( 만약 혼성이라면 1 )
                group_gender = parlist.getGroupGender(bo_num);
                int age_limit = party.getAgeLimitToUpdate(bo_num,board.getNickname());
                // -1인 경우 : 20대 후반 , 나이 무관 선택가능 ( 좁은 범위  )
                // 10인 경우 : 나이무관밖에 선택할 수 없음. ( 제일 좁은 범위 ) 

                // 5 의 경우 : 무시( 제일 좁은 범위 선택 가능 ) empty인 경우
                if(age_limit != 5) {
				    model.addAttribute("age_limit", age_limit);
			    }
            }
            
            
		    // 파티 참가 확정자의 성별
		    model.addAttribute("g_gender",group_gender);
		    
		    // 기존 참가 확정자 수
		    model.addAttribute("memCount",memCount);

		    //유저의 나이대, 성별
		    model.addAttribute("agegroup",age);
		    model.addAttribute("usergender",mem.getGender());
			
		    
			//원문정보
			model.addAttribute("p",board);
			//카카오 키
			model.addAttribute("key",kakaokey);
			//글목록 이동을 위한 데이터를 가진 dto도 보낸다.
			model.addAttribute("pageinf",dto);
			model.addAttribute("page",page);
			
			// form 초기값 셋팅용 
			model.addAttribute("date",date);
			model.addAttribute("time",time);
			
			
			return "party/partyUpdateForm";
		}
		
			
		// board 수정 - sql update
		@RequestMapping("party_update")
		public String party_update(@RequestParam(value="page",defaultValue = "1") String page
				,Party p
				,String schedule_
				,String hour
				,Model model
				,HttpSession session
				,int memCount
				,String oldLocation
				,String sender_nickname) {  // 과거에 설정했던  region 값을 가져온다. ( 이게 검색필터에도 적용되나? )
			
			
			String t = schedule_+" "+hour+":00.0";
			Timestamp schedule = Timestamp.valueOf(t);
			
			
			p.setSchedule(schedule);
			
			
			
			// 업데이트 전 설정된 region 값을 가져온다. 
			String oldRegion = oldLocation.substring(0, oldLocation.indexOf(" "));
			
			
			// 새로 바뀐 지역으로 region 값 설정
			String region = p.getLocation().substring(0, p.getLocation().indexOf(" "));
			//String region_ = URLEncoder.encode(region);
			p.setRegion(region);
	        
			// 만약 지역 자체가 바뀌었다면 true
			String region_change = "true"; //false
			if(region.equals(oldRegion)) { 
				region_change = "false"; //true
			}
			
			int result = party.par_update(p);
			if(result==1) {
			}
			
			
			if(memCount > 1) { // 만약 참가 확정자가 있는 글을 수정한 경우 변경되었다는 메세지를 보낸다. 
				
				List<String> nicknameArr = parlist.getPartyMemberList(p.getBo_num());
				AlarmDTO dto = new AlarmDTO();
				dto.setBoard_pk(p.getBo_num());
				dto.setSender_nickname(sender_nickname);
				for(int i=0;i<nicknameArr.size();i++) {
					dto.setReceiver_nickname(nicknameArr.get(i));
					parlist.sendUpdateMessage(dto);
				}
				
			}
			
			  
			String data = "bo_num="+p.getBo_num();    // 일단 여기에 추가는 해놓음
		
			return "redirect:party_detailpage?"+data;
		}
		
	
	
	@RequestMapping("party_paging")
	public String party_paging(@RequestParam(value="page", defaultValue = "1") String page,
			Model model,
			Party pa) {
		
		
		
		// 기본 변수 3개 생성
		int currentPage = Integer.parseInt(page); //현재 페이지
		int limit = 15; // 한페이지에 몇개의 레코드를 출력할 것인가( 고정값이라서 사실 삭제해도 될듯 ) 
		int count = party.getBoardCount(pa); // 총 데이터 수
		int block = 5;
		Party_PageMaker pk = new Party_PageMaker(limit,currentPage,count,block);
		
	    pa.setStartRow((currentPage-1)*limit+1);
	    pa.setEndRow(currentPage*limit);
	    
		List<Party> list = party.getBoardList(pa);
		
		
		model.addAttribute("list",list);
		model.addAttribute("paging",pk);
		model.addAttribute("region",pa.getRegion());
		model.addAttribute("search",pa.getSearch());
		model.addAttribute("keyword",pa.getKeyword());
		
		
		return "party/party_paging";
	}
	
	
	// 이거를 아예 party_detail.jsp 로 이동하는 컨트롤러에서 model로 공유하도록 변경합니다.( 이거 취소. 그냥 그대로)  
	@RequestMapping("party/getParty_member_num")
	@ResponseBody
	public String getParty_member_num(PartyList parli,Model model) {
		
		int result = parlist.getPk_num(parli.getBo_num());
		
		return String.valueOf(result);
	}
	
	
	
	//--------------- 여기 부터는 파티원 리스트 관련 메소드입니다. parlist를 사용해야합니다. 
	
	
	@RequestMapping("getPartyMemberList")
	public String getPartyMemberList(int bo_num,Model model) {
		
		List<PartyList> list = parlist.getPartyList(bo_num);
		model.addAttribute("memlist",list);
		
		return "party/party_member_list";
	}
	
	// 여기서 중복 일정 못잡게도 잡아준다. 
	@RequestMapping(value="party_member_join_check",produces = "text/plain;charset=UTF-8")//여기서 한글인코딩 해줘야 안깨지더라구요...
	@ResponseBody
	public String member_check(int bo_num,String nickname,
			String receiver_nickname,
			String date,
			Model model) {
		
		
		
		// 우선 원문의 데이터를 가져온다.
		Party board = party.getPartyBoard(bo_num);
		// 참가 신청한 유저의 info를 가져온다. 
		PartyMemInfo mem = party.getMember(nickname);
		
		
		String msg = "";
		//int fail = 0;
		
		int fail = party.checkAgeGroup(board.getAge(),nickname);

		
		Map<String,String> map = new HashMap<String,String>();
		map.put("nickname", nickname);
		map.put("day", date);
		int result = parlist.checkDuplicate(map);
		
		if(result != 0 ) {
			fail=2;
		}
		
		
		if(!board.getGender().equals("irrelevant")) {
			if(!(board.getGender().equals(mem.getGender()))) {
				fail = 3;
			}
			
		}
		  
		    
		if(fail==1) {
			msg="모집 조건의 연령대와 맞지 않아서 참가 신청이 불가능합니다. ";
		}else if(fail==2) {
			msg="해당 날짜에 참가 예정 또는 참가 확정인 일정이 있어 신청이 불가능합니다. ";
	    }else if(fail==3) {
			msg="모집 조건의 성별에 맞지 않아서 참가 신청이 불가능합니다. ";
		}else {
			msg="true";
		}
		
		return msg;
	}
	
	
	//참가신청 클릭시 팝업창을 띄우는 요청 처리 메소드
	@RequestMapping("party_mem_joinpage")
	public String partymemjoin(int bo_num,String nickname,Model model) {
		
		
		
		// 우선 원문의 데이터를 가져온다.
		Party board = party.getPartyBoard(bo_num);
		PartyMemInfo mem = party.getMember(nickname);
		
		
		model.addAttribute("board",board);
		model.addAttribute("member",mem);
		
		
		return "party/party_mem_joinpage";
	}
	
	
	// 파티일정이 마감된건지 체크한다. 
	@RequestMapping("partyCloseCheck")
	@ResponseBody
	public String partyCloseCheck(int bo_num) {
	    
		int result = party.getPartySchedule(bo_num);
		
		return String.valueOf(result);
	}
	
	
	
	
	
	
	
	// 참가자가 파티원 신청을 한 경우 party_member_list에 insert한다. 대기중인 상태로
	@RequestMapping(value="par_mem_apply_insert",produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String partymeminsert(PartyList mem, AlarmDTO alarm) {
		
		String msg="";
		
		int result = parlist.party_apply_insert(mem);
		if(result == 1) {
			msg="파티원 신청이 완료되었습니다. ";
			
			//여기서 알림테이블에 insert 해줍니다. 
		    alarm.setBoard_pk(mem.getBo_num());
		    alarm.setSender_nickname(mem.getNickname());
			// 받을 사람 닉네임값 ,요청 url , 테이블 넘버 셋팅 끝
		    
		    result = party.applyAlarm(alarm);
			
		}else {
			msg="파티원 신청 불가.";
		}
		
		return msg;
	}
	
	
	
	
	
	// 파티원 신청자 리스트를 모달에 로드하는 코드
	@RequestMapping("get_party_apply_list")
	public String get_party_apply_list(int bo_num,Model model) {
		
		List<PartyList> list = parlist.getPartyApplyList(bo_num);
		
		model.addAttribute("list",list);
		
		return "party/etc/party_apply_list";
	}
	 
	
	
	
	
	// 파티원 리스트 확인하고 수락 버튼 클릭시 status 를 accepted로 변경한다. 
	@RequestMapping("accepted_update")
	@ResponseBody
	public int accepted_update(int li_num,AlarmDTO dto) {
		// 여기서 수락 전에 유저에게 수락되었다는 알림을 보내는 코드 추가할 예정 
		party.sendAcceted(dto);
		
		
		int result = parlist.updateAccepted(li_num);
		
		return result; 
	}
	
	
	
	
	// 파티원 신청 거절 버튼 클릭시 실행
	@RequestMapping("declined_delete")
	@ResponseBody
	public int declined_delete(int li_num,AlarmDTO dto) {
		// 여기서 삭제 전에 먼저 유저에게 거절되었다는 알림을 보내는 코드 추가할 예정
		party.sendDeclined(dto);
		
		
		int result = parlist.deleteApply(li_num);
		return result;
	}
	
	
	
	
	
	//파티원 원문글을 완전 삭제하는 경우
	@RequestMapping("parboarddelete")
	public String partyboarddelete(Party pa) {
		
		
		// 파티장이 삭제한거여서 파티원들에게 알림 보내는 코드가 추가되어야한다. 
		AlarmDTO dto = new AlarmDTO(); 

		// 값을 dto에 먼저 할당하고
		dto.setBoard_pk(pa.getBo_num()); 
		dto.setSender_nickname(pa.getNickname());
		List<String> nickList = parlist.getPartyMemberList(pa.getBo_num());
		
		// 할당한 후에 해당 board를 삭제한다. 
		int result = party.boardDelete(pa);
		
		// 해당 보드에 대한 모~든 데이터를 알림데이터에서 삭제한다. 
		parlist.partyAlarmAllDel(pa.getBo_num());
		
		if(result == 1) {
			
			// 모임이 취소되었다고 파티원들에게 알림을 보낸다.
			if(nickList.size()>0) {
				for (int i = 0; i < nickList.size(); i++) {
					dto.setReceiver_nickname(nickList.get(i));
					party.sendPartyCancel(dto); // 취소되었다는 메세지를 모두에게 보낸다. 
					
				}
			}
		}
		
		return "redirect:party_paging";
	}
	
	
	
	
	
	// 파티 인원이 파티 신청 취소시 ( 파티장인 경우 x ) 
		@RequestMapping(value="par_mem_cancel",produces = "text/plain;charset=UTF-8")
		@ResponseBody
		public String part_mem_cancel(PartyList mem) {
			String msg = "";
			String update_limit = "";
			
			int lastNum = parlist.getPk_num(mem.getBo_num()); // 우선 기존에 정원이 full이었는지 가져온다. 
			Party p = party.getPartyBoard(mem.getBo_num());
			
			AlarmDTO alarm = new AlarmDTO();
			alarm.setReceiver_nickname(party.getNickname(p.getBo_num()));
			alarm.setBoard_pk(p.getBo_num());
		    alarm.setSender_nickname(mem.getNickname());

			if(p.getNum_of_people()==lastNum) {
				update_limit = "full";
			}
			
			int result = parlist.party_cancel(mem);
			if(result == 1) {
				msg="파티원 참가 취소 되었습니다. ";
				
				party.sendCancel(alarm);
				
				// 만약 이 인원까지 포함해서 정원이 full이었다면 다시 full이 되었을 때,정원이 꽉 찼음을 알리는 알림을 보낼 수 있도록 한다. 
				if(update_limit.equals("full")) {
					party.updateNumLimit(mem.getBo_num());
				}
			}else {
				msg="파티원 part_mem_cancel 실패~!";
			}
			
			return msg;
		}
	
	
		
		
		
	// 정원이 차고, num_limit이 1일 때 알림을 보내고 num_limit을 0으로 변경(다음에 로드될 때는 o이기 때문에 insert ㄴㄴ ) 
	@RequestMapping("sendCapacityFullAlert")
	@ResponseBody
	public String sendCapacityFullAlert(AlarmDTO dto) {
		Party p = party.getPartyBoard(dto.getBoard_pk());
		if (p.getNum_limit() == 1) {
			int result = party.sendCapacityFullAlert(dto);
			party.updateNumLimitZero(dto.getBoard_pk());
			return "change";
		}
		return null;
	}
	
	
	
}
