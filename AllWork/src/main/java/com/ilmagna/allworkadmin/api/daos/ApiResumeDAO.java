package com.ilmagna.allworkadmin.api.daos;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ilmagna.allworkadmin.api.domains.ApiResumeModel;


@Repository
public interface ApiResumeDAO {

	List<ApiResumeModel> getResumeList(ApiResumeModel model) throws Exception;

	List<ApiResumeModel> getResume(ApiResumeModel model) throws Exception;
	
	Integer getResumeTotalCnt(ApiResumeModel model) throws Exception;

	void incRefCount(ApiResumeModel model) throws Exception;

	Integer findResume(ApiResumeModel model) throws Exception;

	void insertResume(ApiResumeModel model) throws Exception;

	void updateResume(ApiResumeModel model) throws Exception;

	void updateSecretResume(ApiResumeModel model) throws Exception;

	void updateMobileResume(ApiResumeModel model) throws Exception;

	void deleteResume(ApiResumeModel model) throws Exception;

	void deleteResumeList(List<ApiResumeModel> map) throws Exception;
}
