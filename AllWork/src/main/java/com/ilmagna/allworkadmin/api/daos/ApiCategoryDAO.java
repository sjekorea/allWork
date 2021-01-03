package com.ilmagna.allworkadmin.api.daos;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ilmagna.allworkadmin.api.domains.ApiCategoryModel;

import allwork.common.dao.AbstractDAO;


@Repository("apiCategoryDAO")
public class ApiCategoryDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public ApiCategoryModel getCategory(ApiCategoryModel model) throws Exception {
		//return (ApiCategoryModel) selectOne("com.ilmagna.allworkadmin.api.daos.ApiCategoryDAO.getCategory", model);

		List<ApiCategoryModel> list = (List<ApiCategoryModel>) selectList("com.ilmagna.allworkadmin.api.daos.ApiCategoryDAO.getCategory", model);
		if (list == null || list.size() < 1) return new ApiCategoryModel();
		
		return list.get(0);
	}
	

	/*
	List<ApiCategoryModel> getCategoryList(ApiCategoryModel model) throws Exception;

	List<ApiCategoryModel> getCategory(ApiCategoryModel model) throws Exception;
	
	Integer getCategoryTotalCnt(ApiCategoryModel model) throws Exception;

	Integer getCategoryDuplicatedCount(ApiCategoryModel model) throws Exception;

	
	String findCategoryWithCode(ApiCategoryModel model) throws Exception;

	String findCategoryWithName(ApiCategoryModel model) throws Exception;
	
	List<ApiCategoryModel> getCategoryCodeList(List<ApiCategoryModel> map) throws Exception;

	List<String> getCategoryTypeList(ApiCategoryModel model) throws Exception;

	
	void insertCategory(ApiCategoryModel model) throws Exception;
	
	void updateCategory(ApiCategoryModel model) throws Exception;
	
	void deleteCategory(ApiCategoryModel model) throws Exception;

	void deleteCategoryList(List<ApiCategoryModel> map) throws Exception;

	void insertExcelCategory(List<ApiCategoryModel> map) throws Exception;



	List<ApiCategoryModel> getArea1stList(ApiCategoryModel model) throws Exception;
	*/
}
