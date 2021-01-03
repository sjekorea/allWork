package com.ilmagna.allworkadmin.api.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;
import com.ilmagna.allworkadmin.api.daos.ApiCompanyDAO;
import com.ilmagna.allworkadmin.api.domains.ApiCategoryModel;
import com.ilmagna.allworkadmin.api.domains.ApiCompanyModel;

@Service
public class ApiCompanyService {

	/*
	@Autowired private ApiCompanyDAO companyDAO;
	@Autowired protected ApiCategoryService categoryService;

	
	public List<ApiCompanyModel> getCompanyList(ApiCompanyModel model) throws Exception {
		//return companyDAO.getCompanyList(model);
		List<ApiCompanyModel> list = companyDAO.getCompanyList(model);

		List<ApiCompanyModel> listResult = new ArrayList<ApiCompanyModel>();
		for(int i = 0; i < list.size(); i++) {
			listResult.add(procDataItem(categoryService, list.get(i)));
		}
		return listResult;
	}
	
	public ApiCompanyModel getCompany(ApiCompanyModel model) throws Exception {
		//return userDAO.getCompany(model);
		ApiCompanyModel item = new ApiCompanyModel();		
		if((model.getId() != null && model.getId() > 0) || !ApiCommonUtils.isNullOrEmpty(model.getUid())) {
			List<ApiCompanyModel> list = companyDAO.getCompany(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
				item = procDataItem(categoryService, item);
			}
		}
		return item;
	}
	
	protected ApiCompanyModel procDataItem(ApiCategoryService categoryService, ApiCompanyModel item) {
		try {
			//법인/개인사업자 구분.
			String strBizCopY = "";
			if (item.getBiz_copy().equalsIgnoreCase("Y")) strBizCopY = "법인";
			else if (item.getBiz_copy().equalsIgnoreCase("N")) strBizCopY = "개인사업자";
			
			item.setStrBizCopY(strBizCopY);

			//기업형태.
			String bizForm = "";
			if (!ApiCommonUtils.isNullOrEmpty(item.getBiz_form())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getBiz_form());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizForm)) bizForm += ",";
				bizForm += modelCategory.getName();
			}
			
			item.setStrBizForm(bizForm);

			//직종.
			String bizCategory = "";
			if (!ApiCommonUtils.isNullOrEmpty(item.getBiz_category())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getBiz_category());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizCategory)) bizCategory += ",";
				bizCategory += modelCategory.getName();
			}
			
			item.setStrCategory(bizCategory);

			//상장여부
			String bizList = "";
			if (!ApiCommonUtils.isNullOrEmpty(item.getBiz_list())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getBiz_list());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizList)) bizList += ",";
				bizList += modelCategory.getName();
			}
			
			item.setStrBizList(bizList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return item;
	}


	
	public int getCompanyTotalCnt(ApiCompanyModel model) throws Exception {
		return companyDAO.getCompanyTotalCnt(model);
	}

	public Integer findCompany(ApiCompanyModel model) throws Exception {
		return companyDAO.findCompany(model);
	}

	public void insertCompany(ApiCompanyModel model) throws Exception {
		companyDAO.insertCompany(model);
	}

	public void updateCompany(ApiCompanyModel model) throws Exception {
		companyDAO.updateCompany(model);
	}

	public void updateMobileCompany(ApiCompanyModel model) throws Exception {
		companyDAO.updateMobileCompany(model);
	}
	
	public void deleteCompany(ApiCompanyModel model) throws Exception {
		companyDAO.deleteCompany(model);
	}
	
	public void deleteCompanyList(List<ApiCompanyModel> map) throws Exception {
		companyDAO.deleteCompanyList(map);
	}
	*/
}
