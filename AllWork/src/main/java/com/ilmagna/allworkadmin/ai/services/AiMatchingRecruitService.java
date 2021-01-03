package com.ilmagna.allworkadmin.ai.services;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.ai.daos.AiMatchingRecruitDAO;
import com.ilmagna.allworkadmin.ai.domains.AiMatchingRecommendationModel;
import com.ilmagna.allworkadmin.ai.domains.AiMatchingRecruitModel;
import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;
import com.ilmagna.allworkadmin.api.services.ApiCategoryService;

@Service("aiMatchingRecruitService")
public class AiMatchingRecruitService {
		
	//@Autowired private AiMatchingRecruitDAO matchingRecruitDAO;
	//@Autowired protected ApiCategoryService categoryService;

	@Resource(name="aiMatchingRecruitDAO")
	protected AiMatchingRecruitDAO matchingRecruitDAO;

	@Resource(name="apiCategoryService")
	protected ApiCategoryService categoryService;

	
	public AiMatchingRecruitModel getRecruitByCompany(AiMatchingRecruitModel model) throws Exception {
		//return userDAO.getRecruit(model);
		AiMatchingRecruitModel item = new AiMatchingRecruitModel();		
		if(!ApiCommonUtils.isNullOrEmpty(model.getUid())) {
			List<AiMatchingRecruitModel> list = matchingRecruitDAO.getRecruitByCompany(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
				
				//추천목록 구성.
				List<AiMatchingRecommendationModel> listResult = new ArrayList<AiMatchingRecommendationModel>();
				for (int i = 0; i < list.size(); i++) {
					AiMatchingRecruitModel itemData = procDataItem(list.get(i));
					for (int j = 0; j < itemData.getData().size(); j++) {
						listResult.add(itemData.getData().get(j));
					}
				}
				item.setData(listResult);
			}
		}
		return item;
	}

	protected AiMatchingRecruitModel procDataItem(AiMatchingRecruitModel item) {
		try {
			item.parseJsonString(categoryService);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return item;
	}

	/*
	public List<AiMatchingRecruitModel> getRecruitList(AiMatchingRecruitModel model) throws Exception {
		List<AiMatchingRecruitModel> list = matchingRecruitDAO.getRecruitList(model);

		List<AiMatchingRecruitModel> listResult = new ArrayList<AiMatchingRecruitModel>();
		for(int i = 0; i < list.size(); i++) {
			listResult.add(procDataItem(list.get(i)));
		}
		return listResult;
	}
	
	public AiMatchingRecruitModel getRecruit(AiMatchingRecruitModel model) throws Exception {
		//return userDAO.getRecruit(model);
		AiMatchingRecruitModel item = new AiMatchingRecruitModel();		
		if((model.getId() != null && model.getId() > 0)
				|| (model.getRecruit_id() != null && model.getRecruit_id() > 0)) {
			List<AiMatchingRecruitModel> list = matchingRecruitDAO.getRecruit(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
				item = procDataItem(item);
			}
		}
		return item;
	}
	
	public AiMatchingRecruitModel getRecruitByCompany(AiMatchingRecruitModel model) throws Exception {
		//return userDAO.getRecruit(model);
		AiMatchingRecruitModel item = new AiMatchingRecruitModel();		
		if(!ApiCommonUtils.isNullOrEmpty(model.getUid())) {
			List<AiMatchingRecruitModel> list = matchingRecruitDAO.getRecruitByCompany(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
				
				//추천목록 구성.
				List<AiMatchingRecommendationModel> listResult = new ArrayList<AiMatchingRecommendationModel>();
				for (int i = 0; i < list.size(); i++) {
					AiMatchingRecruitModel itemData = procDataItem(list.get(i));
					for (int j = 0; j < itemData.getData().size(); j++) {
						listResult.add(itemData.getData().get(j));
					}
				}
				item.setData(listResult);
			}
		}
		return item;
	}

	protected AiMatchingRecruitModel procDataItem(AiMatchingRecruitModel item) {
		try {
			item.parseJsonString(categoryService);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return item;
	}
	
	
	public int getRecruitTotalCnt(AiMatchingRecruitModel model) throws Exception {
		return matchingRecruitDAO.getRecruitTotalCnt(model);
	}

	public Integer findRecruit(AiMatchingRecruitModel model) throws Exception {
		return matchingRecruitDAO.findRecruit(model);
	}
	
	public void deleteRecruit(AiMatchingRecruitModel model) throws Exception {
		matchingRecruitDAO.deleteRecruit(model);
	}
	
	public void deleteRecruitList(List<AiMatchingRecruitModel> map) throws Exception {
		matchingRecruitDAO.deleteRecruitList(map);
	}
	*/
}
