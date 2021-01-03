package com.ilmagna.allworkadmin.api.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;
import com.ilmagna.allworkadmin.api.common.ApiConvertorUtil;
import com.ilmagna.allworkadmin.api.daos.ApiResumeDAO;
import com.ilmagna.allworkadmin.api.domains.ApiCategoryModel;
import com.ilmagna.allworkadmin.api.domains.ApiRecruitModel;
import com.ilmagna.allworkadmin.api.domains.ApiResumeModel;
import com.ilmagna.allworkadmin.migration.domains.ResumeCareerModel;
import com.ilmagna.allworkadmin.migration.domains.ResumeEducationModel;
import com.ilmagna.allworkadmin.migration.domains.ResumeLanguageModel;
import com.ilmagna.allworkadmin.migration.domains.ResumeLicenseModel;

@Service
public class ApiResumeService {

	/*
	@Autowired private ApiResumeDAO resumeDAO;
	@Autowired protected ApiRecruitService recruitService;
	@Autowired protected ApiCategoryService categoryService;

	
	public List<ApiResumeModel> getResumeList(ApiResumeModel model) throws Exception {
		//return resumeDAO.getResumeList(model);
		List<ApiResumeModel> list = resumeDAO.getResumeList(model);

		List<ApiResumeModel> listResult = new ArrayList<ApiResumeModel>();
		for(int i = 0; i < list.size(); i++) {
			listResult.add(procDataItem(categoryService, list.get(i)));
		}
		return listResult;
	}
	
	public ApiResumeModel getResume(ApiResumeModel model) throws Exception {
		//return userDAO.getResume(model);
		ApiResumeModel item = new ApiResumeModel();		
		if((model.getId() != null && model.getId() > 0) || !ApiCommonUtils.isNullOrEmpty(model.getUid())) {
			List<ApiResumeModel> list = resumeDAO.getResume(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
				item = procDataItem(categoryService, item);
				
				//사용자가 등록한 채용공고 개수 검색.
				if(!ApiCommonUtils.isNullOrEmpty(model.getCompany_uid())) {
					ApiRecruitModel recruitModel = new ApiRecruitModel();
					recruitModel.setShowAll("N");
					recruitModel.setUid(model.getCompany_uid());
					int totalRows = recruitService.getRecruitTotalCnt(recruitModel);
					item.setRecruit_count(totalRows);
				}
			}
		}
		return item;
	}
	
	protected ApiResumeModel procDataItem(ApiCategoryService categoryService, ApiResumeModel item) {
		try {
			//생일에서 년도만 추출.
			if (!ApiCommonUtils.isNullOrEmpty(item.getBirth()) && item.getBirth().length() >= 4) {
				item.setBirth(item.getBirth().substring(0, 4));
			}
				
			//직종.
			String bizType = "";
			if (!ApiCommonUtils.isNullOrEmpty(item.getInid_type1())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getInid_type1());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizType)) bizType += ",";
				bizType += modelCategory.getName();
			}
			if (!ApiCommonUtils.isNullOrEmpty(item.getInid_type2())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getInid_type2());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizType)) bizType += ">";
				bizType += modelCategory.getName();
			}
			if (!ApiCommonUtils.isNullOrEmpty(item.getInid_type3())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getInid_type3());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizType)) bizType += ">";
				bizType += modelCategory.getName();
			}
			if (!ApiCommonUtils.isNullOrEmpty(item.getInid_type4())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getInid_type4());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizType)) bizType += ",";
				bizType += modelCategory.getName();
			}
			if (!ApiCommonUtils.isNullOrEmpty(item.getInid_type5())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getInid_type5());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizType)) bizType += ">";
				bizType += modelCategory.getName();
			}
			if (!ApiCommonUtils.isNullOrEmpty(item.getInid_type6())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getInid_type6());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizType)) bizType += ">";
				bizType += modelCategory.getName();
			}
			if (!ApiCommonUtils.isNullOrEmpty(item.getInid_type7())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getInid_type7());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizType)) bizType += ",";
				bizType += modelCategory.getName();
			}
			if (!ApiCommonUtils.isNullOrEmpty(item.getInid_type8())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getInid_type8());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizType)) bizType += ">";
				bizType += modelCategory.getName();
			}
			if (!ApiCommonUtils.isNullOrEmpty(item.getInid_type9())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getInid_type9());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizType)) bizType += ">";
				bizType += modelCategory.getName();
			}
			if (ApiCommonUtils.isNullOrEmpty(bizType)) bizType = "전체";
			
			item.setStrBizType(bizType);

			//지역.
			String bizArea = "";
			if (!ApiCommonUtils.isNullOrEmpty(item.getInid_area1())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getInid_area1());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizArea)) bizArea += ",";
				bizArea += modelCategory.getName();
			}
			if (!ApiCommonUtils.isNullOrEmpty(item.getInid_area2())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getInid_area2());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizArea)) bizArea += ">";
				bizArea += modelCategory.getName();
			}
			if (!ApiCommonUtils.isNullOrEmpty(item.getInid_area3())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getInid_area3());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizArea)) bizArea += ",";
				bizArea += modelCategory.getName();
			}
			if (!ApiCommonUtils.isNullOrEmpty(item.getInid_area4())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getInid_area4());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizArea)) bizArea += ">";
				bizArea += modelCategory.getName();
			}
			if (!ApiCommonUtils.isNullOrEmpty(item.getInid_area5())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getInid_area5());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizArea)) bizArea += ",";
				bizArea += modelCategory.getName();
			}
			if (!ApiCommonUtils.isNullOrEmpty(item.getInid_area6())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getInid_area6());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(bizArea)) bizArea += ">";
				bizArea += modelCategory.getName();
			}
			if (ApiCommonUtils.isNullOrEmpty(bizArea)) bizArea = "전체";
			
			item.setStrArea(bizArea);

			//고용형태.
			String strJobForm = "";
			if (!ApiCommonUtils.isNullOrEmpty(item.getInid_jobform())) {
				String[] listJobForm = item.getInid_jobform().split(",");
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
			
			//급여.
			String strPay = "";
			if (!ApiCommonUtils.isNullOrEmpty(item.getPay_type())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getPay_type());
				modelCategory = categoryService.getCategory(modelCategory);
				//if (!ApiCommonUtils.isNullOrEmpty(strPay)) strPay += ",";
				strPay += modelCategory.getName();
			}
			if (!ApiCommonUtils.isNullOrEmpty(item.getInid_pay())) {
				ApiCategoryModel modelCategory = new ApiCategoryModel();
				modelCategory.setCode(item.getInid_pay());
				modelCategory = categoryService.getCategory(modelCategory);
				if (!ApiCommonUtils.isNullOrEmpty(strPay)) strPay += " ";
				strPay += modelCategory.getName();
			}
	
			item.setStrPay(strPay);
			
			//성별.
			String strSex = ApiConvertorUtil.getSex(item.getInid_sex());
			item.setStrSex(strSex);
			
			//이력서 공개/비공개
			String strSecret = "";
			if (item.getInid_secret().compareToIgnoreCase("no") == 0) strSecret = "공개";
			else if (item.getInid_secret().compareToIgnoreCase("yes") == 0) strSecret = "비공개";
			
			item.setStrSecret(strSecret);
			
			//주소
			String strAddress = item.getInid_post() + " " + item.getInid_address1() + " " + item.getInid_address2();
			item.setStrAddress(strAddress);

			String strAddressMini = item.getInid_post() + " " + item.getInid_address1();
			item.setStrAddressMini(strAddressMini);

			//학력, 경력, 자격증, 외국어 능력.
			ResumeEducationModel modelEducation = new ResumeEducationModel();
			item.setModelEducation(modelEducation);
			//modelEducation.parseEducation(categoryService, item.getInid_last_school());
			modelEducation.parseJsonString(item.getEducation2());
			
			ResumeCareerModel modelCareer = new ResumeCareerModel();
			item.setModelCareer(modelCareer);
			//modelCareer.parseCareer(item.getInid_career());
			modelCareer.parseJsonString(item.getCareer2());

			ResumeLicenseModel modelLicense = new ResumeLicenseModel();
			item.setModelLicense(modelLicense);
			//modelLicense.parseLicense(item.getInid_license());
			modelLicense.parseJsonString(item.getLicense2());

			ResumeLanguageModel modelLanguage = new ResumeLanguageModel();
			item.setModelLanguage(modelLanguage);
			//modelLanguage.parseLanguage(item.getInid_languages());
			modelLanguage.parseJsonString(item.getLanguage2());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return item;
	}

	
	
	public int getResumeTotalCnt(ApiResumeModel model) throws Exception {
		return resumeDAO.getResumeTotalCnt(model);
	}

	public Integer findResume(ApiResumeModel model) throws Exception {
		return resumeDAO.findResume(model);
	}

	public void incRefCount(ApiResumeModel model) throws Exception {
		resumeDAO.incRefCount(model);
	}

	public void insertResume(ApiResumeModel model) throws Exception {
		resumeDAO.insertResume(model);
	}

	public void updateResume(ApiResumeModel model) throws Exception {
		resumeDAO.updateResume(model);
	}

	public void updateSecretResume(ApiResumeModel model) throws Exception {
		resumeDAO.updateSecretResume(model);
	}

	public void updateMobileResume(ApiResumeModel model) throws Exception {
		resumeDAO.updateMobileResume(model);
	}

	public void deleteResume(ApiResumeModel model) throws Exception {
		resumeDAO.deleteResume(model);
	}
	
	public void deleteResumeList(List<ApiResumeModel> map) throws Exception {
		resumeDAO.deleteResumeList(map);
	}
	*/
}
