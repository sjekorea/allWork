package com.ilmagna.allworkadmin.api.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.api.daos.ApiRecruitProgressDAO;
import com.ilmagna.allworkadmin.api.domains.ApiRecruitProgressModel;

@Service
public class ApiRecruitProgressService {
		
	@Autowired private ApiRecruitProgressDAO recommendDAO;
	
	
	public List<ApiRecruitProgressModel> getRecruitProgressList(ApiRecruitProgressModel model) throws Exception {
		return recommendDAO.getRecruitProgressList(model);
	}
	
	public ApiRecruitProgressModel getRecruitProgress(ApiRecruitProgressModel model) throws Exception {
		//return userDAO.getRecruitProgress(model);
		ApiRecruitProgressModel item = new ApiRecruitProgressModel();		
		if(model.getId() != null && model.getId() > 0) {
			List<ApiRecruitProgressModel> list = recommendDAO.getRecruitProgress(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
			}
		}
		return item;
	}

	public int getRecruitProgressTotalCnt(ApiRecruitProgressModel model) throws Exception {
		return recommendDAO.getRecruitProgressTotalCnt(model);
	}

	public Integer getRecruitProgressDuplicatedCount(ApiRecruitProgressModel model) throws Exception {
		return recommendDAO.getRecruitProgressDuplicatedCount(model);
	}

	public Integer findRecruitProgress(ApiRecruitProgressModel model) throws Exception {
		return recommendDAO.findRecruitProgress(model);
	}

	public void insertRecruitProgress(ApiRecruitProgressModel model) throws Exception {
		recommendDAO.insertRecruitProgress(model);
	}

	public void updateRecruitProgress(ApiRecruitProgressModel model) throws Exception {
		recommendDAO.updateRecruitProgress(model);
	}
	
	public void deleteRecruitProgress(ApiRecruitProgressModel model) throws Exception {
		recommendDAO.deleteRecruitProgress(model);
	}
	
	public void deleteRecruitProgressList(List<ApiRecruitProgressModel> map) throws Exception {
		recommendDAO.deleteRecruitProgressList(map);
	}

	public void insertExcelRecruitProgress(List<ApiRecruitProgressModel> map) throws Exception {
		recommendDAO.insertExcelRecruitProgress(map);
	}
}
