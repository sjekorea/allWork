package com.ilmagna.allworkadmin.ai.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.ai.daos.AiMatchingResumeDAO;
import com.ilmagna.allworkadmin.ai.domains.AiMatchingRecommendationModel;
import com.ilmagna.allworkadmin.ai.domains.AiMatchingResumeModel;
import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;
import com.ilmagna.allworkadmin.api.common.ApiConvertorUtil;
import com.ilmagna.allworkadmin.api.services.ApiCategoryService;

import allwork.common.CommandMap;
import allwork.common.util.CommonColumnUtil;
import allwork.service.NetfuItemCompanyService;
import allwork.service.RecruitOtherService;

@Service("aiMatchingResumeService")
public class AiMatchingResumeService {
		
	//@Autowired private AiMatchingResumeDAO matchingResumeDAO;
	//@Autowired protected ApiCategoryService categoryService;

	@Resource(name="aiMatchingResumeDAO")
	protected AiMatchingResumeDAO matchingResumeDAO;

	@Resource(name="apiCategoryService")
	protected ApiCategoryService categoryService;

	@Resource(name="netfuItemCompanyService")
	private NetfuItemCompanyService netfuItemCompanyService;	

	@Resource(name="recruitOtherService")
	private RecruitOtherService recruitOtherService;		

	
	public AiMatchingResumeModel getResumeByMember(AiMatchingResumeModel model) throws Exception {
		//return matchingResumeDAO.getResume(model);
		AiMatchingResumeModel item = new AiMatchingResumeModel();		
		if(!ApiCommonUtils.isNullOrEmpty(model.getUid())) {
			List<AiMatchingResumeModel> list = matchingResumeDAO.getResumeByMember(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
			
				//추천목록 구성.
				int nCount = 0;
				List<AiMatchingRecommendationModel> listResult = new ArrayList<AiMatchingRecommendationModel>();
				List<AiMatchingRecommendationModel> listResultTemp = new ArrayList<AiMatchingRecommendationModel>();
				for (int i = 0; i < list.size(); i++) {
					AiMatchingResumeModel itemData = procDataItem(list.get(i));
					for (int j = 0; j < itemData.getData().size(); j++) {

						//채용마감상태와 채용마감일 .
						Map<String, Object> recruitMap = new HashMap<String, Object>();
						boolean bDeletedItem = true;
						try {
							AiMatchingRecommendationModel obj = itemData.getData().get(j);

							//채용마감상태와 채용마감일 등록.
							String strBizIng = "yes";
							if (obj.getType() == 1) {
								//채용정보의 채용진행현황 검색.
								CommandMap commandMap = new CommandMap();
								commandMap.put("recruitColumn", CommonColumnUtil.getRecruitColumn());
								commandMap.put("no", itemData.getData().get(j).getRecommend_id());
								recruitMap = netfuItemCompanyService.selectNetfuItemCompanyMap(commandMap.getMap());
								strBizIng = (String) recruitMap.get("bizIng");								
								if (recruitMap == null || recruitMap.isEmpty()) continue;
							} else if (obj.getType() == 2) {
								/*
								//기타 채용정보 ID 추출.
								CommandMap commandMap = new CommandMap();
								commandMap.put("wantedAuthNo", itemData.getData().get(j).getRecommend_id());
								Map<String, Object> recruitOtherMap = recruitOtherService.selectRecruitOtherMap(commandMap.getMap());
								int nID = 0;
								if (recruitOtherMap.get("ser") != null) {
									nID = (Integer) recruitOtherMap.get("ser");
								}
								if (nID < 1) continue;
								itemData.getData().get(j).setId(nID);
								*/
							}
							itemData.getData().get(j).setBizIng(strBizIng);

							//채용마감일 등록.
							String strEdate = ApiConvertorUtil.getBizEndDay(itemData.getData().get(j).getBizIng(), itemData.getData().get(j).getBiz_end_type(), itemData.getData().get(j).getBiz_end_day());
							itemData.getData().get(j).setStrEdate(strEdate);
							
							bDeletedItem = false;
						} catch (Exception e2) {
							bDeletedItem = true;
						}
						//사라진 채용공고는 무시.
						if (bDeletedItem) continue;

						//추천정보 등록.
						listResultTemp.add(itemData.getData().get(j));
						if (!itemData.getData().get(j).getBizIng().equalsIgnoreCase("no")) {
							nCount++;
							if (nCount >= 5) break;
						}
					}
					
					//채용진행중인것을 우선순위로 표출.
					for (int j = 0; j < listResultTemp.size(); j++) {
						AiMatchingRecommendationModel objItem = listResultTemp.get(j);
						if (objItem.getBizIng().equalsIgnoreCase("no")) continue;
						listResult.add(objItem);
					}
					for (int j = 0; j < listResultTemp.size(); j++) {
						AiMatchingRecommendationModel objItem = listResultTemp.get(j);
						if (!objItem.getBizIng().equalsIgnoreCase("no")) continue;
						listResult.add(objItem);
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
