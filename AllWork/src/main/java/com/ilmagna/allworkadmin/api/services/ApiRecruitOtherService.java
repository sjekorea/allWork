package com.ilmagna.allworkadmin.api.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;
import com.ilmagna.allworkadmin.api.daos.ApiRecruitOtherDAO;
import com.ilmagna.allworkadmin.api.domains.ApiRecruitOtherModel;

@Service
public class ApiRecruitOtherService {
		
	@Autowired private ApiRecruitOtherDAO recruitDAO;
	
	
	public List<ApiRecruitOtherModel> getRecruitOtherList(ApiRecruitOtherModel model) throws Exception {
		return recruitDAO.getRecruitOtherList(model);
	}
	
	public ApiRecruitOtherModel getRecruitOther(ApiRecruitOtherModel model) throws Exception {
		//return userDAO.getRecruitOther(model);
		ApiRecruitOtherModel item = new ApiRecruitOtherModel();		
		if((model.getId() != null && model.getId() > 0) || (!ApiCommonUtils.isNullOrEmpty(model.getWantedAuthNo()))) {
			List<ApiRecruitOtherModel> list = recruitDAO.getRecruitOther(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
			}
		}
		return item;
	}

	public int getRecruitOtherTotalCnt(ApiRecruitOtherModel model) throws Exception {
		return recruitDAO.getRecruitOtherTotalCnt(model);
	}

	public Integer getRecruitOtherDuplicatedCount(ApiRecruitOtherModel model) throws Exception {
		return recruitDAO.getRecruitOtherDuplicatedCount(model);
	}

	public Integer findRecruitOther(ApiRecruitOtherModel model) throws Exception {
		return recruitDAO.findRecruitOther(model);
	}

	public void insertRecruitOther(ApiRecruitOtherModel model) throws Exception {
		recruitDAO.insertRecruitOther(model);
	}

	public void updateRecruitOther(ApiRecruitOtherModel model) throws Exception {
		recruitDAO.updateRecruitOther(model);
	}
	
	public void deleteRecruitOther(ApiRecruitOtherModel model) throws Exception {
		recruitDAO.deleteRecruitOther(model);
	}
	
	public void deleteRecruitOtherList(List<ApiRecruitOtherModel> map) throws Exception {
		recruitDAO.deleteRecruitOtherList(map);
	}

	public void insertExcelRecruitOther(List<ApiRecruitOtherModel> map) throws Exception {
		recruitDAO.insertExcelRecruitOther(map);
	}
}
