package com.ilmagna.allworkadmin.api.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.api.daos.ApiRecruitCompanyDAO;
import com.ilmagna.allworkadmin.api.domains.ApiRecruitCompanyModel;

@Service
public class ApiRecruitCompanyService {
		
	@Autowired private ApiRecruitCompanyDAO recommendDAO;
	
	
	public List<ApiRecruitCompanyModel> getRecruitCompanyList(ApiRecruitCompanyModel model) throws Exception {
		return recommendDAO.getRecruitCompanyList(model);
	}
	
	public ApiRecruitCompanyModel getRecruitCompany(ApiRecruitCompanyModel model) throws Exception {
		//return userDAO.getRecruitCompany(model);
		ApiRecruitCompanyModel item = new ApiRecruitCompanyModel();		
		if(model.getId() != null && model.getId() > 0) {
			List<ApiRecruitCompanyModel> list = recommendDAO.getRecruitCompany(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
			}
		}
		return item;
	}

	public int getRecruitCompanyTotalCnt(ApiRecruitCompanyModel model) throws Exception {
		return recommendDAO.getRecruitCompanyTotalCnt(model);
	}

	public Integer getRecruitCompanyDuplicatedCount(ApiRecruitCompanyModel model) throws Exception {
		return recommendDAO.getRecruitCompanyDuplicatedCount(model);
	}

	public Integer findRecruitCompany(ApiRecruitCompanyModel model) throws Exception {
		return recommendDAO.findRecruitCompany(model);
	}

	public void insertRecruitCompany(ApiRecruitCompanyModel model) throws Exception {
		recommendDAO.insertRecruitCompany(model);
	}

	public void updateRecruitCompany(ApiRecruitCompanyModel model) throws Exception {
		recommendDAO.updateRecruitCompany(model);
	}
	
	public void deleteRecruitCompany(ApiRecruitCompanyModel model) throws Exception {
		recommendDAO.deleteRecruitCompany(model);
	}
	
	public void deleteRecruitCompanyList(List<ApiRecruitCompanyModel> map) throws Exception {
		recommendDAO.deleteRecruitCompanyList(map);
	}

	public void insertExcelRecruitCompany(List<ApiRecruitCompanyModel> map) throws Exception {
		recommendDAO.insertExcelRecruitCompany(map);
	}
}
