package com.ilmagna.allworkadmin.api.services;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;
import com.ilmagna.allworkadmin.api.common.ApiConvertorUtil;
import com.ilmagna.allworkadmin.api.daos.ApiRecommendPersonDAO;
import com.ilmagna.allworkadmin.api.domains.ApiRecommendPersonModel;

import allwork.common.CommandMap;
import allwork.service.PaymentInfoService;

@Service("apiRecommendPersonService")
public class ApiRecommendPersonService {
		
	//@Autowired private ApiRecommendPersonDAO recommendDAO;
	@Resource(name="apiRecommendPersonDAO")
	private ApiRecommendPersonDAO recommendDAO;

	@Resource(name="paymentInfoService")
	private PaymentInfoService paymentInfoService;	

	
	public List<ApiRecommendPersonModel> getRecommendPersonList(boolean bPaidUser, String loginId, ApiRecommendPersonModel model) throws Exception {
		//return recommendDAO.getRecommendPersonList(model);
		List<ApiRecommendPersonModel> list = recommendDAO.getRecommendPersonList(model);

		List<ApiRecommendPersonModel> listResult = new ArrayList<ApiRecommendPersonModel>();
		for(int i = 0; i < list.size(); i++) {
			ApiRecommendPersonModel item = procDataItem(list.get(i));
			
			int paidResume = 0;
			if (bPaidUser) {
				CommandMap commandMap = new CommandMap();
				commandMap.put("loginId", loginId);
				try {
					commandMap.put("resumeNo", item.getUno());
					int prsCnt = paymentInfoService.selectPaidResumeSearchCount(commandMap.getMap());
					if (prsCnt > 0) paidResume = 1;
				} catch (Exception e2) { }					
			}
			item.setPaidResume(paidResume);

			listResult.add(item);
		}
		return listResult;
	}
	
	public ApiRecommendPersonModel getRecommendPerson(ApiRecommendPersonModel model) throws Exception {
		//return userDAO.getRecommendPerson(model);
		ApiRecommendPersonModel item = new ApiRecommendPersonModel();		
		if(model.getId() > 0) {
			List<ApiRecommendPersonModel> list = recommendDAO.getRecommendPerson(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
				item = procDataItem(item);
			}
		}
		return item;
	}

	protected ApiRecommendPersonModel procDataItem(ApiRecommendPersonModel item) {
		try {
			//성별.
			String strSex = ApiConvertorUtil.getSex(item.getSex());
			item.setStrSex(strSex);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return item;
	}

	public int getRecommendPersonTotalCnt(ApiRecommendPersonModel model) throws Exception {
		return recommendDAO.getRecommendPersonTotalCnt(model);
	}

	/*
	public ApiRecommendPersonModel loadRecommendPerson(ApiRecommendPersonModel model) throws Exception {
		//return userDAO.loadRecommendPerson(model);
		ApiRecommendPersonModel item = new ApiRecommendPersonModel();		
		if(!ApiCommonUtils.isNullOrEmpty(model.getUid())) {
			List<ApiRecommendPersonModel> list = recommendDAO.loadRecommendPerson(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
				item = procDataItem(item);
			}
		}
		return item;
	}

	public Integer getRecommendPersonDuplicatedCount(ApiRecommendPersonModel model) throws Exception {
		return recommendDAO.getRecommendPersonDuplicatedCount(model);
	}

	public Integer findRecommendPerson(ApiRecommendPersonModel model) throws Exception {
		return recommendDAO.findRecommendPerson(model);
	}

	public Integer findRecommendPersonWithUserID(String user_id) throws Exception {
		return recommendDAO.findRecommendPersonWithUserID(user_id);
	}

	public void insertRecommendPerson(ApiRecommendPersonModel model) throws Exception {
		recommendDAO.insertRecommendPerson(model);
	}

	public void updateRecommendPerson(ApiRecommendPersonModel model) throws Exception {
		recommendDAO.updateRecommendPerson(model);
	}
	
	public void deleteRecommendPerson(ApiRecommendPersonModel model) throws Exception {
		recommendDAO.deleteRecommendPerson(model);
	}
	
	public void deleteRecommendPersonList(List<ApiRecommendPersonModel> map) throws Exception {
		recommendDAO.deleteRecommendPersonList(map);
	}

	public void insertExcelRecommendPerson(List<ApiRecommendPersonModel> map) throws Exception {
		recommendDAO.insertExcelRecommendPerson(map);
	}
	*/
}
