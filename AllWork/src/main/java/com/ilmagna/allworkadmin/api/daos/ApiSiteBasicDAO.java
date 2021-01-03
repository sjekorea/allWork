package com.ilmagna.allworkadmin.api.daos;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ilmagna.allworkadmin.api.domains.ApiSiteBasicModel;

import allwork.common.dao.AbstractDAO;


@Repository("apiSiteBasicDAO")
public class ApiSiteBasicDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public ApiSiteBasicModel getSiteBasic(ApiSiteBasicModel model) throws Exception {
		//return (ApiSiteBasicModel) selectOne("com.ilmagna.allworkadmin.api.daos.ApiCategoryDAO.getSiteBasic", model);

		List<ApiSiteBasicModel> list = (List<ApiSiteBasicModel>) selectList("com.ilmagna.allworkadmin.api.daos.ApiSiteBasicDAO.getSiteBasic", model);
		if (list == null || list.size() < 1) return new ApiSiteBasicModel();
		
		return list.get(0);
	}

	/*
	List<ApiSiteBasicModel> getSiteBasic(ApiSiteBasicModel model) throws Exception;

	void updateSiteBasic(ApiSiteBasicModel model) throws Exception;
	*/
}
