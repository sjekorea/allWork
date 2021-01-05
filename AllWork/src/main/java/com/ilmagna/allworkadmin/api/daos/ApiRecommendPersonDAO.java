package com.ilmagna.allworkadmin.api.daos;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ilmagna.allworkadmin.api.domains.ApiRecommendPersonModel;

import allwork.common.dao.AbstractDAO;


@Repository("apiRecommendPersonDAO")
public class ApiRecommendPersonDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<ApiRecommendPersonModel> getRecommendPersonList(ApiRecommendPersonModel model) throws Exception {
		return (List<ApiRecommendPersonModel>) selectList("com.ilmagna.allworkadmin.api.daos.ApiRecommendPersonDAO.getRecommendPersonList", model);
	}

	@SuppressWarnings("unchecked")
	public List<ApiRecommendPersonModel> getRecommendPerson(ApiRecommendPersonModel model) throws Exception {
		return (List<ApiRecommendPersonModel>) selectList("com.ilmagna.allworkadmin.api.daos.ApiRecommendPersonDAO.getRecommendPerson", model);
	}
	
	public Integer getRecommendPersonTotalCnt(ApiRecommendPersonModel model) throws Exception {
		return selectCnt("com.ilmagna.allworkadmin.api.daos.ApiRecommendPersonDAO.getRecommendPersonTotalCnt", model);		
	}

	/*
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
	*/
}
