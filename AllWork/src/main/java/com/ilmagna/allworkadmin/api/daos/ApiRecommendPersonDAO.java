package com.ilmagna.allworkadmin.api.daos;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ilmagna.allworkadmin.api.domains.ApiRecommendPersonModel;


@Repository
public interface ApiRecommendPersonDAO {

	List<ApiRecommendPersonModel> getRecommendPersonList(ApiRecommendPersonModel model) throws Exception;

	List<ApiRecommendPersonModel> getRecommendPerson(ApiRecommendPersonModel model) throws Exception;

	List<ApiRecommendPersonModel> loadRecommendPerson(ApiRecommendPersonModel model) throws Exception;
	
	Integer getRecommendPersonTotalCnt(ApiRecommendPersonModel model) throws Exception;

	Integer getRecommendPersonDuplicatedCount(ApiRecommendPersonModel model) throws Exception;

	Integer findRecommendPerson(ApiRecommendPersonModel model) throws Exception;

	Integer findRecommendPersonWithUserID(String user_id) throws Exception;

	void insertRecommendPerson(ApiRecommendPersonModel model) throws Exception;

	void updateRecommendPerson(ApiRecommendPersonModel model) throws Exception;
	
	void deleteRecommendPerson(ApiRecommendPersonModel model) throws Exception;

	void deleteRecommendPersonList(List<ApiRecommendPersonModel> map) throws Exception;

	void insertExcelRecommendPerson(List<ApiRecommendPersonModel> map) throws Exception;
}
