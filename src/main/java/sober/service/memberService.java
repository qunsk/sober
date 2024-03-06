package sober.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.ognl.MemberAccess;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import sober.dao.memberDao;
import sober.model.memberModel;

@Service
public class memberService {

	@Value("${phone_key_1}")
	private String phonekey1;

	@Value("${phone_key_2}")
	private String phonekey2;
	
	@Value("${myphone}")
	private String myphone; 

	@Autowired
	private memberDao memberDao;

	// id 중복검사
	public int idCheck(String id) throws Exception {
		int result = 0;
		memberModel member = memberDao.idCheck(id);
		if (member != null)
			result = 1; // 중복 ID
		return result;
	}

	// 닉네임 중복검사
	public int nickCheck(String nickname) throws Exception {
		int result = 0;
		memberModel member = memberDao.nickCheck(nickname);
		if (member != null)
			result = 1;

		return result;
	}
	
	// 휴대폰 중복검사
//	public int phoneCheck(String phone) throws Exception{
//		int result = 0;
//		result = memberDao.phoneCheck(phone);
//		return result;
//	}

	// 휴대폰 본인인증
	public void phoneNumber(String phone, int randomNum) {
		String api_key = phonekey1;
		String api_secret = phonekey2;
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phone); // 수신전화번호
		params.put("from", myphone); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		params.put("type", "SMS");
		params.put("text", "[sober] 인증번호는" + "[" + randomNum + "]" + "입니다."); // 문자 내용 입력
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}

	// 지역
	public Map<String, String[]> getSubRegion() throws Exception {
		return null;
	}

	// 회원가입 저장
	public int insertMember(memberModel member) throws Exception {
		return memberDao.insertMember(member);
	}

	// 로그인 인증
	public memberModel userCheck(String id) throws Exception {
		return memberDao.userCheck(id);
	}

	// ID 찾기
	public List findId(memberModel member) {
		return memberDao.findId(member);
	}

	// 비번 찾기
	public memberModel findPasswd(String id) {
		return memberDao.findPasswd(id);
	}

	// 비번 찾기_새로운 비번 설정
	public int newPwd(memberModel member) {
		return memberDao.newPwd(member);
	}

	// 닉네임 메소드
	public memberModel userNick(String nickname) {
		return memberDao.userNick(nickname);
	}

	// 회원수정
	public void updateMember(memberModel member) {
		memberDao.updateMember(member);
	}

	// 비번 변경
	public int updatePw(memberModel member) {
		return memberDao.updatePw(member);
	}

	// 회원탈퇴
	public void deleteMember(memberModel member) {
		memberDao.deleteMember(member);
	}

	// 회원가입 프로필
	public int insertProfile(memberModel member) {
		return memberDao.insertProfile(member);
	}


}
