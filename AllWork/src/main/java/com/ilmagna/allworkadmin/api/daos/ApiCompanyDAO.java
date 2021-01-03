package com.ilmagna.allworkadmin.api.daos;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ilmagna.allworkadmin.api.domains.ApiCompanyModel;


@Repository
public interface ApiCompanyDAO {

	List<ApiCompanyModel> getCompanyList(ApiCompanyModel model) throws Exception;

	List<ApiCompanyModel> getCompany(ApiCompanyModel model) throws Exception;
	
	Integer getCompanyTotalCnt(ApiCompanyModel model) throws Exception;

	Integer findCompany(ApiCompanyModel model) throws Exception;

	void insertCompany(ApiCompanyModel model) throws Exception;

	void updateCompany(ApiCompanyModel model) throws Exception;

	void updateMobileCompany(ApiCompanyModel model) throws Exception;
	
	void deleteCompany(ApiCompanyModel model) throws Exception;

	void deleteCompanyList(List<ApiCompanyModel> map) throws Exception;
}
