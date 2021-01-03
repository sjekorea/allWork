package com.ilmagna.allworkadmin.migration.domains;

import java.io.Serializable;

import org.json.simple.JSONObject;

import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;

public class ResumeCareerItemModel extends ApiJqGridParams implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private Integer id;
	private String company;			//회사
	private String business;		//담당업무
	private String hold_sdate;		//입사년도
	private String hold_sdate2;		//입사월
	private String hold_edate;		//퇴사년도.
	private String hold_edate2;		//퇴사월
	
	
	/*
	 * 데이터 마이그레이션 - JSON 문자열로 변환.
	 */
	@SuppressWarnings("unchecked")
	public JSONObject getJsonObject() {
		JSONObject obj = new JSONObject();
		try {
			//데이터 마이그레이션을 위한 JSON 개체 구성.
			obj.put("id", id);
			obj.put("company", company);
			obj.put("business", business);
			obj.put("hold_sdate", hold_sdate);
			obj.put("hold_sdate2", hold_sdate2);
			obj.put("hold_edate", hold_edate);
			obj.put("hold_edate2", hold_edate2);
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
			
			String company = (String) jsonObject.get("company");
			this.setCompany(company);
			
			String business = (String) jsonObject.get("business");
			this.setBusiness(business);
			
			String hold_sdate = (String) jsonObject.get("hold_sdate");
			this.setHold_sdate(hold_sdate);
			
			String hold_sdate2 = (String) jsonObject.get("hold_sdate2");
			this.setHold_sdate2(hold_sdate2);
			
			String hold_edate = (String) jsonObject.get("hold_edate");
			this.setHold_edate(hold_edate);
			
			String hold_edate2 = (String) jsonObject.get("hold_edate2");
			this.setHold_edate2(hold_edate2);
 
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
	 * @return the company
	 */
	public String getCompany() {
		return company;
	}
	/**
	 * @param company the company to set
	 */
	public void setCompany(String company) {
		this.company = company;
	}
	/**
	 * @return the business
	 */
	public String getBusiness() {
		return business;
	}
	/**
	 * @param business the business to set
	 */
	public void setBusiness(String business) {
		this.business = business;
	}
	/**
	 * @return the hold_sdate
	 */
	public String getHold_sdate() {
		return hold_sdate;
	}
	/**
	 * @param hold_sdate the hold_sdate to set
	 */
	public void setHold_sdate(String hold_sdate) {
		this.hold_sdate = hold_sdate;
	}
	/**
	 * @return the hold_sdate2
	 */
	public String getHold_sdate2() {
		return hold_sdate2;
	}
	/**
	 * @param hold_sdate2 the hold_sdate2 to set
	 */
	public void setHold_sdate2(String hold_sdate2) {
		this.hold_sdate2 = hold_sdate2;
	}
	/**
	 * @return the hold_edate
	 */
	public String getHold_edate() {
		return hold_edate;
	}
	/**
	 * @param hold_edate the hold_edate to set
	 */
	public void setHold_edate(String hold_edate) {
		this.hold_edate = hold_edate;
	}
	/**
	 * @return the hold_edate2
	 */
	public String getHold_edate2() {
		return hold_edate2;
	}
	/**
	 * @param hold_edate2 the hold_edate2 to set
	 */
	public void setHold_edate2(String hold_edate2) {
		this.hold_edate2 = hold_edate2;
	}
}
