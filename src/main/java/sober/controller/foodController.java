package sober.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import sober.model.AlarmDTO;
import sober.model.foodBoardModel;
import sober.model.foodLikeModel;
import sober.service.foodPaging;
import sober.service.foodReplyService;
import sober.service.foodService;

@Controller
public class foodController {
	@Autowired
	private foodService foodService;
	
	@Autowired
	private foodReplyService frm;

	// 작성폼
	@RequestMapping("foodForm")
	public String foodForm(HttpSession session) {
		String user = (String) session.getAttribute("nickname");

		return "food/foodForm";
	}

	// 작성내용 저장
	@RequestMapping("foodwrite_ok")
	public String foodInsert(@RequestParam("content") String content, @RequestParam("foodImg") MultipartFile mf,
			foodBoardModel food, Model model, HttpSession session) throws Exception {

		String user = (String) session.getAttribute("nickname");

		String filename = mf.getOriginalFilename();
		int size = (int) mf.getSize();

		String path = session.getServletContext().getRealPath("/resources/upload/food/");
//		System.out.println("mf=" + mf);
//		System.out.println("filename=" + filename);
//		System.out.println("size=" + size);
//		System.out.println("path=" + path);
		int result = 0;

		String file[] = new String[2];

		String newfilename = "";

		if (filename != "") {
			String extension = filename.substring(filename.lastIndexOf("."), filename.length());
//			System.out.println("extension:" + extension);

			UUID uuid = UUID.randomUUID();

			newfilename = uuid.toString() + extension;
//			System.out.println("newfilename:" + newfilename);

			StringTokenizer st = new StringTokenizer(filename, ".");
			file[0] = st.nextToken();
			file[1] = st.nextToken();

			if (size > 10000000) {
				result = 1;
				model.addAttribute("result", result);

				return "food/uploadResult";
			} else if (!file[1].equals("jpg") && !file[1].equals("jpeg") && !file[1].equals("gif")
					&& !file[1].equals("png")) {

				result = 2;
				model.addAttribute("result", result);

				return "food/uploadResult";
			}
		}

		if (size > 0) {
			mf.transferTo(new File(path + newfilename));

			food.setImg(newfilename);
		} else {
			String defaultImg = "food.jpg";
			food.setImg(defaultImg);
		}


		//foodService.foodInsert(food);
		foodService.foodInsert_new(food);
//		System.out.println("f_num="+food.getF_num());

		return "redirect: foodView?f_num="+food.getF_num();
	}

	// 목록 + 페이징 + 검색
	@RequestMapping("foodList")
	public String list(String pageNum, foodBoardModel food, foodLikeModel heart, HttpSession session, Model model) {
//		session.setAttribute("nickname", "오구리");
		
		final int rowPage = 9;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);

		int total = foodService.getTotal(food);

		int startRow = (currentPage - 1) * rowPage + 1;
		int endRow = startRow + rowPage - 1;

		foodPaging fp = new foodPaging(total, rowPage, currentPage);

		food.setStartRow(startRow);
		food.setEndRow(endRow);
		
		List<foodBoardModel> foodlist = foodService.foodlist(food);

		String user = (String)session.getAttribute("nickname");
		
		if(user == null) {
			user="";
		}
		
//		System.out.println("누가 접속했나요?"+user);
		
		// 좋아요 체크 여부
		heart.setNickname(user);
		List<foodLikeModel> heart_sel = foodService.heart_sel(heart);
		
//		System.out.println("foodList: " + heart_sel);
		
		model.addAttribute("heart_sel", heart_sel);
		model.addAttribute("foodlist", foodlist);
		model.addAttribute("fp", fp);
		model.addAttribute("search", food.getSearch());
		model.addAttribute("keyword", food.getKeyword());

		return "food/foodList";
	}

	// 상세페이지
	@RequestMapping("foodView")
	public String foodView(@RequestParam("f_num") int f_num, String pageNum, foodLikeModel heart, HttpSession session, Model model) {

		foodBoardModel food = foodService.select(f_num);

//		session.setAttribute("nickname", "오구리");
		String user = (String) session.getAttribute("nickname");

		if (user == null) {
			user = "";
		}

		// 조회수 증가
		if (!(user.equals(food.getNickname()))) {

			foodService.readUp(food.getF_num());
		}

		// 프로필 사진
		String profile = foodService.getMemberProfile(food.getNickname());
		model.addAttribute("userProfile", profile);
		
		// 총 댓글수
		int recount = frm.replyTotal(f_num);
		
		// 좋아요 체크 여부 확인
		heart.setNickname(user);
		int heartcheck = foodService.heart_check(heart);

		model.addAttribute("food", food);
		model.addAttribute("f_num", f_num);
		model.addAttribute("recount", recount);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("heartcheck", heartcheck);

		return "food/foodView";
	}

	// 수정폼
	@RequestMapping("foodUpdate")
	public String foodUpdate(@RequestParam("f_num") int f_num, @RequestParam("pageNum") String pageNum, HttpSession session, Model model) {
		String user = (String) session.getAttribute("nickname");

		foodBoardModel food = foodService.select(f_num);
//		foodBoardModel dbFood = foodService.user(user);

		model.addAttribute("food", food);
		model.addAttribute("f_num", f_num);
		model.addAttribute("pageNum", pageNum);
//		model.addAttribute("dbFood", dbFood);

		return "food/foodUpdate";
	}

	// 수정페이지
	@RequestMapping("foodUpdate_ok")
	public String foodUpdate_ok(@RequestParam("pageNum") String pageNum, @RequestParam("foodImg") MultipartFile mf, foodBoardModel food, HttpSession session,
			Model model) throws Exception {
		String filename = mf.getOriginalFilename();
		int size = (int) mf.getSize();

		String path = session.getServletContext().getRealPath("/resources/upload/food/");
//		System.out.println("path=" + path);
		int result = 0;

		String file[] = new String[2];

		String newfilename = "";

		if (size > 0) {

			String extension = filename.substring(filename.lastIndexOf("."), filename.length());
//			System.out.println("extension:" + extension);

			UUID uuid = UUID.randomUUID();

			newfilename = uuid.toString() + extension;
//			System.out.println("newfilename:" + newfilename);

			StringTokenizer st = new StringTokenizer(filename, ".");
			file[0] = st.nextToken();
			file[1] = st.nextToken();

			if (size > 100000) {
				result = 1;
				model.addAttribute("result", result);

				return "food/uploadResult";
			} else if (!file[1].equals("jpg") && !file[1].equals("jpeg") && !file[1].equals("gif")
					&& !file[1].equals("png")) {

				result = 2;
				model.addAttribute("result", result);

				return "food/uploadResult";
			}
		}

		if (size > 0) {
			mf.transferTo(new File(path + newfilename));
		}

//		String user = (String) session.getAttribute("nickname");

		foodBoardModel dbFood = foodService.user(food.getF_num());

		String dbImg = food.getImg();

		if (size > 0) {
			if(dbImg != null && !dbImg.isEmpty()) {
				String oldFilePath = path + dbImg;
				File oldFile = new File(oldFilePath);
				if(oldFile.exists()) {
					oldFile.delete();
					}
				}
				food.setImg(newfilename);
					
			} else {
				food.setImg(dbFood.getImg());
			}

//		food.setNickname(user);

		foodService.foodUpdate(food);
	
		model.addAttribute("pageNum", pageNum);

		return "redirect:foodView?f_num="+food.getF_num();
	}
	
	// 게시글 삭제
	@RequestMapping("foodDelete")
	public String foodDelete(@RequestParam("f_num") int f_num, HttpSession session, Model model) throws Exception{
		String user = (String) session.getAttribute("nickname");
		
		foodBoardModel food = foodService.select(f_num);
		
		String path = session.getServletContext().getRealPath("/resources/upload/food/");
		String dbImg = food.getImg();
		
		if(dbImg != null) {
			File file = new File(path + dbImg);
			file.delete();
		}
		
//		foodBoardModel delfood = new foodBoardModel();
//		delfood.setF_num(f_num);

		foodService.foodDelete(f_num);
		
		return "redirect: foodList";
	}
	

	/* 빈 하트 클릭시 - 하트 저장 */
	@RequestMapping("save_Heart")
	@ResponseBody
	public String saveheart(int f_num, AlarmDTO alarm, HttpSession session) {

		String user = (String)session.getAttribute("nickname");
		if(user == null) {
			user="";
		}
		
		foodLikeModel heart = new foodLikeModel();

		// 게시물 번호 저장
		heart.setF_num(f_num);

		// 좋아요 누른 사람의 nickname 저장
		heart.setNickname(user);

		// 좋아요 눌린 게시물 & 누른 사람
		alarm.setBoard_pk(f_num);
		alarm.setSender_nickname(user);
		
		// +1된 좋아요 수 담아오기 위한 객체 생성
		foodBoardModel food = foodService.saveHeart(heart);
		// 좋아요 알림 insert
		if(!user.equals(alarm.getReceiver_nickname()) ) {
			foodService.heart_alarm(alarm);
		}
		String likecount = String.valueOf(food.getLike_count());

//		System.out.println("f_num"+alarm.getBoard_pk());
//		System.out.println("좋아요 누른 사람"+alarm.getSender_nickname());
		
		return likecount;
	}

	/* 꽉찬 하트 클릭시 - 하트 해제 */
	@RequestMapping("remove_Heart")
	@ResponseBody
	public String removeheart(int f_num, AlarmDTO alarm, HttpSession session) {
		
		String user = (String)session.getAttribute("nickname");
		if(user == null) {
			user="";
		}
		
		foodLikeModel heart = new foodLikeModel();

		// 게시물 번호 저장
		heart.setF_num(f_num);

		// 좋아요 누른 사람의 nickname 저장
		heart.setNickname(user);

		// 좋아요 눌린 게시물 & 누른 사람
		alarm.setBoard_pk(f_num);
		alarm.setSender_nickname(user);
		
		// -1된 좋아요 수 담아오기 위한 객체 생성
		foodBoardModel food = foodService.removeHeart(heart);
		// 좋아요 알림 insert
		foodService.heart_alarm_del(alarm);
		String likecount = String.valueOf(food.getLike_count());
		
		return likecount;
	}

}
