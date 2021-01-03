package com.ilmagna.allworkadmin.ai.daos;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ilmagna.allworkadmin.ai.domains.AiMatchingRecruitModel;

import allwork.common.dao.AbstractDAO;


@Repository("aiMatchingRecruitDAO")
public class AiMatchingRecruitDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<AiMatchingRecruitModel> getRecruitByCompany(AiMatchingRecruitModel model) {
		//List<Map<String, Object>> list = (List<Map<String, Object>>)selectList("com.ilmagna.allworkadmin.ai.daos.AiMatchingRecruitDAO.getRecruitByCompany", map);
		List<AiMatchingRecruitModel> list = (List<AiMatchingRecruitModel>)selectList("com.ilmagna.allworkadmin.ai.daos.AiMatchingRecruitDAO.getRecruitByCompany", model);

		List<AiMatchingRecruitModel> listResult = new ArrayList<AiMatchingRecruitModel>();
		if (list != null && !list.isEmpty()) {
			for (int i = 0; i < list.size(); i++) {
				//AiMatchingRecruitModel obj = (AiMatchingRecruitModel) list.get(i);
				//System.out.println(obj.getRecommendList01());
				listResult.add((AiMatchingRecruitModel) list.get(i));
			}	
		}
		return listResult;
	}

	/*
	List<AiMatchingRecruitModel> getRecruitList(AiMatchingRecruitModel model) throws Exception;

	List<AiMatchingRecruitModel> getRecruit(AiMatchingRecruitModel model) throws Exception;

	List<AiMatchingRecruitModel> getRecruitByCompany(AiMatchingRecruitModel model) throws Exception;
	
	Integer getRecruitTotalCnt(AiMatchingRecruitModel model) throws Exception;

	Integer findRecruit(AiMatchingRecruitModel model) throws Exception;

	void incRefCount(AiMatchingRecruitModel model) throws Exception;

	void updateRecruit(AiMatchingRecruitModel model) throws Exception;
	
	void deleteRecruit(AiMatchingRecruitModel model) throws Exception;

	void deleteRecruitList(List<AiMatchingRecruitModel> map) throws Exception;
	*/
}
