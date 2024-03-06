package sober.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import sober.dao.foodDao;
import sober.model.AlarmDTO;
import sober.model.foodBoardModel;
import sober.model.foodLikeModel;
import sober.model.memberModel;

@Service
public class foodService {
	@Autowired
	private foodDao foodDao;

	// 작성 내용 입력
	public int foodInsert(foodBoardModel food) throws Exception{
		return foodDao.foodInsert(food);
	}

	// 검색
	public int getTotal(foodBoardModel food) {
		return foodDao.getTotal(food);
	}

	// 목록 데이터
	public List<foodBoardModel> foodlist(foodBoardModel food) {
		return foodDao.foodlist(food);
	}

	
	public foodBoardModel select(int f_num) {
		return foodDao.select(f_num);
	}
	
	// 조회수 증가
	public void readUp(int f_num) {
		foodDao.readUp(f_num);
	}

	// 프로필 사진 불러오기
	public String getMemberProfile(String attribute) {
		return foodDao.getMemberProfile(attribute);
	}

	// 작성자
	public foodBoardModel user(int f_num) {
		return foodDao.user(f_num);
	}

	// 게시글 수정
	public void foodUpdate(foodBoardModel food) {
		foodDao.foodUpdate(food);
	}
	
	// 게시글 삭제
	public void foodDelete(int f_num) {
		foodDao.foodDelete(f_num);
	}

	// 좋아요 체크 여부 확인
	public int heart_check(foodLikeModel heart) {
		return foodDao.heart_check(heart);
	}
	
	public foodBoardModel saveHeart(foodLikeModel heart) {
		foodBoardModel food = new foodBoardModel();
		food.setF_num(heart.getF_num());
		food.setNickname(heart.getNickname());
		
		// r_num 게시물에 해당하는 like_count를 +1 update
		foodDao.heart_up(food);
		
		// 전달 받은 값 heart 테이블에 insert
		int result = foodDao.heart_save(food);
		
		if(result == 1) {	// heart 테이블에 새로운 좋아요 추가 되면
			// 갱신된 좋아요 수 가져옴
			food = foodDao.heart_count(food);
		}
		
		return food;
	}

	public foodBoardModel removeHeart(foodLikeModel heart) {
		foodBoardModel food = new foodBoardModel();
		food.setF_num(heart.getF_num());
		food.setNickname(heart.getNickname());
		
		// r_num 게시물에 해당하는 like_count를 -1 update
		foodDao.heart_down(food);
		
		// heart 테이블에서 delete
		int result = foodDao.heart_remove(food);
		
		if(result == 1) {	// heart 테이블에 새로운 좋아요 추가 되면
			// 갱신된 좋아요 수 가져옴
			food = foodDao.heart_count(food);
		}

		
		return food;
	}

	public List<foodLikeModel> heart_sel(foodLikeModel heart) {
		return foodDao.heart_sel(heart);
	}

	public void heart_alarm(AlarmDTO alarm) {
		foodDao.heart_alarm(alarm);
	}

	public void heart_alarm_del(AlarmDTO alarm) {
		foodDao.heart_alarm_del(alarm);
	}

	public int foodInsert_new(foodBoardModel food) {
		return foodDao.foodinsert_new(food);
	}


}
