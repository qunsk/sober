package sober.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sober.dao.RecipeMapper;
import sober.model.AlarmDTO;
import sober.model.Category;
import sober.model.Heart;
import sober.model.Material;
import sober.model.Recipe;

@Service
public class RecipeServiceImpl implements RecipeService {

	@Autowired
	private RecipeMapper rm;
	
	public List<Recipe> list(Recipe recipe) {
		return rm.list(recipe);
	}

	public List<Material> mclist(Material material) {
		return rm.mclist(material);
	}

	public int getTotal(Recipe recipe) {
		return rm.getTotal(recipe);
	}

	public Recipe select(int r_num) {
		return rm.select(r_num);
	}

	public List<Recipe> hash(Recipe recipe) {
		return rm.hash(recipe);
	}

	public List<Category> ctg(Category category) {
		return rm.ctg(category);
	}

	public void readUp(int r_num) {
		rm.readUp(r_num);
	}

	public String getMemberProfile(String attribute) {
		return rm.getMemberProfile(attribute);
	}

	public double abv_result(Material material) {
		return rm.abv_result(material);
	}
	
	public int heart_check(Heart heart) {
		return rm.heart_check(heart);
	}
	
	public Recipe saveHeart(Heart heart) {
		Recipe recipe = new Recipe();
		recipe.setR_num(heart.getR_num());
		recipe.setNickname(heart.getNickname());
		
		// r_num 게시물에 해당하는 like_count를 +1 update
		rm.heart_up(recipe);
		
		// 전달 받은 값 heart 테이블에 insert
		int result = rm.heart_save(recipe);
		
		if(result == 1) {	// heart 테이블에 새로운 좋아요 추가 되면
			// 갱신된 좋아요 수 가져옴
			recipe = rm.heart_count(recipe);
		}
		
		return recipe;
	}

	public Recipe removeHeart(Heart heart) {
		Recipe recipe = new Recipe();
		recipe.setR_num(heart.getR_num());
		recipe.setNickname(heart.getNickname());
		
		// r_num 게시물에 해당하는 like_count를 -1 update
		rm.heart_down(recipe);
		
		// heart 테이블에서 delete
		int result = rm.heart_remove(recipe);
		
		if(result == 1) {	// heart 테이블에 새로운 좋아요 추가 되면
			// 갱신된 좋아요 수 가져옴
			recipe = rm.heart_count(recipe);
		}

		
		return recipe;
	}

	public List<Heart> heart_sel(Heart heart) {
		return rm.heart_sel(heart);
	}

	public void heart_alarm(AlarmDTO alarm) {
		rm.heart_alarm(alarm);
	}

	public void heart_alarm_del(AlarmDTO alarm) {
		rm.heart_alarm_del(alarm);
	}

	public String boNick(int r_num) {
		return rm.boNick(r_num);
	}
	
	
	// 짠근쓰
	public List<Material> mlistMain(Material material) {
		return rm.mlistMain(material);
	}

	public List<Material> mlistSub(Material material) {
		return rm.mlistSub(material);
	}

	public int getLastMaterialNum() {
		return rm.getLastMaterialNum();
	}

	public List<Category> ctgList(Category category) {
		return rm.ctgList(category);
	}

	public void insertMaterial(Material material) {
		rm.insertMaterial(material);
	}

	public void insertRecipe(Recipe recipe) {
		rm.insertRecipe(recipe);
	}

	public void updateMaterial(Material updateMeterial) {
		rm.updateMaterial(updateMeterial);
	}

	public void deleteMaterial(int rm_num) {
		rm.deleteMaterial(rm_num);
	}

	public String foundImgURL(int r_num) {
		return rm.foundImgURL(r_num);
	}

	public int deleteRecipe(int r_num) {
		return rm.deleteRecipe(r_num);
	}

	public void updateRecipe(Recipe recipe) {
		rm.updateRecipe(recipe);
	}

}
