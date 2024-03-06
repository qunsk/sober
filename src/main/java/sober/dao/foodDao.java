package sober.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import sober.model.AlarmDTO;
import sober.model.foodBoardModel;
import sober.model.foodLikeModel;
import sober.model.memberModel;

@Mapper
public interface foodDao {

	// 작성 내용 입력
	int foodInsert(foodBoardModel food);

	// 검색 처리
	int getTotal(foodBoardModel food);

	// 목록 데이터
	List<foodBoardModel> foodlist(foodBoardModel food);

	// 상세정보
	foodBoardModel select(int f_num);
		
	// 조회수 증가
	void readUp(int f_num);

	// 프로필 사진 불러오기
	String getMemberProfile(String attribute);

	// 작성자
	foodBoardModel user(int f_num);

	// 게시글 수정
	void foodUpdate(foodBoardModel food);
	
	// 게시글 삭제
	void foodDelete(int f_num);

	// 좋아요 체크 여부 확인
	int heart_check(foodLikeModel heart);
	
	List<foodLikeModel> heart_sel(foodLikeModel heart);
	
	foodBoardModel saveHeart(foodLikeModel heart);
	foodBoardModel removeHeart(foodLikeModel heart);
	
	void heart_up(foodBoardModel food);
	int heart_save(foodBoardModel food);
	foodBoardModel heart_count(foodBoardModel food);
	void heart_down(foodBoardModel food);
	int heart_remove(foodBoardModel food);

	// 검색
	List<foodBoardModel> foodSearch(foodBoardModel food);

	// 좋아요 알림
	void heart_alarm(AlarmDTO alarm);
	void heart_alarm_del(AlarmDTO alarm);

	int foodinsert_new(foodBoardModel food);


}
