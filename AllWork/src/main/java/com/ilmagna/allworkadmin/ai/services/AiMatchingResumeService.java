package com.ilmagna.allworkadmin.ai.services;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.ai.daos.AiMatchingResumeDAO;
import com.ilmagna.allworkadmin.ai.domains.AiMatchingRecommendationModel;
import com.ilmagna.allworkadmin.ai.domains.AiMatchingResumeModel;
import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;
import com.ilmagna.allworkadmin.api.services.ApiCategoryService;

@Service("aiMatchingResumeService")
public class AiMatchingResumeService {
		
	//@Autowired private AiMatchingResumeDAO matchingResumeDAO;
	//@Autowired protected ApiCategoryService categoryService;

	@Resource(name="aiMatchingResumeDAO")
	protected AiMatchingResumeDAO matchingResumeDAO;

	@Resource(name="apiCategoryService")
	protected ApiCategoryService categoryService;

	
	public AiMatchingResumeModel getResumeByMember(AiMatchingResumeModel model) throws Exception {
		//return matchingResumeDAO.getResume(model);
		AiMatchingResumeModel item = new AiMatchingResumeModel();		
		if(!ApiCommonUtils.isNullOrEmpty(model.getUid())) {
			List<AiMatchingResumeModel> list = matchingResumeDAO.getResumeByMember(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
			
				//추천목록 구성.
				List<AiMatchingRecommendationModel> listResult = new ArrayList<AiMatchingRecommendationModel>();
				for (int i = 0; i < list.size(); i++) {
					AiMatchingResumeModel itemData = procDataItem(list.get(i));
					for (int j = 0; j < itemData.getData().size(); j++) {
						listResult.add(itemData.getData().get(j));
					}
				}
				item.setData(listResult);
			}
		}
		return item;
	}

	protected AiMatchingResumeModel procDataItem(AiMatchingResumeModel item) {
		try {
			item.parseJsonString(categoryService);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return item;
	}

	
	/*
	public List<AiMatchingResumeModel> getResumeList(AiMatchingResumeModel model) throws Exception {
		List<AiMatchingResumeModel> list = matchingResumeDAO.getResumeList(model);

		List<AiMatchingResumeModel> listResult = new ArrayList<AiMatchingResumeModel>();
		for(int i = 0; i < list.size(); i++) {
			listResult.add(procDataItem(list.get(i)));
		}
		return listResult;
	}
	
	public AiMatchingResumeModel getResume(AiMatchingResumeModel model) throws Exception {
		//return matchingResumeDAO.getResume(model);
		AiMatchingResumeModel item = new AiMatchingResumeModel();		
		if((model.getId() != null && model.getId() > 0)
				|| (model.getResume_id() != null && model.getResume_id() > 0)) {
			List<AiMatchingResumeModel> list = matchingResumeDAO.getResume(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
				item = procDataItem(item);
			}
		}
		return item;
	}
	
	public AiMatchingResumeModel getResumeByMember(AiMatchingResumeModel model) throws Exception {
		//return matchingResumeDAO.getResume(model);
		AiMatchingResumeModel item = new AiMatchingResumeModel();		
		if(!ApiCommonUtils.isNullOrEmpty(model.getUid())) {
			List<AiMatchingResumeModel> list = matchingResumeDAO.getResumeByMember(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
			
				//추천목록 구성.
				List<AiMatchingRecommendationModel> listResult = new ArrayList<AiMatchingRecommendationModel>();
				for (int i = 0; i < list.size(); i++) {
					AiMatchingResumeModel itemData = procDataItem(list.get(i));
					for (int j = 0; j < itemData.getData().size(); j++) {
						listResult.add(itemData.getData().get(j));
					}
				}
				item.setData(listResult);
			}
		}
		return item;
	}

	protected AiMatchingResumeModel procDataItem(AiMatchingResumeModel item) {
		try {
			item.parseJsonString(categoryService);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return item;
	}

	
	public int getResumeTotalCnt(AiMatchingResumeModel model) throws Exception {
		return matchingResumeDAO.getResumeTotalCnt(model);
	}

	public Integer findResume(AiMatchingResumeModel model) throws Exception {
		return matchingResumeDAO.findResume(model);
	}
	
	public void deleteResume(AiMatchingResumeModel model) throws Exception {
		matchingResumeDAO.deleteResume(model);
	}
	
	public void deleteResumeList(List<AiMatchingResumeModel> map) throws Exception {
		matchingResumeDAO.deleteResumeList(map);
	}
	*/
}
