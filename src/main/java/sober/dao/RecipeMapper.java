package sober.dao;

import java.util.List;

import sober.model.AlarmDTO;
import sober.model.Category;
import sober.model.Heart;
import sober.model.Material;
import sober.model.Recipe;

public interface RecipeMapper {

	List<Recipe> list(Recipe recipe);
	List<Material> mclist(Material material);
	
	int getTotal(Recipe recipe);

	Recipe select(int r_num);

	void readUp(int r_num);
	
	String getMemberProfile(String attribute);
	
	List<Recipe> hash(Recipe recipe);
	List<Category> ctg(Category category);
	
	double abv_result(Material material);
	
	int heart_check(Heart heart);
	
	List<Heart> heart_sel(Heart heart);
	
	Recipe saveHeart(Heart heart);
	Recipe removeHeart(Heart heart);
	
	void heart_up(Recipe recipe);
	int heart_save(Recipe recipe);
	Recipe heart_count(Recipe recipe);
	void heart_down(Recipe recipe);
	int heart_remove(Recipe recipe);
	
	void heart_alarm(AlarmDTO alarm);
	void heart_alarm_del(AlarmDTO alarm);
	String boNick(int r_num);
	
	// 짠근쓰
	// db에 레시피 삽입
	void insertRecipe(Recipe recipe);

	void insertMaterial(Material material);

	int getLastMaterialNum();

	List<Category> ctgList(Category category);

	List<Material> mlistMain(Material material);

	List<Material> mlistSub(Material material);
	
	void updateMaterial(Material updateMeterial);
	void deleteMaterial(int rm_num);
	String foundImgURL(int r_num);
	int deleteRecipe(int r_num);
	void updateRecipe(Recipe recipe);
}
