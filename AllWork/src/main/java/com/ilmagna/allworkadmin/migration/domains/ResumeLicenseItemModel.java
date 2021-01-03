package com.ilmagna.allworkadmin.migration.domains;

import java.io.Serializable;

import org.json.simple.JSONObject;

import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;

public class ResumeLicenseItemModel extends ApiJqGridParams implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private Integer id;
	private String qualification;	//자격증
	private String public_place;	//발행처
	private String obtain_date;		//취득일자
	
	
	/*
	 * 데이터 마이그레이션 - JSON 문자열로 변환.
	 */
	@SuppressWarnings("unchecked")
	public JSONObject getJsonObject() {
		JSONObject obj = new JSONObject();
		try {
			//데이터 마이그레이션을 위한 JSON 개체 구성.
			obj.put("id", id);
			obj.put("qualification", qualification);
			obj.put("public_place", public_place);
			obj.put("obtain_date", obtain_date);
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
			
			String qualification = (String) jsonObject.get("qualification");
			this.setQualification(qualification);
			
			String public_place = (String) jsonObject.get("public_place");
			this.setPublic_place(public_place);
			
			String obtain_date = (String) jsonObject.get("obtain_date");
			this.setObtain_date(obtain_date);
 
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
	 * @return the qualification
	 */
	public String getQualification() {
		return qualification;
	}
	/**
	 * @param qualification the qualification to set
	 */
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	/**
	 * @return the public_place
	 */
	public String getPublic_place() {
		return public_place;
	}
	/**
	 * @param public_place the public_place to set
	 */
	public void setPublic_place(String public_place) {
		this.public_place = public_place;
	}
	/**
	 * @return the obtain_date
	 */
	public String getObtain_date() {
		return obtain_date;
	}
	/**
	 * @param obtain_date the obtain_date to set
	 */
	public void setObtain_date(String obtain_date) {
		this.obtain_date = obtain_date;
	}
}
