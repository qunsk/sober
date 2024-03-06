package sober.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import sober.model.memberModel;

@Mapper
public interface memberDao {

	// 아이디 중복체크
	memberModel idCheck(String id);

	// 닉네임 중복체크
	memberModel nickCheck(String nickname);
	
	// 휴대폰 중복체크
//	int phoneCheck(String phone);

	// 회원가입 저장
	int insertMember(memberModel member);

	// 로그인 인증
	memberModel userCheck(String id);

	// id 찾기
	List findId(memberModel member);

	// 비밀번호 찾기
	memberModel findPasswd(String id);

	// 비번 찾기_새로운 비번 설정
	int newPwd(memberModel member);

	// 닉네임 메소드
	memberModel userNick(String nickname);

	// 회원수정
	void updateMember(memberModel member);

	// 비번변경
	int updatePw(memberModel member);

	// 회원탈퇴
	void deleteMember(memberModel member);

	// 회원가입 프로필
	int insertProfile(memberModel member);

}
