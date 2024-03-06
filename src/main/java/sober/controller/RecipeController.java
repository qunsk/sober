package sober.controller;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import sober.service.PagingPgm;
import sober.service.RecipeReplyService;
import sober.service.RecipeService;
import sober.model.AlarmDTO;
import sober.model.Category;
import sober.model.Heart;
import sober.model.Material;
import sober.model.Recipe;
import sober.model.RecipeReply;

@Controller
public class RecipeController {

	@Autowired
	RecipeService rs;

	@Autowired
	RecipeReplyService rrs;

	/* 레시피 작성 폼으로 이동 */
	@RequestMapping("recipeForm")
	public String recipehome(Category category, Model model, HttpSession session) {

		String user = (String) session.getAttribute("nickname");
		if (user == null) {
			user = "";
		}

		List<Category> ctg = rs.ctg(category);

		ObjectMapper objectMapper = new ObjectMapper();
		String jsonList = null;
		try {
			jsonList = objectMapper.writeValueAsString(ctg);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		model.addAttribute("ctgJSON", jsonList);
		model.addAttribute("ctg", ctg);

		return "recipe/recipeForm";
	}

	/* 레시피 작성 submit 클릭 */
	@PostMapping("recipeWrite")
	public String recipeWrite(@RequestParam("img_url1") MultipartFile mf, Recipe recipe, Material material,
			Category category,

			// 재료
			@RequestParam("sel_title") String[] titles, @RequestParam("product") String[] product,
			@RequestParam("abv") String[] abv, @RequestParam("volume") String[] volume,

			@RequestParam List<String> flavor, HttpServletRequest request, HttpSession session, Model model)
			throws Exception {


		// 닉네임
		String user = (String) session.getAttribute("nickname");

		// recipe 테이블 nickname 설정
		recipe.setNickname(user);

		// 첨부파일 처리
		String filename = mf.getOriginalFilename();
		
		if(filename.equals("") || filename == null) {
			// recipe 테이블 img_url 설정
			recipe.setImg_url("cockimg.png");
		}else {
			
			int size = (int) mf.getSize();
			
			String path = session.getServletContext().getRealPath("/resources/upload/recipe/"); 
			
			File temp = new File(path);
			if(!temp.exists()) {
				temp.mkdirs();
			}
			
			String newfilename = "";
			String file[] = new String[2];
			
			if (size > 0) {
				// 파일 중복문제 해결
				String extension = filename.substring(filename.lastIndexOf("."), filename.length());
				
				UUID uuid = UUID.randomUUID();
				
				newfilename = uuid.toString() + extension;
				
				StringTokenizer st = new StringTokenizer(filename, ".");
				file[0] = st.nextToken(); // 파일명
				file[1] = st.nextToken(); // 확장자
				
				// 첨부파일이 전송된 경우
				mf.transferTo(new File(path + "/" + newfilename));
			} // if문 size end
			
			// recipe 테이블 img_url 설정
			recipe.setImg_url(newfilename);
		}
		

		// recipe 테이블 flavor 파싱용 기호 삽입
		String multiFlavor = "";
		for (String f : flavor) {

			multiFlavor += f + "-";
		}

		// recipe 테이블 flavor 설정
		recipe.setFlavor(multiFlavor);

		// db에 recipe 테이블 insert
		rs.insertRecipe(recipe);

		// 재료 설정
		for (int i = 0; i < product.length; i++) {
			/* 재료의 카테고리를 숫자로 변환 */
			
			material.setR_num(recipe.getR_num());
			material.setRc_num(Integer.parseInt(titles[i]));
			material.setProduct(product[i]);
			material.setAbv(Integer.parseInt(abv[i]));
			material.setVolume(Integer.parseInt(volume[i]));

			// material dto에 삽입
			rs.insertMaterial(material);
		}

		return "redirect:recipeView?r_num=" + recipe.getR_num();
	}

	/* 수정 페이지 */
	@RequestMapping("recipeEdit")
	public String recipeEdit(int r_num, Model model, Recipe recipe, Material material, Category category,
			HttpSession session) {

		List<Category> ctg = rs.ctg(category);

		ObjectMapper objectMapper = new ObjectMapper();
		String jsonList = null;
		try {
			jsonList = objectMapper.writeValueAsString(ctg);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		
		String oldImgURL = rs.foundImgURL(r_num);
		
		model.addAttribute("ctgJSON", jsonList);
		model.addAttribute("ctg", ctg);

		recipe = rs.select(r_num);
		String rflavor = recipe.getFlavor();
		List<Material> mlistMain = rs.mlistMain(material);
		List<Material> mlistSub = rs.mlistSub(material);
		
	
		model.addAttribute("oldImgURL", oldImgURL);
		model.addAttribute("r_num", r_num);
		model.addAttribute("recipe", recipe);
		model.addAttribute("mlistMain", mlistMain);
		model.addAttribute("mlistSub", mlistSub);
		model.addAttribute("rflavor", rflavor);

		return "recipe/recipeEdit";
	}

	@PostMapping("recipeUpdate")
	public String recipeEdit(int r_num, @RequestParam("img_url1") MultipartFile mf, Recipe recipe, Material material,
			Category category,

			// 재료
			@RequestParam("sel_title") String[] titles, @RequestParam("product") String[] product,
			@RequestParam("abv") String[] abv, @RequestParam("volume") String[] volume, Integer[] old_main_rm_num,
			Integer[] old_sub_rm_num, String[] new_sel_title, String[] new_product, String[] new_abv,
			String[] new_volume,
			
			String basicImg,
			
			@RequestParam List<String> flavor, HttpServletRequest request, HttpSession session, Model model)
			throws Exception {

		// 닉네임
		String user = (String) session.getAttribute("nickname");

		// 닉네임 설정
		recipe.setNickname(user);

		// 수정 폼에서 기존 재료를 삭제했을 때********************************START
		Material temp = new Material();
		temp.setR_num(r_num);
		List<Material> mlistMain = rs.mlistMain(temp);
		List<Material> mlistSub = rs.mlistSub(temp);
		
		int index = 0;
		
		for (int i = 0; i < mlistMain.size(); i++) {
			boolean delete = true;
			for (int j : old_main_rm_num) {
				if (mlistMain.get(i).getRm_num() == j) {
					Material updateMeterial = new Material();
					// UPDATE table이름 SET product=#{product},,, WHERE rn_num = #{rm_num}
					updateMeterial.setRm_num(j);
					updateMeterial.setRc_num(Integer.parseInt(titles[index]));
					updateMeterial.setProduct(product[index]);
					updateMeterial.setAbv(Integer.parseInt(abv[index]));
					updateMeterial.setVolume(Integer.parseInt(volume[index]));
					rs.updateMaterial(updateMeterial);
					index++;
					delete = false;
					break;
				}
			}
			if (delete) {
				rs.deleteMaterial(mlistMain.get(i).getRm_num());

			}
		}
		
		for (int i = 0; i < mlistSub.size(); i++) {
			boolean delete = true;
			for (int j : old_sub_rm_num) {
				if (mlistSub.get(i).getRm_num() == j) {
					Material updateMeterial = new Material();
					// UPDATE table이름 SET product=#{product},,, WHERE rn_num = #{rm_num}
					updateMeterial.setRm_num(j);
					updateMeterial.setRc_num(Integer.parseInt(titles[index]));
					updateMeterial.setProduct(product[index]);
					updateMeterial.setAbv(Integer.parseInt(abv[index]));
					updateMeterial.setVolume(Integer.parseInt(volume[index]));
					rs.updateMaterial(updateMeterial);
					index++;
					delete = false;
					break;
				}
			}
			if (delete) {
				rs.deleteMaterial(mlistSub.get(i).getRm_num());

			}
		}
		// 수정 폼에서 기존 재료를 삭제했을 때********************************END

		// 수정 폼에서 재료 추가했을 때************************START

		// 재료 설정
		if(new_product != null) {
			for (int i = 0; i < new_product.length; i++) {
				/* 재료의 카테고리를 숫자로 변환 */
	
				material.setR_num(r_num);
				material.setRc_num(Integer.parseInt(new_sel_title[i]));
				material.setProduct(new_product[i]);
				material.setAbv(Integer.parseInt(new_abv[i]));
				material.setVolume(Integer.parseInt(new_volume[i]));
	
				// material dto에 삽입
				rs.insertMaterial(material);
			}
		}
		// 수정 폼에서 재료 추가했을 때************************END

		// 수정 폼에서 재료 업데이트 할 때 **********************START

		// 첨부파일 처리
			String filename = mf.getOriginalFilename();
			// 이미지가 새로 업로드 된 경우 비교
			String old_imgUrl = rs.foundImgURL(r_num);
			if(filename.equals("") || filename == null ) { 						// 새로 업로드한 이미지가 없으면
				if(basicImg != null && !basicImg.equals("")) {
					recipe.setImg_url("cockimg.png");
				}else{
					recipe.setImg_url(old_imgUrl);
				}
			}else {															// 새로 업로드한 이미지가 있으면
				int size = (int) mf.getSize();
	
			String path = session.getServletContext().getRealPath("/resources/upload/recipe/"); 
			
			String newfilename = "";
			String file[] = new String[2];
	
			if (size > 0) {
				// 파일 중복문제 해결
				String extension = filename.substring(filename.lastIndexOf("."), filename.length());
	
				UUID uuid = UUID.randomUUID();
	
				newfilename = uuid.toString() + extension;
	
				StringTokenizer st = new StringTokenizer(filename, ".");
				file[0] = st.nextToken(); // 파일명
				file[1] = st.nextToken(); // 확장자
	
				// 첨부파일이 전송된 경우
				mf.transferTo(new File(path + "/" + newfilename));
			} // if문 size end
			
			if (!newfilename.equals(old_imgUrl)) {
				
				// recipe테이블 url이름 설정
				recipe.setImg_url(newfilename);
				if(!old_imgUrl.equals("cockimg.png")) {
					File old_imgFile = new File(path + "/" + old_imgUrl);
					old_imgFile.delete();
				}
				
			} /*
				 * else { recipe.setImg_url(old_imgUrl); }
				 */
		}

		// recipe테이블에 체크박스 설정
		String multiFlavor = "";
		for (String f : flavor) {

			multiFlavor += f + "-";
		}
		recipe.setFlavor(multiFlavor);

		// db에 레시피 삽입
		recipe.setR_num(r_num);
		rs.updateRecipe(recipe);

		return "redirect:recipeView?r_num=" + r_num;
	}

	/* 게시글 삭제 */
	@RequestMapping("recipeDelete")
	public String recipedelete(int r_num, HttpSession session, Model model) throws Exception {
		
		Recipe recipe = rs.select(r_num);

		String path = session.getServletContext().getRealPath("/resources/upload/recipe/"); 
		String dbImg = recipe.getImg_url();

		if (!dbImg.equals("cockimg.png")) {
			File file = new File(path + "/" + dbImg);
			file.delete();
		}

		rs.deleteRecipe(r_num);

		return "redirect: recipeList";
	}

	/* 목록 페이지 */
	@RequestMapping("recipeList") // 전체 목록, 검색 목록
	public String list(String pageNum, Recipe recipe, Category category, Heart heart, HttpSession session,
			Model model) {

		String user = (String) session.getAttribute("nickname");
		if (user == null) {
			user = "";
		}

		// 페이징 처리
		final int rowPerPage = 9;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);

		int total = rs.getTotal(recipe);

		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;

		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);

		recipe.setStartRow(startRow);
		recipe.setEndRow(endRow);

		// 리스트 출력용
		List<Recipe> list = rs.list(recipe);
		List<Category> ctg = rs.ctg(category);

		// 재료 해쉬태그 출력용
		List<Recipe> hash = rs.hash(recipe);

		// 좋아요 체크 여부
		heart.setNickname(user);
		List<Heart> heart_sel = rs.heart_sel(heart);

		/*
		 * // 작성자 프로필 사진 처리 String profile = rs.getMemberProfile();
		 * model.addAttribute("writeProfile", profile);
		 */
		
		model.addAttribute("heart_sel", heart_sel);
		model.addAttribute("hash", hash);
		model.addAttribute("ctg", ctg);
		model.addAttribute("list", list);
		model.addAttribute("pp", pp);

		// 검색 값
		model.addAttribute("search_m", recipe.getSearch_m());
		model.addAttribute("search_f", recipe.getSearch_f());
		model.addAttribute("search_abv", recipe.getSearch_abv());
		model.addAttribute("keyword", recipe.getKeyword());

		return "recipe/recipeList";
	}

	/* 상세 페이지 */
	@RequestMapping("recipeView")
	public String recipeView(int r_num, String pageNum, Material material, RecipeReply reply, Heart heart,
			String search_m, String search_f, String search_abv, String keyword, HttpSession session, Model model) {

		Recipe recipe = rs.select(r_num); // 상세정보 구하기

		String user = (String) session.getAttribute("nickname");
		if (user == null) {
			user = "";
		}
		
		// 작성자가 아닌 경우 조회수 증가
		if (!(user.equals(recipe.getNickname()))) {
			rs.readUp(recipe.getR_num()); // 조회수 증가
		}

		// Recipe + Material 리스트 뽑기
		List<Material> mclist = rs.mclist(material);

		// 좋아요 체크 여부 확인
		heart.setNickname(user);
		int heartcheck = rs.heart_check(heart);

		// 도수 계산
		double abv_result = (Double) rs.abv_result(material);

		// 맛 split
		String[] rflavor = recipe.getFlavor().split("-");

		// 댓글 수
		int recount = rrs.replyTotal(r_num);
		
		// 작성자 프로필 사진 처리
		String profile = rs.getMemberProfile(recipe.getNickname());
		model.addAttribute("writeProfile", profile);

		model.addAttribute("rflavor", rflavor);
		model.addAttribute("recount", recount);
		model.addAttribute("heartcheck", heartcheck);
		model.addAttribute("mclist", mclist);
		model.addAttribute("abv_result", abv_result);
		model.addAttribute("recipe", recipe);
		model.addAttribute("r_num", r_num);
		model.addAttribute("pageNum", pageNum);

		if (keyword != "") {
			model.addAttribute("keyword", keyword);
		}
		if (search_m != "") {
			model.addAttribute("search_m", search_m);
		}
		if (search_f != "") {
			model.addAttribute("search_f", search_f);
		}
		if (search_abv != "") {
			model.addAttribute("search_abv", search_abv);
		}

		return "recipe/recipeView";
	}

	/* 빈 하트 클릭시 - 하트 저장 */
	@RequestMapping("saveHeart")
	@ResponseBody
	public String save_heart(int r_num, AlarmDTO alarm, HttpSession session) {

		String user = (String) session.getAttribute("nickname");
		if (user == null) {
			user = "";
		}
		
		Heart heart = new Heart();

		// 게시물 번호 저장
		heart.setR_num(r_num);

		// 좋아요 누른 사람의 nickname 저장
		heart.setNickname(user);

		// 좋아요 눌린 게시물 & 누른 사람
		alarm.setBoard_pk(r_num);
		alarm.setSender_nickname(user);

		// +1된 좋아요 수 담아오기 위한 객체 생성
		Recipe recipe = rs.saveHeart(heart);
		// 좋아요 알림 insert
		if(!user.equals(alarm.getReceiver_nickname())) {
			rs.heart_alarm(alarm);
		}
		// 총 좋아요 수
		String likecount = String.valueOf(recipe.getLike_count());

		return likecount;
	}

	/* 꽉찬 하트 클릭시 - 하트 해제 */
	@RequestMapping("removeHeart")
	@ResponseBody
	public String remove_heart(int r_num, AlarmDTO alarm, HttpSession session) {

		String user = (String) session.getAttribute("nickname");
		if (user == null) {
			user = "";
		}

		Heart heart = new Heart();

		// 게시물 번호 저장
		heart.setR_num(r_num);

		// 좋아요 누른 사람의 nickname 저장
		heart.setNickname(user);

		// 좋아요 눌린 게시물 & 누른 사람
		alarm.setBoard_pk(r_num);
		alarm.setSender_nickname(user);

		// -1된 좋아요 수 담아오기 위한 객체 생성
		Recipe recipe = rs.removeHeart(heart);
		// 좋아요 알림 delete
		rs.heart_alarm_del(alarm);
		// 총 좋아요 수
		String likecount = String.valueOf(recipe.getLike_count());

		return likecount;
	}

}
