package com.ilmagna.allworkadmin.migration.domains;

import java.io.Serializable;

import org.json.simple.JSONObject;

import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;

public class ResumeLanguageItemModel extends ApiJqGridParams implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private Integer id;
	private String language;			//외국어
	private String level;				//수준
	private String examination;			//공인시험
	private String point;				//점수
	private String ex_obtain_date;		//취득일자
	
	
	/*
	 * 데이터 마이그레이션 - JSON 문자열로 변환.
	 */
	@SuppressWarnings("unchecked")
	public JSONObject getJsonObject() {
		JSONObject obj = new JSONObject();
		try {
			//데이터 마이그레이션을 위한 JSON 개체 구성.
			obj.put("id", id);
			obj.put("language", language);
			obj.put("level", level);
			obj.put("examination", examination);
			obj.put("point", point);
			obj.put("ex_obtain_date", ex_obtain_date);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return obj;
	}

	public boolean parseJsonObj(JSONObject jsonObject) {
		boolean bResult = false;
		try {
			if (jsonObject == null) return bResult;
			
			//JSONObject를 Java Object로 변환.
			Integer id = Integer.parseInt(String.valueOf((Long) jsonObject.get("id")));
			this.setId(id);
			
			String language = (String) jsonObject.get("language");
			this.setLanguage(language);
			
			String level = (String) jsonObject.get("level");
			this.setLevel(level);
			
			String examination = (String) jsonObject.get("examination");
			this.setExamination(examination);
			
			String point = (String) jsonObject.get("point");
			this.setPoint(point);
			
			String ex_obtain_date = (String) jsonObject.get("ex_obtain_date");
			this.setEx_obtain_date(ex_obtain_date);
 
			//작업결과 등록.
			bResult = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bResult;
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
	 * @return the language
	 */
	public String getLanguage() {
		return language;
	}
	/**
	 * @param language the language to set
	 */
	public void setLanguage(String language) {
		this.language = language;
	}
	/**
	 * @return the level
	 */
	public String getLevel() {
		return level;
	}
	/**
	 * @param level the level to set
	 */
	public void setLevel(String level) {
		this.level = level;
	}
	/**
	 * @return the examination
	 */
	public String getExamination() {
		return examination;
	}
	/**
	 * @param examination the examination to set
	 */
	public void setExamination(String examination) {
		this.examination = examination;
	}
	/**
	 * @return the point
	 */
	public String getPoint() {
		return point;
	}
	/**
	 * @param point the point to set
	 */
	public void setPoint(String point) {
		this.point = point;
	}
	/**
	 * @return the ex_obtain_date
	 */
	public String getEx_obtain_date() {
		return ex_obtain_date;
	}
	/**
	 * @param ex_obtain_date the ex_obtain_date to set
	 */
	public void setEx_obtain_date(String ex_obtain_date) {
		this.ex_obtain_date = ex_obtain_date;
	}
}
