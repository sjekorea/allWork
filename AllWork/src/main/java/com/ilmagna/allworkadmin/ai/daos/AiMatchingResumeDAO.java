package com.ilmagna.allworkadmin.ai.daos;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ilmagna.allworkadmin.ai.domains.AiMatchingResumeModel;

import allwork.common.dao.AbstractDAO;


@Repository("aiMatchingResumeDAO")
public class AiMatchingResumeDAO extends AbstractDAO {


	@SuppressWarnings("unchecked")
	public List<AiMatchingResumeModel> getResumeByMember(AiMatchingResumeModel model) {
		List<AiMatchingResumeModel> list = (List<AiMatchingResumeModel>)selectList("com.ilmagna.allworkadmin.ai.daos.AiMatchingResumeDAO.getResumeByMember", model);
		List<AiMatchingResumeModel> listResult = new ArrayList<AiMatchingResumeModel>();
		if (list != null && !list.isEmpty()) {
			for (int i = 0; i < list.size(); i++) {
				//AiMatchingResumeModel obj = (AiMatchingResumeModel) list.get(i);
				//System.out.println(obj.getRecommendList01());
				listResult.add((AiMatchingResumeModel) list.get(i));
			}
		}
		return listResult;
	}

	/*
	List<AiMatchingResumeModel> getResumeList(AiMatchingResumeModel model) throws Exception;

	List<AiMatchingResumeModel> getResume(AiMatchingResumeModel model) throws Exception;

	List<AiMatchingResumeModel> getResumeByMember(AiMatchingResumeModel model) throws Exception;
	
	Integer getResumeTotalCnt(AiMatchingResumeModel model) throws Exception;

	Integer findResume(AiMatchingResumeModel model) throws Exception;

	void incRefCount(AiMatchingResumeModel model) throws Exception;

	void updateResume(AiMatchingResumeModel model) throws Exception;
	
	void deleteResume(AiMatchingResumeModel model) throws Exception;

	void deleteResumeList(List<AiMatchingResumeModel> map) throws Exception;
	*/
}
