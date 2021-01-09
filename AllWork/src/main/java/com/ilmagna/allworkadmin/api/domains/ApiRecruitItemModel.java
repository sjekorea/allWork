package com.ilmagna.allworkadmin.api.domains;

import java.io.Serializable;
import java.util.List;

import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;

public class ApiRecruitItemModel extends ApiJqGridParams implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private Integer id;
	private String strReg;
	private String prs;
	private Integer companyId;
	private String men;
	private String placeWork;
	private String recruitContents;
	private String strReqDate;
	private String memo;
	private String strDateWork;
	private String progressContents;
	private String bizEndType;
	private String bizEndDay;

	private String companyTitle;
	private String companyInitial;

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
	 * @return the companyId
	 */
	public Integer getCompanyId() {
		return companyId;
	}
	/**
	 * @param companyId the companyId to set
	 */
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	/**
	 * @return the men
	 */
	public String getMen() {
		return men;
	}
	/**
	 * @param men the men to set
	 */
	public void setMen(String men) {
		this.men = men;
	}
	/**
	 * @return the placeWork
	 */
	public String getPlaceWork() {
		return placeWork;
	}
	/**
	 * @param placeWork the placeWork to set
	 */
	public void setPlaceWork(String placeWork) {
		this.placeWork = placeWork;
	}
	/**
	 * @return the recruitContents
	 */
	public String getRecruitContents() {
		return recruitContents;
	}
	/**
	 * @param recruitContents the recruitContents to set
	 */
	public void setRecruitContents(String recruitContents) {
		this.recruitContents = recruitContents;
	}
	/**
	 * @return the strReqDate
	 */
	public String getStrReqDate() {
		return strReqDate;
	}
	/**
	 * @param strReqDate the strReqDate to set
	 */
	public void setStrReqDate(String strReqDate) {
		this.strReqDate = strReqDate;
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
	 * @return the strDateWork
	 */
	public String getStrDateWork() {
		return strDateWork;
	}
	/**
	 * @param strDateWork the strDateWork to set
	 */
	public void setStrDateWork(String strDateWork) {
		this.strDateWork = strDateWork;
	}
	/**
	 * @return the progressContents
	 */
	public String getProgressContents() {
		return progressContents;
	}
	/**
	 * @param progressContents the progressContents to set
	 */
	public void setProgressContents(String progressContents) {
		this.progressContents = progressContents;
	}
	/**
	 * @return the bizEndType
	 */
	public String getBizEndType() {
		return bizEndType;
	}
	/**
	 * @param bizEndType the bizEndType to set
	 */
	public void setBizEndType(String bizEndType) {
		this.bizEndType = bizEndType;
	}
	/**
	 * @return the bizEndDay
	 */
	public String getBizEndDay() {
		return bizEndDay;
	}
	/**
	 * @param bizEndDay the bizEndDay to set
	 */
	public void setBizEndDay(String bizEndDay) {
		this.bizEndDay = bizEndDay;
	}
	/**
	 * @return the companyTitle
	 */
	public String getCompanyTitle() {
		return companyTitle;
	}
	/**
	 * @param companyTitle the companyTitle to set
	 */
	public void setCompanyTitle(String companyTitle) {
		this.companyTitle = companyTitle;
	}
	/**
	 * @return the companyInitial
	 */
	public String getCompanyInitial() {
		return companyInitial;
	}
	/**
	 * @param companyInitial the companyInitial to set
	 */
	public void setCompanyInitial(String companyInitial) {
		this.companyInitial = companyInitial;
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