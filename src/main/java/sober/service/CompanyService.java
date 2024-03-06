package sober.service;

import sober.model.Company;

public interface CompanyService {
	Company select();
	
	int update(Company company);
	
}
