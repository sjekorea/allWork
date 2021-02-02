package com.ilmagna.allworkadmin.migration.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;
import com.ilmagna.allworkadmin.api.domains.ApiResumeModel;
import com.ilmagna.allworkadmin.api.services.ApiCategoryService;
import com.ilmagna.allworkadmin.migration.daos.MigResumeDAO;
import com.ilmagna.allworkadmin.migration.domains.ResumeCareerModel;
import com.ilmagna.allworkadmin.migration.domains.ResumeEducationModel;
import com.ilmagna.allworkadmin.migration.domains.ResumeLanguageModel;
import com.ilmagna.allworkadmin.migration.domains.ResumeLicenseModel;

@Service
public class MigResumeService {
		
	@Autowired private MigResumeDAO resumeDAO;

	@Autowired protected ApiCategoryService categoryService;

	
	public List<ApiResumeModel> getResumeList(ApiResumeModel model) throws Exception {
		//return resumeDAO.getResumeList(model);
		List<ApiResumeModel> list = resumeDAO.getResumeList(model);

		List<ApiResumeModel> listResult = new ArrayList<ApiResumeModel>();
		for(int i = 0; i < list.size(); i++) {
			listResult.add(procDataItem(list.get(i)));
		}
		return listResult;
	}
	
	public List<ApiResumeModel> getResumeIdList(ApiResumeModel model) throws Exception {
		return resumeDAO.getResumeIdList(model);
	}
	
	public ApiResumeModel getResume(ApiResumeModel model) throws Exception {
		//return userDAO.getResume(model);
		ApiResumeModel item = new ApiResumeModel();		
		if((model.getId() != null && model.getId() > 0) || !ApiCommonUtils.isNullOrEmpty(model.getUid())) {
			List<ApiResumeModel> list = resumeDAO.getResume(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
				item = procDataItem(item);
			}
		}
		return item;
	}

	protected ApiResumeModel procDataItem(ApiResumeModel item) {
		try {
			//이력서 공개/비공개
			String strSecret = "";
			if (item.getInidSecret().compareToIgnoreCase("no") == 0) strSecret = "공개";
			else if (item.getInidSecret().compareToIgnoreCase("yes") == 0) strSecret = "비공개";
			
			item.setStrSecret(strSecret);

			//학력, 경력, 자격증, 외국어 능력.
			ResumeEducationModel modelEducation = new ResumeEducationModel();
			item.setModelEducation(modelEducation);
			modelEducation.parseEducation(categoryService, item.getInidLastSchool());
			
			ResumeCareerModel modelCareer = new ResumeCareerModel();
			item.setModelCareer(modelCareer);
			modelCareer.parseCareer(item.getInidCareer());

			ResumeLicenseModel modelLicense = new ResumeLicenseModel();
			item.setModelLicense(modelLicense);
			modelLicense.parseLicense(item.getInidLicense());

			ResumeLanguageModel modelLanguage = new ResumeLanguageModel();
			item.setModelLanguage(modelLanguage);
			modelLanguage.parseLanguage(item.getInidLanguages());
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

	public void updateResume(ApiResumeModel model) throws Exception {
		resumeDAO.updateResume(model);
	}
}
