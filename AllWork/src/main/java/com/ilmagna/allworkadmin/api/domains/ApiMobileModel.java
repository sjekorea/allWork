package com.ilmagna.allworkadmin.api.domains;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.ilmagna.allworkadmin.ai.domains.AiMatchingRecommendationModel;
import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;

public class ApiMobileModel extends ApiJqGridParams implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;

	//구직자와 구인업체 공통정보.

	//구직자를 위한 Home Dashboard 정보.
	private List<AiMatchingRecommendationModel> listMatchingRecruit;	//맟춤형 구직 정보.
	private List<ApiRecruitItemModel> listHeadhunt;						//올워크 등록 채용정보.
	private List<ApiRecruitModel> listRecruit;							//기업회원 등록 채용정보.
	private List<ApiRecruitOtherModel> listRecruitOther;				//기타 채용정보.
	
	//구인업체 위한 Home Dashboard 정보.
	private List<AiMatchingRecommendationModel> listMatchingResume;		//맟춤형 구인 정보.
	private List<ApiResumeModel> listResume;							//개인회원 등록 구직정보.
	private List<ApiRecommendPersonModel> listRecommend;				//우수인재 추천정보.
	
	//Constructor.
	public ApiMobileModel() {
		listMatchingResume = new ArrayList<AiMatchingRecommendationModel>();
		listHeadhunt = new ArrayList<ApiRecruitItemModel>();
		listRecruit = new ArrayList<ApiRecruitModel>();
		listRecruitOther = new ArrayList<ApiRecruitOtherModel>();

		listMatchingRecruit = new ArrayList<AiMatchingRecommendationModel>();
		listResume = new ArrayList<ApiResumeModel>();
		listRecommend = new ArrayList<ApiRecommendPersonModel>();
	}

	
	/**
	 * @return the listMatchingResume
	 */
	public List<AiMatchingRecommendationModel> getListMatchingResume() {
		return listMatchingResume;
	}
	/**
	 * @param listMatchingResume the listMatchingResume to set
	 */
	public void setListMatchingResume(List<AiMatchingRecommendationModel> listMatchingResume) {
		this.listMatchingResume = listMatchingResume;
	}

	/**
	 * @return the listMatchingRecruit
	 */
	public List<AiMatchingRecommendationModel> getListMatchingRecruit() {
		return listMatchingRecruit;
	}
	/**
	 * @param listMatchingRecruit the listMatchingRecruit to set
	 */
	public void setListMatchingRecruit(List<AiMatchingRecommendationModel> listMatchingRecruit) {
		this.listMatchingRecruit = listMatchingRecruit;
	}

	/**
	 * @return the listHeadhunt
	 */
	public List<ApiRecruitItemModel> getListHeadhunt() {
		return listHeadhunt;
	}
	/**
	 * @param listHeadhunt the listHeadhunt to set
	 */
	public void setListHeadhunt(List<ApiRecruitItemModel> listHeadhunt) {
		this.listHeadhunt = listHeadhunt;
	}

	/**
	 * @return the listRecruit
	 */
	public List<ApiRecruitModel> getListRecruit() {
		return listRecruit;
	}
	/**
	 * @param listRecruit the listRecruit to set
	 */
	public void setListRecruit(List<ApiRecruitModel> listRecruit) {
		this.listRecruit = listRecruit;
	}

	/**
	 * @return the listRecruitOther
	 */
	public List<ApiRecruitOtherModel> getListRecruitOther() {
		return listRecruitOther;
	}
	/**
	 * @param listRecruitOther the listRecruitOther to set
	 */
	public void setListRecruitOther(List<ApiRecruitOtherModel> listRecruitOther) {
		this.listRecruitOther = listRecruitOther;
	}

	/**
	 * @return the listResume
	 */
	public List<ApiResumeModel> getListResume() {
		return listResume;
	}
	/**
	 * @param listResume the listResume to set
	 */
	public void setListResume(List<ApiResumeModel> listResume) {
		this.listResume = listResume;
	}

	/**
	 * @return the listRecommend
	 */
	public List<ApiRecommendPersonModel> getListRecommend() {
		return listRecommend;
	}
	/**
	 * @param listRecommend the listRecommend to set
	 */
	public void setListRecommend(List<ApiRecommendPersonModel> listRecommend) {
		this.listRecommend = listRecommend;
	}
}
