package com.ilmagna.allworkadmin.api.domains;

import java.io.Serializable;
import java.util.List;

import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;

public class ApiRecruitProgressModel extends ApiJqGridParams implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private Integer id;
	private String strReg;
	private String prs;
	private Integer item_id;
	private Integer company_id;
	private String recruit_progress_contents;
	private String strDateWork;
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
	 * @return the item_id
	 */
	public Integer getItem_id() {
		return item_id;
	}
	/**
	 * @param item_id the item_id to set
	 */
	public void setItem_id(Integer item_id) {
		this.item_id = item_id;
	}
	/**
	 * @return the company_id
	 */
	public Integer getCompany_id() {
		return company_id;
	}
	/**
	 * @param company_id the company_id to set
	 */
	public void setCompany_id(Integer company_id) {
		this.company_id = company_id;
	}
	/**
	 * @return the recruit_progress_contents
	 */
	public String getRecruit_progress_contents() {
		return recruit_progress_contents;
	}
	/**
	 * @param recruit_progress_contents the recruit_progress_contents to set
	 */
	public void setRecruit_progress_contents(String recruit_progress_contents) {
		this.recruit_progress_contents = recruit_progress_contents;
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
