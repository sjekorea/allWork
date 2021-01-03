package com.ilmagna.allworkadmin.api.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.ai.domains.AiMatchingRecommendationModel;
import com.ilmagna.allworkadmin.ai.domains.AiMatchingRecruitModel;
import com.ilmagna.allworkadmin.ai.domains.AiMatchingResumeModel;
import com.ilmagna.allworkadmin.ai.services.AiMatchingRecruitService;
import com.ilmagna.allworkadmin.ai.services.AiMatchingResumeService;
import com.ilmagna.allworkadmin.api.domains.ApiMemberModel;
import com.ilmagna.allworkadmin.api.domains.ApiMobileModel;
import com.ilmagna.allworkadmin.api.domains.ApiRecommendPersonModel;
import com.ilmagna.allworkadmin.api.domains.ApiRecruitItemModel;
import com.ilmagna.allworkadmin.api.domains.ApiRecruitModel;
import com.ilmagna.allworkadmin.api.domains.ApiRecruitOtherModel;
import com.ilmagna.allworkadmin.api.domains.ApiResumeModel;

@Service
public class ApiMobileService {

	/*
	@Autowired protected AiMatchingResumeService matchingResumeService;
	@Autowired protected ApiRecruitItemService headhuntService;
	@Autowired protected ApiRecruitService recruitService;
	@Autowired protected ApiRecruitOtherService recruitOtherService;

	@Autowired protected AiMatchingRecruitService matchingRecruitService;
	@Autowired protected ApiResumeService resumeService;
	@Autowired protected ApiRecommendPersonService recommendService;

	@Autowired protected ApiCategoryService categoryService;
	*/

	
	/*
	 * 구직자 Home Dashboard
	 */
	/*
	public ApiMobileModel getJobSeekerHome(ApiMemberModel model) throws Exception {
		ApiMobileModel mobileModel = new ApiMobileModel();
		
		//맟춤형 채용정보.
		AiMatchingResumeModel modelRecruitMatching = new AiMatchingResumeModel();
		modelRecruitMatching.setUid(model.getUser_id());
		AiMatchingResumeModel itemMatchingRecruit = matchingResumeService.getResumeByMember(modelRecruitMatching);
		List<AiMatchingRecommendationModel> list = new ArrayList<AiMatchingRecommendationModel>();
		for (int i = 0; i < itemMatchingRecruit.getData().size() && i < 3; i++) {
			list.add(itemMatchingRecruit.getData().get(i));
		}
		mobileModel.setListMatchingRecruit(list);

		//올워크 등록 구인정보.
		ApiRecruitItemModel modelHeadhunt = new ApiRecruitItemModel();
		modelHeadhunt.setStartIdx(0);
		modelHeadhunt.setEndIdx(3);
		List<ApiRecruitItemModel> listHeadhunt = headhuntService.getRecruitItemList(modelHeadhunt);
		mobileModel.setListHeadhunt(listHeadhunt);

		//기업회원 등록 구인정보.
		ApiRecruitModel modelRecruit = new ApiRecruitModel();
		modelRecruit.setShowAll("N");
		modelRecruit.setStartIdx(0);
		modelRecruit.setEndIdx(3);
		List<ApiRecruitModel> listRecruit = recruitService.getRecruitList(modelRecruit);
		mobileModel.setListRecruit(listRecruit);
		
		//기타 채용정보.
		ApiRecruitOtherModel modelRecruitOther = new ApiRecruitOtherModel();
		modelRecruitOther.setStartIdx(0);
		modelRecruitOther.setEndIdx(3);
		List<ApiRecruitOtherModel> listRecruitOther = recruitOtherService.getRecruitOtherList(modelRecruitOther);
		mobileModel.setListRecruitOther(listRecruitOther);

		//결과 전달.
		return mobileModel;
	}
	*/

	/*
	 * 구인업체 Home Dashboard
	 */
	/*
	public ApiMobileModel getEmployerHome(ApiMemberModel model) throws Exception {
		ApiMobileModel mobileModel = new ApiMobileModel();
		
		//맟춤형 인재정보.
		AiMatchingRecruitModel modelResumeMatching = new AiMatchingRecruitModel();
		modelResumeMatching.setUid(model.getUser_id());
		AiMatchingRecruitModel itemMatchingResume = matchingRecruitService.getRecruitByCompany(modelResumeMatching);
		List<AiMatchingRecommendationModel> list = new ArrayList<AiMatchingRecommendationModel>();
		for (int i = 0; i < itemMatchingResume.getData().size() && i < 3; i++) {
			list.add(itemMatchingResume.getData().get(i));
		}
		mobileModel.setListMatchingResume(list);

		//기업회원 등록 구직정보.
		ApiResumeModel modelResume = new ApiResumeModel();
		modelResume.setShowAll("N");
		modelResume.setStartIdx(0);
		modelResume.setEndIdx(5);
		List<ApiResumeModel> listResume = resumeService.getResumeList(modelResume);
		mobileModel.setListResume(listResume);

		//우수인재 추천정보.
		ApiRecommendPersonModel modelRecommend = new ApiRecommendPersonModel();
		modelRecommend.setStartIdx(0);
		modelRecommend.setEndIdx(5);
		List<ApiRecommendPersonModel> listRecommend = recommendService.getRecommendPersonList(modelRecommend);
		mobileModel.setListRecommend(listRecommend);

		return mobileModel;
	}
	*/
}
