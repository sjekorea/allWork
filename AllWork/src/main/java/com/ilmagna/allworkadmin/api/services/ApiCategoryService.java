package com.ilmagna.allworkadmin.api.services;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.api.daos.ApiCategoryDAO;
import com.ilmagna.allworkadmin.api.domains.ApiCategoryModel;


@Service("apiCategoryService")
public class ApiCategoryService {

	//@Autowired private ApiCategoryDAO apiCategoryDAO;
	@Resource(name="apiCategoryDAO")
	private ApiCategoryDAO apiCategoryDAO;


	public ApiCategoryModel getCategory(ApiCategoryModel model) throws Exception {
		try {
			return apiCategoryDAO.getCategory(model);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return new ApiCategoryModel();
	}

	/*
	public List<ApiCategoryModel> getCategoryList(ApiCategoryModel model) throws Exception {
		return apiCategoryDAO.getCategoryList(model);
	}
	
	public ApiCategoryModel getCategory(ApiCategoryModel model) throws Exception {
		//return apiCategoryDAO.getCategory(model);
		ApiCategoryModel item = new ApiCategoryModel();		
		if(!ApiCommonUtils.isNullOrEmpty(model.getCode())) {
			List<ApiCategoryModel> list = apiCategoryDAO.getCategory(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
			}
		}
		return item;
	}

	public int getCategoryTotalCnt(ApiCategoryModel model) throws Exception {
		return apiCategoryDAO.getCategoryTotalCnt(model);
	}

	public Integer getCategoryDuplicatedCount(ApiCategoryModel model) throws Exception {
		return apiCategoryDAO.getCategoryDuplicatedCount(model);
	}

	
	public String findCategoryWithCode(ApiCategoryModel model) throws Exception {
		return apiCategoryDAO.findCategoryWithCode(model);
	}

	public String findCategoryWithName(ApiCategoryModel model) throws Exception {
		return apiCategoryDAO.findCategoryWithName(model);
	}

	public List<ApiCategoryModel> getCategoryCodeList(List<ApiCategoryModel> map) throws Exception {
		return apiCategoryDAO.getCategoryCodeList(map);
	}

	public List<String> getCategoryTypeList(ApiCategoryModel model) throws Exception {
		return apiCategoryDAO.getCategoryTypeList(model);
	}
	
	
	public void insertCategory(ApiCategoryModel model) throws Exception {
		apiCategoryDAO.insertCategory(model);
	}
	
	public void updateCategory(ApiCategoryModel model) throws Exception {
		apiCategoryDAO.updateCategory(model);
	}
	
	public void deleteCategory(ApiCategoryModel model) throws Exception {
		apiCategoryDAO.deleteCategory(model);
	}
	
	public void deleteCategoryList(List<ApiCategoryModel> map) throws Exception {
		apiCategoryDAO.deleteCategoryList(map);
	}

	public void insertExcelCategory(List<ApiCategoryModel> map) throws Exception {
		apiCategoryDAO.insertExcelCategory(map);
	}

	
	
	
	
	
	public List<ApiCategoryModel> getArea1stList(ApiCategoryModel model) throws Exception {
		return apiCategoryDAO.getArea1stList(model);
	}
	*/
}
