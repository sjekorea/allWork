package com.ilmagna.allworkadmin.api.daos;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ilmagna.allworkadmin.api.domains.ApiRecruitModel;


@Repository
public interface ApiRecruitDAO {

	List<ApiRecruitModel> getRecruitList(ApiRecruitModel model) throws Exception;

	List<ApiRecruitModel> getRecruit(ApiRecruitModel model) throws Exception;
	
	Integer getRecruitTotalCnt(ApiRecruitModel model) throws Exception;

	Integer findRecruit(ApiRecruitModel model) throws Exception;

	void incRefCount(ApiRecruitModel model) throws Exception;

	void insertRecruit(ApiRecruitModel model) throws Exception;

	void updateRecruit(ApiRecruitModel model) throws Exception;

	void updateMobileRecruit(ApiRecruitModel model) throws Exception;

	void updateCloseRecruit(ApiRecruitModel model) throws Exception;

	void deleteRecruit(ApiRecruitModel model) throws Exception;

	void deleteRecruitList(List<ApiRecruitModel> map) throws Exception;
}
