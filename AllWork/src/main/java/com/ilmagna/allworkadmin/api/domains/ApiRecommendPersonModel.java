package com.ilmagna.allworkadmin.api.domains;

import java.io.Serializable;
import java.util.List;

import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;

public class ApiRecommendPersonModel extends ApiJqGridParams implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private Integer id;
	private String strReg;
	private String prs;
	private String strBeg;
	private String uid;
	private Integer uno;				// 이력서 ID.
	private String name;				// 이름
	private Integer birthYear;			// 출생년도
	private String sex;					// 성별 - man, woman
	private String strSex;
	private String schooling;			// 최종학력.
	private String careerMain;			// 보유기술
	private String workArea;			// 희망근무지.
	private String strRegDate;
	private String memo;
	private Integer resume_id;			//이력서 ID.

	private String photo;				//사진.
	private String inidSecret;			//이력서 비공개.

	private List<Integer> ids;
	private String sidx;	//sorting field.
	private String sord;	//asc 또는 desc
	private String showAll;

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
	 * @return the strReg
	 */
	public String getStrReg() {
		return strReg;
	}
	/**
	 * @param strReg the strReg to set
	 */
	public void setStrReg(String strReg) {
		this.strReg = strReg;
	}
	/**
	 * @return the prs
	 */
	public String getPrs() {
		return prs;
	}
	/**
	 * @param prs the prs to set
	 */
	public void setPrs(String prs) {
		this.prs = prs;
	}
	/**
	 * @return the strBeg
	 */
	public String getStrBeg() {
		return strBeg;
	}
	/**
	 * @param strBeg the strBeg to set
	 */
	public void setStrBeg(String strBeg) {
		this.strBeg = strBeg;
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
	 * @return the uno
	 */
	public Integer getUno() {
		return uno;
	}
	/**
	 * @param uno the uno to set
	 */
	public void setUno(Integer uno) {
		this.uno = uno;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the birthYear
	 */
	public Integer getBirthYear() {
		return birthYear;
	}
	/**
	 * @param birthYear the birthYear to set
	 */
	public void setBirthYear(Integer birthYear) {
		this.birthYear = birthYear;
	}
	/**
	 * @return the sex
	 */
	public String getSex() {
		return sex;
	}
	/**
	 * @param sex the sex to set
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}
	/**
	 * @return the strSex
	 */
	public String getStrSex() {
		return strSex;
	}
	/**
	 * @param strSex the strSex to set
	 */
	public void setStrSex(String strSex) {
		this.strSex = strSex;
	}
	/**
	 * @return the schooling
	 */
	public String getSchooling() {
		return schooling;
	}
	/**
	 * @param schooling the schooling to set
	 */
	public void setSchooling(String schooling) {
		this.schooling = schooling;
	}
	/**
	 * @return the careerMain
	 */
	public String getCareerMain() {
		return careerMain;
	}
	/**
	 * @param careerMain the careerMain to set
	 */
	public void setCareerMain(String careerMain) {
		this.careerMain = careerMain;
	}
	/**
	 * @return the workArea
	 */
	public String getWorkArea() {
		return workArea;
	}
	/**
	 * @param workArea the workArea to set
	 */
	public void setWorkArea(String workArea) {
		this.workArea = workArea;
	}
	/**
	 * @return the strRegDate
	 */
	public String getStrRegDate() {
		return strRegDate;
	}
	/**
	 * @param strRegDate the strRegDate to set
	 */
	public void setStrRegDate(String strRegDate) {
		this.strRegDate = strRegDate;
	}
	/**
	 * @return the memo
	 */
	public String getMemo() {
		return memo;
	}
	/**
	 * @param memo the memo to set
	 */
	public void setMemo(String memo) {
		this.memo = memo;
	}
	/**
	 * @return the resume_id
	 */
	public Integer getResume_id() {
		return resume_id;
	}
	/**
	 * @param resume_id the resume_id to set
	 */
	public void setResume_id(Integer resume_id) {
		this.resume_id = resume_id;
	}
	/**
	 * @return the photo
	 */
	public String getPhoto() {
		return photo;
	}
	/**
	 * @param photo the photo to set
	 */
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	/**
	 * @return the inidSecret
	 */
	public String getInidSecret() {
		return inidSecret;
	}
	/**
	 * @param inidSecret the inidSecret to set
	 */
	public void setInidSecret(String inidSecret) {
		this.inidSecret = inidSecret;
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
