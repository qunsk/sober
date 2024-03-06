package sober.controller;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import sober.model.memberModel;
import sober.service.RegionList;
import sober.service.memberService;

@Controller
@RequestMapping("/member/*")
public class memberController {
	@Autowired
	BCryptPasswordEncoder passEncoder;

	@Autowired
	private memberService memberService;

	private RegionList rg = new RegionList();

	// ID 중복검사 ajax
	@RequestMapping(value = "join_idcheck", method = RequestMethod.POST)
	public String member_idcheck(@RequestParam("memid") String id, Model model) throws Exception {
//		System.out.println("id:" + id);

		int result = memberService.idCheck(id);
//		System.out.println("result:" + result);

		model.addAttribute("result", result);

		return "member/idcheckResult";
	}

	// 닉네임 중복검사 ajax
	@RequestMapping(value = "join_nickcheck", method = RequestMethod.POST)
	public String member_nickcheck(@RequestParam("memnick") String nickname, Model model) throws Exception {
//		System.out.println("nickname:" + nickname);

		int result = memberService.nickCheck(nickname);
//		System.out.println("result:" + result);

		model.addAttribute("result", result);

		return "member/idcheckResult";
	}
	
	// 휴대폰 중복검사
//	@RequestMapping("phoneDuplChk")
//	@ResponseBody
//	public String member_phone(@RequestParam("phone") String phone, Model model) throws Exception{
//		
//		int result = memberService.phoneCheck(phone);
//		
//		return String.valueOf(result);
//	}
	
	// 가입 성공 페이지
	@RequestMapping("join_success")
	public String join_success() {
		return "member/join_success";
	}
	
	// 로그인폼
	@RequestMapping("loginform")
	public String loginform() {

		return "member/loginform";
	}

	// ID찾기 폼
	@RequestMapping("find_id")
	public String find_id() {

		return "member/find_id";
	};

	// 비번찾기 폼
	@RequestMapping("find_passwd")
	public String find_passwd() {

		return "member/find_passwd";
	};

	// 이용약관폼
	@RequestMapping("join_contract")
	public String contract() {

		return "member/join_contract";
	}

	// 회원가입폼
	@RequestMapping("join_form")
	public String join_form(Model model) {

		String[] regionList = rg.getRegionList();
		model.addAttribute("region", regionList);

		return "member/join_form";
	}

	// 회원가입_지역
	@RequestMapping("subregion")
	public String subregion(String region, Model model) {
//      System.out.println("컨트롤러 도달함");
		Map<String, String[]> map = rg.getSubRegion();
		String[] arr = null;

		for (Entry<String, String[]> entrySet : map.entrySet()) {
			if (entrySet.getKey().equals(region)) {
				arr = entrySet.getValue();
			}
		}
		model.addAttribute("arr", arr);
		return "member/etc/subRegion";
	}

	// 휴대폰 인증번호
	@RequestMapping("phoneChk")
	@ResponseBody
	public String phoneChk(String phone) {
		int randomNum = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000);

//		System.out.println("수신자 번호:" + phone);
//		System.out.println("인증번호:" + randomNum);
		memberService.phoneNumber(phone, randomNum);

		return Integer.toString(randomNum);
	}

	// 회원가입 성공
	@RequestMapping("join_ok")
	public String join_ok(memberModel member, Model model) throws Exception {

		// 비밀번호 암호화
		String inputPw = member.getPasswd();
		BCryptPasswordEncoder passEncoder = new BCryptPasswordEncoder();
		String passwd = passEncoder.encode(inputPw);

		member.setPasswd(passwd);

		// member.setProfile("sample"); //no_profile.jpg

		memberService.insertMember(member);
		memberService.insertProfile(member);

		return "member/join_success";
	}

	// ID 찾기
	@RequestMapping("find_id_ok")
	public String find_id_ok(memberModel member, Model model) throws Exception{
		 
		 int result = 0;
		 List<memberModel> dbmember = memberService.findId(member);
		 
		 if(dbmember == null) {	// 등록되지 않은 회원
			 
			 result = 1;
			 model.addAttribute("result", result);
			 
			 return "member/loginResult";
		 }
		 
		 model.addAttribute("dbmember", dbmember);
		 model.addAttribute("idOk", "아이디 확인");
		 
		 return "member/find_id";
	 }
	

	
	 // 비밀번호 찾기
	 @RequestMapping("find_passwd_ok")
	 public String find_passwd_ok(@RequestParam("name") String name, @RequestParam("id") String id,
			 @RequestParam("phone") String phone, HttpSession session, Model model) throws Exception{
		 
		 int result = 0;
		 memberModel member = memberService.findPasswd(id);
		 
		 if(member == null) {	// 등록되지 않은 회원
			 
			 result = 1;
			 model.addAttribute("result", result);
			 
			 return "member/loginResult";
		 }else {				// 등록된 회원
			 if(member.getPhone().equals(phone) && member.getName().equals(name)) {			// 정보 일치
				 
				 session.setAttribute("id", member.getId());
				 
				 model.addAttribute("pwdOk",member.getPasswd());
				 
				 return "member/find_passwd";
		}else {			// 정보 불일치
				 result = 2;
				 model.addAttribute("result", result);
				 
				 return "member/loginResult";
			 }
		 }
	 }
	
	// 비번 찾기_새로운 비밀번호 설정
	@RequestMapping("newPasswd")
	public String newPasswd(memberModel member, HttpSession session, Model model) {
		
		String id = (String) session.getAttribute("id");
		
		// 비밀번호 암호화
		String inputPw = member.getPasswd();
		BCryptPasswordEncoder passEncoder = new BCryptPasswordEncoder();
		String newPwd = passEncoder.encode(inputPw);

		member.setId(id);
		member.setPasswd(newPwd);
		
		memberService.newPwd(member);
		
		session.invalidate();
		
			return "member/find_pwdResult";
	}
	
	// 로그인 인증
	@RequestMapping("login_ok")
	public String login_ok(@RequestParam("id") String id, @RequestParam("passwd") String passwd, HttpSession session,
			Model model) throws Exception {

		int result = 0;
		memberModel member = memberService.userCheck(id);

		if (member == null) { // 등록되지 않은 회원

			result = 1;
			model.addAttribute("result", result);

			return "member/loginResult";

		} else { // 등록된 회원
			if (member.getPasswd().equals(passwd)) {				// 암호화x 정보 일치
				session.setAttribute("nickname", member.getNickname());
				
				if(member.getNickname().equals("관리자")) {
					return "redirect:/dashboard";
				}
				
				return "redirect:/";
			}else if(BCrypt.checkpw(passwd, member.getPasswd())){	// 암호화o 정보 일치
				session.setAttribute("nickname", member.getNickname());

				return "redirect:/";
			}else {													// 비번 불일치
				result = 2;
				model.addAttribute("result", result);

				return "member/loginResult";
			}
		}
	}
	
	// 로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}

	// 회원정보 수정폼
	@RequestMapping("update_form")
	public String update_form(HttpSession session, Model model){
		String nickname = (String) session.getAttribute("nickname");
		
		memberModel member = memberService.userNick(nickname);
		
		String[] regionList = rg.getRegionList();
		model.addAttribute("region", regionList);

		model.addAttribute("member", member);
		
		Map<String, String[]> map = rg.getSubRegion();
		String[] arr = null;

		for (Entry<String, String[]> entrySet : map.entrySet()) {
			if (entrySet.getKey().equals(member.getRegion())) {
				arr = entrySet.getValue();
			}
		}

		model.addAttribute("arr", arr);		
		
		return "member/update_form";
	}
	
	// 수정폼_지역
	@RequestMapping("sub_region")
	public String sub_region(memberModel member, String region, Model model) {
		Map<String, String[]> map = rg.getSubRegion();
		String[] arr = null;

		for (Entry<String, String[]> entrySet : map.entrySet()) {
			if (entrySet.getKey().equals(region)) {
				arr = entrySet.getValue();
			}
		}

		model.addAttribute("arr", arr);
		
		return "member/sub_region";
	}
	
	// 회원정보 수정
	@RequestMapping("update_ok")
	public String update_ok(memberModel member, HttpSession session, Model model ) throws Exception {
		
		int result = 0;
		String nickname = (String) session.getAttribute("nickname");
		memberModel dbMember = memberService.userNick(nickname);
		
		if (BCrypt.checkpw(member.getPasswd(), dbMember.getPasswd())) {	// 비번 일치
			
			// 비밀번호 암호화
			String inputPw = dbMember.getPasswd();
			BCryptPasswordEncoder passEncoder = new BCryptPasswordEncoder();
			String newPwd = passEncoder.encode(inputPw);
			
//			member.setNickname(nickname);
			member.setPasswd(newPwd);
			
			memberService.updateMember(member);
			
//			세션에 변경된 닉네임 저장
//			session.setAttribute("nickname", member.getNickname());
			
			result = 1;
			model.addAttribute("result", result);
			
			return "member/update_result";
				
		}else { // 비번 불일치

			result = 2;
			model.addAttribute("result", result);

			return "member/update_result";
		}
	}
	
	// 비밀번호 변경폼
	@RequestMapping("update_passwd")
	public String update_passwd() {
		
		return "member/update_passwd";
	}
	
	// 비밀번호 변경
	@RequestMapping("updatePw_ok")
	public String updatePw(@RequestParam("passwd") String passwd, @RequestParam("newpasswd") String newpasswd, 
				memberModel member, HttpSession session, Model model) {
		
		int result = 0;
		String nickname = (String) session.getAttribute("nickname");
		memberModel dbMember = memberService.userNick(nickname);
		
		if (BCrypt.checkpw(passwd, dbMember.getPasswd())) {	// 비번 일치
			
			// 비밀번호 암호화
			BCryptPasswordEncoder passEncoder = new BCryptPasswordEncoder();
			String newPwd = passEncoder.encode(newpasswd);
			
			member.setNickname(nickname);
			member.setPasswd(newPwd);
			
			memberService.updatePw(member);
			
			result = 3;
			model.addAttribute("result", result);
			
			return "redirect:/mypage/";
				
		}else { // 비번 불일치

			result = 2;
			model.addAttribute("result", result);

			return "member/update_result";
		}
	}
	
	// 회원탈퇴폼
	@RequestMapping("delete_form")
	public String delete_form(HttpSession session) {
		
		return "member/delete_form";
	}
	
	// 회원탈퇴
	@RequestMapping("delete_ok")
	public String delete_ok(@RequestParam("passwd") String passwd,
							@RequestParam("delcontent") String delcontent,
							HttpSession session, Model model){
		
		int result = 0;
		String nickname = (String) session.getAttribute("nickname");
		memberModel member = memberService.userNick(nickname);
		
		if(BCrypt.checkpw(passwd, member.getPasswd())) {	// 비번 일치
			memberModel delm = new memberModel();
			
			delm.setNickname(nickname);
			delm.setDelcontent(delcontent);
			memberService.deleteMember(delm);
			
			session.invalidate();
			return "member/delete_finish";
			
		}else {		// 비번 불일치
			
			result = 2;
			model.addAttribute("result", result);
			
			return "member/update_result";
		}
	}
}
