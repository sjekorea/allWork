package com.ilmagna.allworkadmin.api.daos;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ilmagna.allworkadmin.api.domains.ApiApplyModel;


@Repository
public interface ApiApplyDAO {

	List<ApiApplyModel> getApplyList(ApiApplyModel model) throws Exception;

	List<ApiApplyModel> getApply(ApiApplyModel model) throws Exception;
	
	Integer getApplyTotalCnt(ApiApplyModel model) throws Exception;

	Integer getApplyDuplicatedCount(ApiApplyModel model) throws Exception;

	Integer findApply(ApiApplyModel model) throws Exception;

	void insertApply(ApiApplyModel model) throws Exception;

	void deleteApply(ApiApplyModel model) throws Exception;

	void deleteApplyList(List<ApiApplyModel> map) throws Exception;
}
