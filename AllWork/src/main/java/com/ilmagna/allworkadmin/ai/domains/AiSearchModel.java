/*
 * AI 시멘틱 검색.
 */
package com.ilmagna.allworkadmin.ai.domains;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;

public class AiSearchModel extends ApiJqGridParams implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private String keyword;								//시멘틱 검색을 위한 키워드.
	private List<AiMatchingRecommendationModel> recruitDataAllwork;	//올워크 채용정보에 대한 Java Object.
	private List<AiMatchingRecommendationModel> recruitDataWorknet;	//워크넷 채용정보에 대한 Java Object.
	private List<AiMatchingRecommendationModel> resumeDataAllwork;	//올워크 인재정보에 대한 Java Object.

	
	public AiSearchModel() {
		this.keyword	= "";						//시멘틱 검색을 위한 키워드.
		this.recruitDataAllwork = new ArrayList<AiMatchingRecommendationModel>();	//올워크 채용정보에 대한 Java Object.
		this.recruitDataWorknet = new ArrayList<AiMatchingRecommendationModel>();	//워크넷 채용정보에 대한 Java Object.
		this.resumeDataAllwork = new ArrayList<AiMatchingRecommendationModel>();	//올워크 인재정보에 대한 Java Object.
	}


	/**
	 * @return the keyword
	 */
	public String getKeyword() {
		return keyword;
	}
	/**
	 * @param keyword the keyword to set
	 */
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	/**
	 * @return the recruitDataAllwork
	 */
	public List<AiMatchingRecommendationModel> getRecruitDataAllwork() {
		return recruitDataAllwork;
	}
	/**
	 * @param recruitDataAllwork the recruitDataAllwork to set
	 */
	public void setRecruitDataAllwork(List<AiMatchingRecommendationModel> recruitDataAllwork) {
		this.recruitDataAllwork = recruitDataAllwork;
	}
	/**
	 * @return the recruitDataWorknet
	 */
	public List<AiMatchingRecommendationModel> getRecruitDataWorknet() {
		return recruitDataWorknet;
	}
	/**
	 * @param recruitDataWorknet the recruitDataWorknet to set
	 */
	public void setRecruitDataWorknet(List<AiMatchingRecommendationModel> recruitDataWorknet) {
		this.recruitDataWorknet = recruitDataWorknet;
	}
	/**
	 * @return the resumeDataAllwork
	 */
	public List<AiMatchingRecommendationModel> getResumeDataAllwork() {
		return resumeDataAllwork;
	}
	/**
	 * @param resumeDataAllwork the resumeDataAllwork to set
	 */
	public void setResumeDataAllwork(List<AiMatchingRecommendationModel> resumeDataAllwork) {
		this.resumeDataAllwork = resumeDataAllwork;
	}
}
