package com.ilmagna.allworkadmin.api.daos;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ilmagna.allworkadmin.api.domains.ApiRecruitItemModel;
import com.ilmagna.allworkadmin.api.domains.ApiRecruitItemModel;

import allwork.common.dao.AbstractDAO;


@Repository("apiRecruitItemDAO")
public class ApiRecruitItemDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<ApiRecruitItemModel> getRecruitItemList(ApiRecruitItemModel model) throws Exception {
		return (List<ApiRecruitItemModel>) selectList("com.ilmagna.allworkadmin.api.daos.ApiRecruitItemDAO.getRecruitItemList", model);
	}

	@SuppressWarnings("unchecked")
	public ApiRecruitItemModel getRecruitItem(ApiRecruitItemModel model) throws Exception {
		//return (ApiRecruitItemModel) selectOne("com.ilmagna.allworkadmin.api.daos.ApiRecruitItemDAO.getCategory", model);

		List<ApiRecruitItemModel> list = (List<ApiRecruitItemModel>) selectList("com.ilmagna.allworkadmin.api.daos.ApiRecruitItemDAO.getRecruitItem", model);
		if (list == null || list.size() < 1) return new ApiRecruitItemModel();
		
		return list.get(0);
	}
	
	public Integer getRecruitItemTotalCnt(ApiRecruitItemModel model) throws Exception {
		return selectCnt("com.ilmagna.allworkadmin.api.daos.ApiRecruitItemDAO.getRecruitItemTotalCnt", model);
	}

	/*
	List<ApiRecruitItemModel> getRecruitItemList(ApiRecruitItemModel model) throws Exception;

	List<ApiRecruitItemModel> getRecruitItem(ApiRecruitItemModel model) throws Exception;
	
	Integer getRecruitItemTotalCnt(ApiRecruitItemModel model) throws Exception;

	Integer getRecruitItemDuplicatedCount(ApiRecruitItemModel model) throws Exception;

	Integer findRecruitItem(ApiRecruitItemModel model) throws Exception;

	void insertRecruitItem(ApiRecruitItemModel model) throws Exception;

	void updateRecruitItem(ApiRecruitItemModel model) throws Exception;
	
	void deleteRecruitItem(ApiRecruitItemModel model) throws Exception;

	void deleteRecruitItemList(List<ApiRecruitItemModel> map) throws Exception;

	void insertExcelRecruitItem(List<ApiRecruitItemModel> map) throws Exception;

	List<ApiRecruitItemModel> getRecruitItemCodeList(ApiRecruitItemModel model) throws Exception;
	*/
}
