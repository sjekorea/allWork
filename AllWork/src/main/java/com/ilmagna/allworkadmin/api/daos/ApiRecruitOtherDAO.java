package com.ilmagna.allworkadmin.api.daos;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ilmagna.allworkadmin.api.domains.ApiRecruitOtherModel;


@Repository
public interface ApiRecruitOtherDAO {

	List<ApiRecruitOtherModel> getRecruitOtherList(ApiRecruitOtherModel model) throws Exception;

	List<ApiRecruitOtherModel> getRecruitOther(ApiRecruitOtherModel model) throws Exception;
	
	Integer getRecruitOtherTotalCnt(ApiRecruitOtherModel model) throws Exception;

	Integer getRecruitOtherDuplicatedCount(ApiRecruitOtherModel model) throws Exception;

	Integer findRecruitOther(ApiRecruitOtherModel model) throws Exception;

	void insertRecruitOther(ApiRecruitOtherModel model) throws Exception;

	void updateRecruitOther(ApiRecruitOtherModel model) throws Exception;
	
	void deleteRecruitOther(ApiRecruitOtherModel model) throws Exception;

	void deleteRecruitOtherList(List<ApiRecruitOtherModel> map) throws Exception;

	void insertExcelRecruitOther(List<ApiRecruitOtherModel> map) throws Exception;
}
