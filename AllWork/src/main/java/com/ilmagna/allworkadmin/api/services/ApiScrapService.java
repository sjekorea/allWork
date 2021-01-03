package com.ilmagna.allworkadmin.api.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;
import com.ilmagna.allworkadmin.api.common.ApiConvertorUtil;
import com.ilmagna.allworkadmin.api.daos.ApiScrapDAO;
import com.ilmagna.allworkadmin.api.domains.ApiMemberModel;
import com.ilmagna.allworkadmin.api.domains.ApiRecruitModel;
import com.ilmagna.allworkadmin.api.domains.ApiResumeModel;
import com.ilmagna.allworkadmin.api.domains.ApiScrapModel;

@Service
public class ApiScrapService {

	/*
	@Autowired private ApiScrapDAO scrapDAO;
	@Autowired private ApiRecruitService recruitService;
	@Autowired private ApiResumeService resumeService;
	@Autowired protected ApiMemberService memberService;
	@Autowired protected ApiCategoryService categoryService;

	
	public List<ApiScrapModel> getScrapList(ApiScrapModel model) throws Exception {
		//return scrapDAO.getScrapList(model);
		List<ApiScrapModel> list = scrapDAO.getScrapList(model);

		List<ApiScrapModel> listResult = new ArrayList<ApiScrapModel>();
		for(int i = 0; i < list.size(); i++) {
			listResult.add(procDataItem(list.get(i)));
		}
		return listResult;
	}
	
	public ApiScrapModel getScrap(ApiScrapModel model) throws Exception {
		//return userDAO.getScrap(model);
		ApiScrapModel item = new ApiScrapModel();		
		if((model.getId() != null && model.getId() > 0) || !ApiCommonUtils.isNullOrEmpty(model.getUid())) {
			List<ApiScrapModel> list = scrapDAO.getScrap(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
				item = procDataItem(item);
			}
		}
		return item;
	}
	
	protected ApiScrapModel procDataItem(ApiScrapModel item) {
		try {
			if (item.getSub_type().equalsIgnoreCase("company")) {
				//채용정보 스크랩인 경우.
				ApiRecruitModel recruitModel = new ApiRecruitModel();
				recruitModel.setId(item.getNo());
				recruitModel = recruitService.getRecruit(recruitModel);
				if (recruitModel.getId() > 0) {
					item.setName(recruitModel.getBiz_name());
					item.setTitle(recruitModel.getBiz_title());
				}
			} else if (item.getSub_type().equalsIgnoreCase("indi")) {
				//인재정보 스크랩입 경우.
				ApiResumeModel resumeModel = new ApiResumeModel();
				resumeModel.setId(item.getNo());
				resumeModel = resumeService.getResume(resumeModel);
				if (resumeModel.getId() > 0) {
					item.setName(resumeModel.getName());
					item.setTitle(resumeModel.getInid_title());

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
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return item;
	}

	
	
	public int getScrapTotalCnt(ApiScrapModel model) throws Exception {
		return scrapDAO.getScrapTotalCnt(model);
	}

	public Integer getScrapDuplicatedCount(ApiScrapModel model) throws Exception {
		return scrapDAO.getScrapDuplicatedCount(model);
	}

	public Integer findScrap(ApiScrapModel model) throws Exception {
		return scrapDAO.findScrap(model);
	}

	public void insertScrap(ApiScrapModel model) throws Exception {
		scrapDAO.insertScrap(model);
	}

	public void updateScrap(ApiScrapModel model) throws Exception {
		scrapDAO.updateScrap(model);
	}
	
	public void deleteScrap(ApiScrapModel model) throws Exception {
		scrapDAO.deleteScrap(model);
	}
	
	public void deleteScrapList(List<ApiScrapModel> map) throws Exception {
		scrapDAO.deleteScrapList(map);
	}
	*/
}
