package com.ilmagna.allworkadmin.migration.domains;

import java.io.Serializable;

import org.json.simple.JSONObject;

import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;

public class ResumeEducationItemModel extends ApiJqGridParams implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private Integer id;
	private String school;			//학교
	private String lesson;			//전공
	private String lesson2;			//학과
	private String lesson_sdate;	//입학년도
	private String lesson_sdate2;	//입학월
	private String lesson_edate;	//졸업년도.
	private String lesson_edate2;	//졸업월
	private String school2;			//학위
	private String strDegree;
	private String lesson_state;	//상태 - 졸업, 수료, ...
	private String strState;
	
	
	/*
	 * 데이터 마이그레이션 - JSON 문자열로 변환.
	 */
	@SuppressWarnings("unchecked")
	public JSONObject getJsonObject() {
		JSONObject obj = new JSONObject();
		try {
			//데이터 마이그레이션을 위한 JSON 개체 구성.
			obj.put("id", id);
			obj.put("school", school);
			obj.put("lesson", lesson);
			obj.put("lesson2", lesson2);
			obj.put("lesson_sdate", lesson_sdate);
			obj.put("lesson_sdate2", lesson_sdate2);
			obj.put("lesson_edate", lesson_edate);
			obj.put("lesson_edate2", lesson_edate2);
			obj.put("school2", school2);
			obj.put("strDegree", strDegree);
			obj.put("lesson_state", lesson_state);
			obj.put("strState", strState);
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
			
			String school = (String) jsonObject.get("school");
			this.setSchool(school);
			
			String lesson = (String) jsonObject.get("lesson");
			this.setLesson(lesson);
			
			String lesson2 = (String) jsonObject.get("lesson2");
			this.setLesson2(lesson2);
			
			String lesson_sdate = (String) jsonObject.get("lesson_sdate");
			this.setLesson_sdate(lesson_sdate);
			
			String lesson_sdate2 = (String) jsonObject.get("lesson_sdate2");
			this.setLesson_sdate2(lesson_sdate2);
			
			String lesson_edate = (String) jsonObject.get("lesson_edate");
			this.setLesson_edate(lesson_edate);
			
			String lesson_edate2 = (String) jsonObject.get("lesson_edate2");
			this.setLesson_edate2(lesson_edate2);
			
			String school2 = (String) jsonObject.get("school2");
			this.setSchool2(school2);
			
			String strDegree = (String) jsonObject.get("strDegree");
			this.setStrDegree(strDegree);
			
			String lesson_state = (String) jsonObject.get("lesson_state");
			this.setLesson_state(lesson_state);
			
			String strState = (String) jsonObject.get("strState");
			this.setStrState(strState);
 
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
	 * @return the school
	 */
	public String getSchool() {
		return school;
	}
	/**
	 * @param school the school to set
	 */
	public void setSchool(String school) {
		this.school = school;
	}
	/**
	 * @return the lesson
	 */
	public String getLesson() {
		return lesson;
	}
	/**
	 * @param lesson the lesson to set
	 */
	public void setLesson(String lesson) {
		this.lesson = lesson;
	}
	/**
	 * @return the lesson2
	 */
	public String getLesson2() {
		return lesson2;
	}
	/**
	 * @param lesson2 the lesson2 to set
	 */
	public void setLesson2(String lesson2) {
		this.lesson2 = lesson2;
	}
	/**
	 * @return the lesson_sdate
	 */
	public String getLesson_sdate() {
		return lesson_sdate;
	}
	/**
	 * @param lesson_sdate the lesson_sdate to set
	 */
	public void setLesson_sdate(String lesson_sdate) {
		this.lesson_sdate = lesson_sdate;
	}
	/**
	 * @return the lesson_sdate2
	 */
	public String getLesson_sdate2() {
		return lesson_sdate2;
	}
	/**
	 * @param lesson_sdate2 the lesson_sdate2 to set
	 */
	public void setLesson_sdate2(String lesson_sdate2) {
		this.lesson_sdate2 = lesson_sdate2;
	}
	/**
	 * @return the lesson_edate
	 */
	public String getLesson_edate() {
		return lesson_edate;
	}
	/**
	 * @param lesson_edate the lesson_edate to set
	 */
	public void setLesson_edate(String lesson_edate) {
		this.lesson_edate = lesson_edate;
	}
	/**
	 * @return the lesson_edate2
	 */
	public String getLesson_edate2() {
		return lesson_edate2;
	}
	/**
	 * @param lesson_edate2 the lesson_edate2 to set
	 */
	public void setLesson_edate2(String lesson_edate2) {
		this.lesson_edate2 = lesson_edate2;
	}
	/**
	 * @return the school2
	 */
	public String getSchool2() {
		return school2;
	}
	/**
	 * @param school2 the school2 to set
	 */
	public void setSchool2(String school2) {
		this.school2 = school2;
	}
	/**
	 * @return the strDegree
	 */
	public String getStrDegree() {
		return strDegree;
	}
	/**
	 * @param strDegree the strDegree to set
	 */
	public void setStrDegree(String strDegree) {
		this.strDegree = strDegree;
	}
	/**
	 * @return the strState
	 */
	public String getStrState() {
		return strState;
	}
	/**
	 * @param strState the strState to set
	 */
	public void setStrState(String strState) {
		this.strState = strState;
	}
	/**
	 * @return the lesson_state
	 */
	public String getLesson_state() {
		return lesson_state;
	}
	/**
	 * @param lesson_state the lesson_state to set
	 */
	public void setLesson_state(String lesson_state) {
		this.lesson_state = lesson_state;
	}
}
