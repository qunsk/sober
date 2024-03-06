package sober.dao;

import sober.model.Company;

public interface CompanyDAO {

	Company select();
	
	int update(Company company);
	
}
