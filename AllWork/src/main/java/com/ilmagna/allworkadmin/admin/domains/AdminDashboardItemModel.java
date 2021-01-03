package com.ilmagna.allworkadmin.admin.domains;

import java.io.Serializable;

import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;

public class AdminDashboardItemModel extends ApiJqGridParams implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private Integer id;
	private Integer recruit_count;		//채용공고 등록회수.
	private Integer resume_count;		//이력서 등록회수.
	private Integer member_count;		//회원 등록회수.
	private Integer bbs_count;			//게시판 등록회수.
	
	public AdminDashboardItemModel() {
		this.id = 0;
		this.recruit_count = 0;			//채용공고 등록회수.
		this.resume_count = 0;			//이력서 등록회수.
		this.member_count = 0;			//회원 등록회수.
		this.bbs_count = 0;				//게시판 등록회수.
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
	 * @return the recruit_count
	 */
	public Integer getRecruit_count() {
		return recruit_count;
	}
	/**
	 * @param recruit_count the recruit_count to set
	 */
	public void setRecruit_count(Integer recruit_count) {
		this.recruit_count = recruit_count;
	}
	/**
	 * @return the resume_count
	 */
	public Integer getResume_count() {
		return resume_count;
	}
	/**
	 * @param resume_count the resume_count to set
	 */
	public void setResume_count(Integer resume_count) {
		this.resume_count = resume_count;
	}
	/**
	 * @return the member_count
	 */
	public Integer getMember_count() {
		return member_count;
	}
	/**
	 * @param member_count the member_count to set
	 */
	public void setMember_count(Integer member_count) {
		this.member_count = member_count;
	}
	/**
	 * @return the bbs_count
	 */
	public Integer getBbs_count() {
		return bbs_count;
	}
	/**
	 * @param bbs_count the bbs_count to set
	 */
	public void setBbs_count(Integer bbs_count) {
		this.bbs_count = bbs_count;
	}
}
