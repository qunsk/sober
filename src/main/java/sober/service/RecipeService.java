package sober.service;

import java.util.List;

import sober.model.AlarmDTO;
import sober.model.Category;
import sober.model.Heart;
import sober.model.Material;
import sober.model.Recipe;

public interface RecipeService {

	// 목록 페이지 및 상세 페이지
	List<Recipe> list(Recipe recipe);
	List<Material> mclist(Material material);
	
	int getTotal(Recipe recipe);

	Recipe select(int r_num);

	List<Recipe> hash(Recipe recipe);
	List<Category> ctg(Category category);
	
	void readUp(int r_num);
	
	String getMemberProfile(String attribute);

	double abv_result(Material material);
	
	// 좋아요 관련
	int heart_check(Heart heart);

	Recipe saveHeart(Heart heart);
	Recipe removeHeart(Heart heart);
	
	List<Heart> heart_sel(Heart heart);
	
	void heart_alarm(AlarmDTO alarm);
	void heart_alarm_del(AlarmDTO alarm);
	String boNick(int r_num);
	
	// 짠근쓰
	List<Material> mlistMain(Material material);

	List<Material> mlistSub(Material material);
	
	int getLastMaterialNum();

	List<Category> ctgList(Category category);

	void insertMaterial(Material material);
	
	void insertRecipe(Recipe recipe);
	void updateMaterial(Material updateMeterial);
	void deleteMaterial(int rm_num);
	String foundImgURL(int r_num);
	int deleteRecipe(int r_num);
	void updateRecipe(Recipe recipe);
	
}
