package sober.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import sober.model.Company;
import sober.service.CompanyService;

@Controller
public class CompanyController {
	@Autowired
	private CompanyService service;
	
	@RequestMapping("companyinfo")
	public String companyinfo(Model model) {
		Company company = service.select();
		model.addAttribute("company", company);
		return "/master/companyupdate";
	}
	
	@RequestMapping("companyupdate")
	public String companyupdate(Company company) {
		service.update(company);
		return "/master/companyupdate_check";
	}

}
