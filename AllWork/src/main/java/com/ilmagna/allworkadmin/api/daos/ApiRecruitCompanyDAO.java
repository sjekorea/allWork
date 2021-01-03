package com.ilmagna.allworkadmin.api.daos;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ilmagna.allworkadmin.api.domains.ApiRecruitCompanyModel;


@Repository
public interface ApiRecruitCompanyDAO {

	List<ApiRecruitCompanyModel> getRecruitCompanyList(ApiRecruitCompanyModel model) throws Exception;

	List<ApiRecruitCompanyModel> getRecruitCompany(ApiRecruitCompanyModel model) throws Exception;
	
	Integer getRecruitCompanyTotalCnt(ApiRecruitCompanyModel model) throws Exception;

	Integer getRecruitCompanyDuplicatedCount(ApiRecruitCompanyModel model) throws Exception;

	Integer findRecruitCompany(ApiRecruitCompanyModel model) throws Exception;

	void insertRecruitCompany(ApiRecruitCompanyModel model) throws Exception;

	void updateRecruitCompany(ApiRecruitCompanyModel model) throws Exception;
	
	void deleteRecruitCompany(ApiRecruitCompanyModel model) throws Exception;

	void deleteRecruitCompanyList(List<ApiRecruitCompanyModel> map) throws Exception;

	void insertExcelRecruitCompany(List<ApiRecruitCompanyModel> map) throws Exception;

	List<ApiRecruitCompanyModel> getRecruitCompanyCodeList(ApiRecruitCompanyModel model) throws Exception;
}
