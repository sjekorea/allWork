package com.ilmagna.allworkadmin.api.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;
import com.ilmagna.allworkadmin.api.common.ApiConvertorUtil;
import com.ilmagna.allworkadmin.api.daos.ApiApplyDAO;
import com.ilmagna.allworkadmin.api.domains.ApiApplyModel;
import com.ilmagna.allworkadmin.api.domains.ApiMemberModel;
import com.ilmagna.allworkadmin.api.domains.ApiRecruitModel;
import com.ilmagna.allworkadmin.api.domains.ApiResumeModel;

@Service
public class ApiApplyService {
	
	/*
	@Autowired private ApiApplyDAO applyDAO;
	@Autowired protected ApiCategoryService categoryService;
	@Autowired protected ApiMemberService memberService;

	
	public List<ApiApplyModel> getApplyList(ApiResumeService resumeService, ApiRecruitService recruitService, ApiApplyModel model) throws Exception {
		//return applyDAO.getApplyList(model);
		List<ApiApplyModel> list = applyDAO.getApplyList(model);

		List<ApiApplyModel> listResult = new ArrayList<ApiApplyModel>();
		for(int i = 0; i < list.size(); i++) {
			listResult.add(procDataItem(resumeService, recruitService, list.get(i)));
		}
		return listResult;
	}
	
	public ApiApplyModel getApply(ApiResumeService resumeService, ApiRecruitService recruitService, ApiApplyModel model) throws Exception {
		//return userDAO.getApply(model);
		ApiApplyModel item = new ApiApplyModel();		
		if(model.getId() > 0) {
			List<ApiApplyModel> list = applyDAO.getApply(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
				item = procDataItem(resumeService, recruitService, item);
			}
		}
		return item;
	}
	
	protected ApiApplyModel procDataItem(ApiResumeService resumeService, ApiRecruitService recruitService, ApiApplyModel item) {
		try {
			//개인회원과 이력서 정보.
			ApiResumeModel resumeModel = new ApiResumeModel();
			resumeModel.setId(item.getFrom_no());
			resumeModel = resumeService.getResume(resumeModel);
			if (resumeModel != null && resumeModel.getId() > 0) {
				item.setUserName(resumeModel.getName());
				item.setResumeTitle(resumeModel.getInid_title());

				//구직자 정보.
				ApiMemberModel memberModel = new ApiMemberModel();
				memberModel.setUser_id(resumeModel.getUid());
				memberModel = memberService.getMember(memberModel);

				//성별.
				String strSex = ApiConvertorUtil.getSex(memberModel.getSex());
				item.setStrSex(strSex);
				
				//생일에서 년도만 추출.
				if (!ApiCommonUtils.isNullOrEmpty(memberModel.getBirth()) && memberModel.getBirth().length() >= 4) {
					item.setBirth(memberModel.getBirth().substring(0, 4));
				}
			}

			//기업회원과 채용정보.
			ApiRecruitModel recruitModel = new ApiRecruitModel();
			recruitModel.setId(item.getTo_no());
			recruitModel = recruitService.getRecruit(recruitModel);
			if (recruitModel != null && recruitModel.getId() > 0) {
				item.setCompanyName(recruitModel.getBiz_name());
				item.setJobTitle(recruitModel.getBiz_title());
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return item;
	}

	
	
	
	public int getApplyTotalCnt(ApiApplyModel model) throws Exception {
		return applyDAO.getApplyTotalCnt(model);
	}

	public Integer getApplyDuplicatedCount(ApiApplyModel model) throws Exception {
		return applyDAO.getApplyDuplicatedCount(model);
	}

	public void insertApply(ApiApplyModel model) throws Exception {
		applyDAO.insertApply(model);
	}

	public Integer findApply(ApiApplyModel model) throws Exception {
		return applyDAO.findApply(model);
	}
	
	public void deleteApply(ApiApplyModel model) throws Exception {
		applyDAO.deleteApply(model);
	}
	
	public void deleteApplyList(List<ApiApplyModel> map) throws Exception {
		applyDAO.deleteApplyList(map);
	}
	*/
}
