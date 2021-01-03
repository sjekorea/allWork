package com.ilmagna.allworkadmin.api.daos;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ilmagna.allworkadmin.api.domains.ApiRecruitProgressModel;


@Repository
public interface ApiRecruitProgressDAO {

	List<ApiRecruitProgressModel> getRecruitProgressList(ApiRecruitProgressModel model) throws Exception;

	List<ApiRecruitProgressModel> getRecruitProgress(ApiRecruitProgressModel model) throws Exception;
	
	Integer getRecruitProgressTotalCnt(ApiRecruitProgressModel model) throws Exception;

	Integer getRecruitProgressDuplicatedCount(ApiRecruitProgressModel model) throws Exception;

	Integer findRecruitProgress(ApiRecruitProgressModel model) throws Exception;

	void insertRecruitProgress(ApiRecruitProgressModel model) throws Exception;

	void updateRecruitProgress(ApiRecruitProgressModel model) throws Exception;
	
	void deleteRecruitProgress(ApiRecruitProgressModel model) throws Exception;

	void deleteRecruitProgressList(List<ApiRecruitProgressModel> map) throws Exception;

	void insertExcelRecruitProgress(List<ApiRecruitProgressModel> map) throws Exception;
}
