package com.ilmagna.allworkadmin.api.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;
import com.ilmagna.allworkadmin.api.common.ApiConvertorUtil;
import com.ilmagna.allworkadmin.api.daos.ApiRecruitDAO;
import com.ilmagna.allworkadmin.api.domains.ApiCategoryModel;
import com.ilmagna.allworkadmin.api.domains.ApiRecruitModel;
import com.ilmagna.allworkadmin.api.domains.ApiResumeModel;

@Service
public class ApiRecruitService {

	/*
	@Autowired private ApiRecruitDAO recruitDAO;
	@Autowired protected ApiResumeService resumeService;
	@Autowired protected ApiCategoryService categoryService;

	
	public List<ApiRecruitModel> getRecruitList(ApiRecruitModel model) throws Exception {
		//return recruitDAO.getRecruitList(model);
		List<ApiRecruitModel> list = recruitDAO.getRecruitList(model);

		List<ApiRecruitModel> listResult = new ArrayList<ApiRecruitModel>();
		for(int i = 0; i < list.size(); i++) {
			listResult.add(procDataItem(categoryService, list.get(i)));
		}
		return listResult;
	}
	
	public ApiRecruitModel getRecruit(ApiRecruitModel model) throws Exception {
		//return userDAO.getRecruit(model);
		ApiRecruitModel item = new ApiRecruitModel();		
		if((model.getId() != null && model.getId() > 0) || !ApiCommonUtils.isNullOrEmpty(model.getUid())) {
			List<ApiRecruitModel> list = recruitDAO.getRecruit(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
				item = procDataItem(categoryService, item);
				
				//사용자가 등록한 이력서 개수 검색.
				if(!ApiCommonUtils.isNullOrEmpty(model.getMember_uid())) {
					ApiResumeModel resumeModel = new ApiResumeModel();
					resumeModel.setUid(model.getMember_uid());
					int totalRows = resumeService.getResumeTotalCnt(resumeModel);
					item.setResume_count(totalRows);
				}
			}
		}
		return item;
	}
	
	protected ApiRecruitModel procDataItem(ApiCategoryService categoryService, ApiRecruitModel item) {
		try {
			//직종.
			String bizType = "";
			if (!ApiCommonUtils.isNullOrEmpty(item.getBiz_type1())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getBiz_type1());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizType)) bizType += ",";
				bizType += modelCategory.getName();
			}
			if (!ApiCommonUtils.isNullOrEmpty(item.getBiz_type2())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getBiz_type2());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizType)) bizType += ">";
				bizType += modelCategory.getName();
			}
			if (!ApiCommonUtils.isNullOrEmpty(item.getBiz_type3())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getBiz_type3());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizType)) bizType += ">";
				bizType += modelCategory.getName();
			}
			if (!ApiCommonUtils.isNullOrEmpty(item.getBiz_type4())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getBiz_type4());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizType)) bizType += ",";
				bizType += modelCategory.getName();
			}
			if (!ApiCommonUtils.isNullOrEmpty(item.getBiz_type5())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getBiz_type5());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizType)) bizType += ">";
				bizType += modelCategory.getName();
			}
			if (!ApiCommonUtils.isNullOrEmpty(item.getBiz_type6())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getBiz_type6());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizType)) bizType += ">";
				bizType += modelCategory.getName();
			}
			if (ApiCommonUtils.isNullOrEmpty(bizType)) bizType = "전체";
			
			item.setStrBizType(bizType);

			//지역.
			String bizArea = "";
			if (!ApiCommonUtils.isNullOrEmpty(item.getBiz_area1())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getBiz_area1());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizArea)) bizArea += ",";
				bizArea += modelCategory.getName();
			}
			if (!ApiCommonUtils.isNullOrEmpty(item.getBiz_area2())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getBiz_area2());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizArea)) bizArea += ">";
				bizArea += modelCategory.getName();
			}
			if (!ApiCommonUtils.isNullOrEmpty(item.getBiz_area3())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getBiz_area3());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizArea)) bizArea += ",";
				bizArea += modelCategory.getName();
			}
			if (!ApiCommonUtils.isNullOrEmpty(item.getBiz_area4())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getBiz_area4());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizArea)) bizArea += ">";
				bizArea += modelCategory.getName();
			}
			if (!ApiCommonUtils.isNullOrEmpty(item.getBiz_area5())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getBiz_area5());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizArea)) bizArea += ",";
				bizArea += modelCategory.getName();
			}
			if (!ApiCommonUtils.isNullOrEmpty(item.getBiz_area6())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getBiz_area6());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizArea)) bizArea += ">";
				bizArea += modelCategory.getName();
			}
			if (ApiCommonUtils.isNullOrEmpty(bizArea)) bizArea = "전체";
			
			item.setStrArea(bizArea);
			
			//채용마감.
			String strEndCond = "";
			if (item.getBiz_ing().equalsIgnoreCase("no")) {
				strEndCond = "채용마감";
			} else {
				if (item.getBiz_end_type().compareToIgnoreCase("get") == 0) strEndCond = "채용시";
				else if (item.getBiz_end_type().compareToIgnoreCase("often") == 0) strEndCond = "상시채용";
				else if (item.getBiz_end_type().compareToIgnoreCase("input") == 0) strEndCond = item.getBiz_end_day();
			}
			
			item.setStrEndCond(strEndCond);
			
			//고용형태.
			String strJobForm = "";
			if (!ApiCommonUtils.isNullOrEmpty(item.getBiz_jobfrom())) {
				String[] listJobForm = item.getBiz_jobfrom().split(",");
				List<ApiCategoryModel> listJobCode = new ArrayList<ApiCategoryModel>();
				for (int j = 0; j < listJobForm.length; j++) {
					if (ApiCommonUtils.isNullOrEmpty(listJobForm[j])) continue;

					ApiCategoryModel modelCategory = new ApiCategoryModel();
					modelCategory.setCode(listJobForm[j]);
					listJobCode.add(modelCategory);
				}
				
				if (listJobCode.size() > 0) {
					List<ApiCategoryModel> listModelCategory = categoryService.getCategoryCodeList(listJobCode);
					
					for (int j = 0; j < listModelCategory.size(); j++) {
						if (!ApiCommonUtils.isNullOrEmpty(strJobForm)) strJobForm += ",";
						strJobForm += listModelCategory.get(j).getName();
					}					
				}
			}

			item.setStrJobForm(strJobForm);
			
			//경력.
			String strBizCareer = "무관";
			if (item.getBiz_career() != null && item.getBiz_career() < 100) {
				strBizCareer = item.getBiz_career() + "년 이상";
			}
	
			item.setStrBizCareer(strBizCareer);

			//급여.
			String strPay = "";
			if (!ApiCommonUtils.isNullOrEmpty(item.getPay_type())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getPay_type());
				modelCategory = categoryService.getCategory(modelCategory);
				//if (!ApiCommonUtils.isNullOrEmpty(strPay)) strPay += ",";
				strPay += modelCategory.getName();
			}
			if (!ApiCommonUtils.isNullOrEmpty(item.getBiz_pay())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getBiz_pay());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(strPay)) strPay += " ";
				strPay += modelCategory.getName();
			}
	
			item.setStrPay(strPay);
			
			//성별.
			String strSex = ApiConvertorUtil.getSex(item.getBiz_sex());
			if (ApiCommonUtils.isNullOrEmpty(strSex)) strSex = "무관";
			item.setStrSex(strSex);
			
			//나이
			String strAge = item.getBiz_age();
			strAge = (ApiCommonUtils.isNullOrEmpty(strAge))? "" : strAge.replaceAll("NaN", "");
			
			if (strAge.compareToIgnoreCase("none") == 0 || strAge.compareToIgnoreCase("-") == 0) strAge = "무관";
			else strAge += "세";
			
			item.setStrAge(strAge);
			
			////주소
			//String strAddress = item.getBiz_post() + " " + item.getBiz_address1() + " " + item.getBiz_address2();
			//item.setStrAddress(strAddress);

			//String strAddressMini = item.getBiz_post() + " " + item.getBiz_address1();
			//item.setStrAddressMini(strAddressMini);

			//학력
			String strAbility = "";
			if (!ApiCommonUtils.isNullOrEmpty(strAbility)) {				
				if (item.getBiz_ability().equalsIgnoreCase("1")) 	  strAbility = "고등학교졸업";
				else if (item.getBiz_ability().equalsIgnoreCase("2")) strAbility = "대학졸업(2~3년)";
				else if (item.getBiz_ability().equalsIgnoreCase("3")) strAbility = "대학교졸업(4년)";
				else if (item.getBiz_ability().equalsIgnoreCase("4")) strAbility = "석사";
				else if (item.getBiz_ability().equalsIgnoreCase("5")) strAbility = "박사";
			}
			if (ApiCommonUtils.isNullOrEmpty(strAbility)) strAbility = "무관";
			
			item.setStrAbility(strAbility);

			//우대조건.
			String strPreference = "";
			if (!ApiCommonUtils.isNullOrEmpty(item.getBiz_preferential())) {
				String[] listPreference = item.getBiz_preferential().split(",");
				List<ApiCategoryModel> listJobCode = new ArrayList<ApiCategoryModel>();
				for (int j = 0; j < listPreference.length; j++) {
					if (ApiCommonUtils.isNullOrEmpty(listPreference[j])) continue;

					ApiCategoryModel modelCategory = new ApiCategoryModel();
					modelCategory.setCode(listPreference[j]);
					listJobCode.add(modelCategory);
				}
				
				if (listJobCode.size() > 0) {
					List<ApiCategoryModel> listModelCategory = categoryService.getCategoryCodeList(listJobCode);
					
					for (int j = 0; j < listModelCategory.size(); j++) {
						if (!ApiCommonUtils.isNullOrEmpty(strPreference)) strPreference += ",";
						strPreference += listModelCategory.get(j).getName();
					}
				}
			}
			if (ApiCommonUtils.isNullOrEmpty(strPreference)) strPreference = "등록된 우대조건 없음";

			item.setStrPreference(strPreference);

			//복리후생.
			String strWelfare = "";
			if (!ApiCommonUtils.isNullOrEmpty(item.getBiz_welfare())) {
				String[] listWelfare = item.getBiz_welfare().split(",");
				List<ApiCategoryModel> listJobCode = new ArrayList<ApiCategoryModel>();
				for (int j = 0; j < listWelfare.length; j++) {
					if (ApiCommonUtils.isNullOrEmpty(listWelfare[j])) continue;

					ApiCategoryModel modelCategory = new ApiCategoryModel();
					modelCategory.setCode(listWelfare[j]);
					listJobCode.add(modelCategory);
				}
				
				if (listJobCode.size() > 0) {
					List<ApiCategoryModel> listModelCategory = categoryService.getCategoryCodeList(listJobCode);
					
					for (int j = 0; j < listModelCategory.size(); j++) {
						if (!ApiCommonUtils.isNullOrEmpty(strWelfare)) strWelfare += ",";
						strWelfare += listModelCategory.get(j).getName();
					}
				}
			}

			item.setStrWelfare(strWelfare);
			
			//입사지원방법.
			String strMethod = "";
			if (!ApiCommonUtils.isNullOrEmpty(item.getBiz_method())) {
				String[] listMethod = item.getBiz_method().split(",");
				List<ApiCategoryModel> listJobCode = new ArrayList<ApiCategoryModel>();
				for (int j = 0; j < listMethod.length; j++) {
					if (ApiCommonUtils.isNullOrEmpty(listMethod[j])) continue;

					ApiCategoryModel modelCategory = new ApiCategoryModel();
					modelCategory.setCode(listMethod[j]);
					listJobCode.add(modelCategory);
				}
				
				if (listJobCode.size() > 0) {
					List<ApiCategoryModel> listModelCategory = categoryService.getCategoryCodeList(listJobCode);
					
					for (int j = 0; j < listModelCategory.size(); j++) {
						if (!ApiCommonUtils.isNullOrEmpty(strMethod)) strMethod += ",";
						strMethod += listModelCategory.get(j).getName();
					}
				}
			}

			item.setStrMethod(strMethod);
			
			//입사지원서류.
			String strPaper = "";
			if (!ApiCommonUtils.isNullOrEmpty(item.getBiz_paper())) {
				String[] listPaper = item.getBiz_paper().split(",");
				List<ApiCategoryModel> listJobCode = new ArrayList<ApiCategoryModel>();
				for (int j = 0; j < listPaper.length; j++) {
					if (ApiCommonUtils.isNullOrEmpty(listPaper[j])) continue;

					ApiCategoryModel modelCategory = new ApiCategoryModel();
					modelCategory.setCode(listPaper[j]);
					listJobCode.add(modelCategory);
				}
				
				if (listJobCode.size()> 0) {
					List<ApiCategoryModel> listModelCategory = categoryService.getCategoryCodeList(listJobCode);
					
					for (int j = 0; j < listModelCategory.size(); j++) {
						if (!ApiCommonUtils.isNullOrEmpty(strPaper)) strPaper += ",";
						strPaper += listModelCategory.get(j).getName();
					}
				}
			}

			item.setStrPaper(strPaper);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return item;
	}

	
	
	public int getRecruitTotalCnt(ApiRecruitModel model) throws Exception {
		return recruitDAO.getRecruitTotalCnt(model);
	}

	public Integer findRecruit(ApiRecruitModel model) throws Exception {
		return recruitDAO.findRecruit(model);
	}

	public void incRefCount(ApiRecruitModel model) throws Exception {
		recruitDAO.incRefCount(model);
	}

	public void insertRecruit(ApiRecruitModel model) throws Exception {
		recruitDAO.insertRecruit(model);
	}

	public void updateRecruit(ApiRecruitModel model) throws Exception {
		recruitDAO.updateRecruit(model);
	}

	public void updateMobileRecruit(ApiRecruitModel model) throws Exception {
		recruitDAO.updateMobileRecruit(model);
	}

	public void updateCloseRecruit(ApiRecruitModel model) throws Exception {
		recruitDAO.updateCloseRecruit(model);
	}

	public void deleteRecruit(ApiRecruitModel model) throws Exception {
		recruitDAO.deleteRecruit(model);
	}
	
	public void deleteRecruitList(List<ApiRecruitModel> map) throws Exception {
		recruitDAO.deleteRecruitList(map);
	}
	*/
}
