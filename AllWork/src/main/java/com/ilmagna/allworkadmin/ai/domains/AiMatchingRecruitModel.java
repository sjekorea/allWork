/*
 * 기업회원 맞춤형 채용정보.
 */
package com.ilmagna.allworkadmin.ai.domains;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;
import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;
import com.ilmagna.allworkadmin.api.services.ApiCategoryService;

public class AiMatchingRecruitModel extends ApiJqGridParams implements Serializable  {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private Integer id;
	private String	uid;						//채용정보를 등록한 사용자 ID.
	private Integer	recruitId;					//채용정보 ID.
	private String	strWdate;					//등록시각.
	private String	recommendList01;			//맞춤형 인력정보 - 학습이전.
	private String	recommendList02;			//맞춤형 인력정보 - 학습이후.

	private String	bizName;					//회사명
	private String	bizTitle;					//공고제목


	private List<AiMatchingRecommendationModel> data;	//맞춤형 인력정보- recommendList01 또는 recommend_list_02에 대한 Java Object.

	private List<Integer> ids;
	private String sidx;	//sorting field.
	private String sord;	//asc 또는 desc
	private String showAll;

	
	public AiMatchingRecruitModel() {
		this.id	= 0;
		this.uid	= "";						//채용정보를 등록한 사용자 ID.
		this.recruitId	= 0;					//채용정보 ID.
		this.strWdate	= "";					//등록시각.
		this.recommendList01	= "";			//맞춤형 인력정보 - 학습이전.
		this.recommendList02	= "";			//맞춤형 인력정보 - 학습이후.

		this.bizName	= "";					//회사명
		this.bizTitle	= "";					//공고제목

		this.data = new ArrayList<AiMatchingRecommendationModel>();	//맞춤형 인력정보- recommendList01 또는 recommend_list_02에 대한 Java Object.
	}

	
	
	public List<AiMatchingRecommendationModel> parseJsonString(ApiCategoryService categoryService) {
		try {
			//데이터 초기화.
			this.data = new ArrayList<AiMatchingRecommendationModel>();
			
			//입력 데이터 검증.
			String strData = this.recommendList02;
			if (ApiCommonUtils.isNullOrEmpty(strData))	strData = this.recommendList01;
			if (ApiCommonUtils.isNullOrEmpty(strData)) return this.data;
			
			//JSON 문자열을 Java Object로 변환.
			JSONParser parser = new JSONParser();
			
			JSONObject jsonObject = (JSONObject) parser.parse(strData);
			
			this.data = new ArrayList<AiMatchingRecommendationModel>();
			JSONArray data = (JSONArray) jsonObject.get("recommend_list");
			if (data == null) return this.data;
			for (int i = 0; i < data.size(); i++) {
				JSONObject obj = (JSONObject) data.get(i);

				AiMatchingRecommendationModel dataItem = new AiMatchingRecommendationModel();
				dataItem.parseJsonObj(categoryService, obj);
				if (ApiCommonUtils.isNullOrEmpty(dataItem.getRecommend_id())) continue;

				dataItem.setId(i);
				this.data.add(dataItem);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return this.data;
	}




	
	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}



	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}



	/**
	 * @return the uid
	 */
	public String getUid() {
		return uid;
	}



	/**
	 * @param uid the uid to set
	 */
	public void setUid(String uid) {
		this.uid = uid;
	}



	/**
	 * @return the recruitId
	 */
	public Integer getRecruitId() {
		return recruitId;
	}



	/**
	 * @param recruitId the recruitId to set
	 */
	public void setRecruitId(Integer recruitId) {
		this.recruitId = recruitId;
	}



	/**
	 * @return the strWdate
	 */
	public String getStrWdate() {
		return strWdate;
	}



	/**
	 * @param strWdate the strWdate to set
	 */
	public void setStrWdate(String strWdate) {
		this.strWdate = strWdate;
	}



	/**
	 * @return the recommendList01
	 */
	public String getRecommendList01() {
		return recommendList01;
	}



	/**
	 * @param recommendList01 the recommendList01 to set
	 */
	public void setRecommendList01(String recommendList01) {
		this.recommendList01 = recommendList01;
	}



	/**
	 * @return the recommendList02
	 */
	public String getRecommendList02() {
		return recommendList02;
	}



	/**
	 * @param recommendList02 the recommendList02 to set
	 */
	public void setRecommendList02(String recommendList02) {
		this.recommendList02 = recommendList02;
	}



	/**
	 * @return the bizName
	 */
	public String getBizName() {
		return bizName;
	}



	/**
	 * @param bizName the bizName to set
	 */
	public void setBizName(String bizName) {
		this.bizName = bizName;
	}



	/**
	 * @return the bizTitle
	 */
	public String getBizTitle() {
		return bizTitle;
	}



	/**
	 * @param bizTitle the bizTitle to set
	 */
	public void setBizTitle(String bizTitle) {
		this.bizTitle = bizTitle;
	}



	/**
	 * @return the data
	 */
	public List<AiMatchingRecommendationModel> getData() {
		return data;
	}



	/**
	 * @param data the data to set
	 */
	public void setData(List<AiMatchingRecommendationModel> data) {
		this.data = data;
	}



	/**
	 * @return the ids
	 */
	public List<Integer> getIds() {
		return ids;
	}



	/**
	 * @param ids the ids to set
	 */
	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}



	/**
	 * @return the sidx
	 */
	public String getSidx() {
		return sidx;
	}



	/**
	 * @param sidx the sidx to set
	 */
	public void setSidx(String sidx) {
		this.sidx = sidx;
	}



	/**
	 * @return the sord
	 */
	public String getSord() {
		return sord;
	}



	/**
	 * @param sord the sord to set
	 */
	public void setSord(String sord) {
		this.sord = sord;
	}



	/**
	 * @return the showAll
	 */
	public String getShowAll() {
		return showAll;
	}



	/**
	 * @param showAll the showAll to set
	 */
	public void setShowAll(String showAll) {
		this.showAll = showAll;
	}




	
}
