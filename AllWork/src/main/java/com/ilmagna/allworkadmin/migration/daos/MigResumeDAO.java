package com.ilmagna.allworkadmin.migration.daos;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ilmagna.allworkadmin.api.domains.ApiResumeModel;


@Repository
public interface MigResumeDAO {

	List<ApiResumeModel> getResumeList(ApiResumeModel model) throws Exception;

	List<ApiResumeModel> getResumeIdList(ApiResumeModel model) throws Exception;

	List<ApiResumeModel> getResume(ApiResumeModel model) throws Exception;
	
	Integer getResumeTotalCnt(ApiResumeModel model) throws Exception;

	Integer findResume(ApiResumeModel model) throws Exception;

	void updateResume(ApiResumeModel model) throws Exception;
}
