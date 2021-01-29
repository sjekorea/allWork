package com.ilmagna.allworkadmin.ai.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.ai.daos.AiMatchingRecruitDAO;
import com.ilmagna.allworkadmin.ai.domains.AiMatchingRecommendationModel;
import com.ilmagna.allworkadmin.ai.domains.AiMatchingRecruitModel;
import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;
import com.ilmagna.allworkadmin.api.services.ApiCategoryService;

import allwork.common.CommandMap;
import allwork.common.util.CommonColumnUtil;
import allwork.service.NetfuItemResumeService;
import allwork.service.PaymentInfoService;

@Service("aiMatchingRecruitService")
public class AiMatchingRecruitService {
		
	//@Autowired private AiMatchingRecruitDAO matchingRecruitDAO;
	//@Autowired protected ApiCategoryService categoryService;

	@Resource(name="aiMatchingRecruitDAO")
	protected AiMatchingRecruitDAO matchingRecruitDAO;

	@Resource(name="apiCategoryService")
	protected ApiCategoryService categoryService;

	@Resource(name="netfuItemResumeService")
	private NetfuItemResumeService netfuItemResumeService;

	@Resource(name="paymentInfoService")
	private PaymentInfoService paymentInfoService;	

	
	public AiMatchingRecruitModel getRecruitByCompany(AiMatchingRecruitModel model) throws Exception {
		//return userDAO.getRecruit(model);
		AiMatchingRecruitModel item = new AiMatchingRecruitModel();		
		if(!ApiCommonUtils.isNullOrEmpty(model.getUid())) {
			List<AiMatchingRecruitModel> list = matchingRecruitDAO.getRecruitByCompany(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
				
				//추천목록 구성.
				int nCount = 0;
				List<AiMatchingRecommendationModel> listResult = new ArrayList<AiMatchingRecommendationModel>();
				for (int i = 0; i < list.size(); i++) {
					AiMatchingRecruitModel itemData = procDataItem(list.get(i));
					for (int j = 0; j < itemData.getData().size(); j++) {
						////추천정보 등록일.
						//itemData.getData().get(j).setStrWdate(item.getStrWdate());
						
						AiMatchingRecommendationModel data = itemData.getData().get(j);

						//이력서 공개상태와 구직자 이력서 사진.
						Map<String, Object> resumeMap = new HashMap<String, Object>();
						try {
							if (!ApiCommonUtils.isNullOrEmpty(data.getRecommend_id())) {
								int recommend_id = Integer.parseInt(data.getRecommend_id());
								
								//이력서 공개상태.
								CommandMap commandMap = new CommandMap();
								commandMap.put("resumeColumn", CommonColumnUtil.getResumeColumn());
								commandMap.put("personUid", data.getUid());
								commandMap.put("no", recommend_id);
								resumeMap = netfuItemResumeService.selectNetfuItemResumeMap(commandMap.getMap());

								itemData.getData().get(j).setInid_secret((String) resumeMap.get("inidSecret"));

								//구직자 이력서 사진.
								itemData.getData().get(j).setPhoto((String) resumeMap.get("photo"));							
							}
						} catch (Exception e2) { }
						//사라진 이력서는 무시.
						if (resumeMap == null || resumeMap.isEmpty()) continue;		
						//비공개 이력서는 무시.
						if (itemData.getData().get(j).getInid_secret().equalsIgnoreCase("yes"))	continue;

						//기업회원 유료열람서비스 선택상태 검색.
						int paidResume = 0;
						try {
							if (!ApiCommonUtils.isNullOrEmpty(data.getRecommend_id())) {
								int recommend_id = Integer.parseInt(data.getRecommend_id());
								
								CommandMap commandMap = new CommandMap();
								commandMap.put("loginId", model.getUid());
								commandMap.put("resumeNo", recommend_id);
								int prsCnt = paymentInfoService.selectPaidResumeSearchCount(commandMap.getMap());
								if (prsCnt > 0) paidResume = 1;
							}
						} catch (Exception e2) { }					
						itemData.getData().get(j).setPaidResume(paidResume);
						
						//추천정보 등록.
						listResult.add(itemData.getData().get(j));
						nCount++;
						if (nCount >= 5) break;
					}
				}
				item.setData(listResult);
			}
		}
		return item;
	}

	protected AiMatchingRecruitModel procDataItem(AiMatchingRecruitModel item) {
		try {
			//JSON 문자열을 Object로 변환.
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
