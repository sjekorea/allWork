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
	private Integer birth_year;			// 출생년도
	private String sex;					// 성별 - man, woman
	private String strSex;
	private String schooling;			// 최종학력.
	private String career_main;			// 보유기술
	private String work_area;			// 희망근무지.
	private String strRegDate;
	private String memo;

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
	 * @return the birth_year
	 */
	public Integer getBirth_year() {
		return birth_year;
	}
	/**
	 * @param birth_year the birth_year to set
	 */
	public void setBirth_year(Integer birth_year) {
		this.birth_year = birth_year;
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
	 * @return the career_main
	 */
	public String getCareer_main() {
		return career_main;
	}
	/**
	 * @param career_main the career_main to set
	 */
	public void setCareer_main(String career_main) {
		this.career_main = career_main;
	}
	/**
	 * @return the work_area
	 */
	public String getWork_area() {
		return work_area;
	}
	/**
	 * @param work_area the work_area to set
	 */
	public void setWork_area(String work_area) {
		this.work_area = work_area;
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
