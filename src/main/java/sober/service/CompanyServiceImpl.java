package sober.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sober.dao.CompanyDAO;
import sober.model.Company;

@Service
public class CompanyServiceImpl implements CompanyService{
	@Autowired
	private CompanyDAO dao;
	@Override
	public Company select() {
		// TODO Auto-generated method stub
		return dao.select();
	}

	@Override
	public int update(Company company) {
		// TODO Auto-generated method stub
		return dao.update(company);
	}
	
}
