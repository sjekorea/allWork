package com.ilmagna.allworkadmin.admin.domains;

import java.io.Serializable;
import java.util.List;

import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;

public class AdminPopupModel extends ApiJqGridParams implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private String id;
	private String code;
	private String subject;
	private String strStartDay;
	private String strEndDay;
	private Integer left;
	private Integer top;
	private Integer width;
	private Integer height;
	private String type;
	private String contents;
	private String view;

	private List<String> ids;
	private String sidx;	//sorting field.
	private String sord;	//asc 또는 desc
	private String showAll;

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the code
	 */
	public String getCode() {
		return code;
	}
	/**
	 * @param code the code to set
	 */
	public void setCode(String code) {
		this.code = code;
	}
	/**
	 * @return the subject
	 */
	public String getSubject() {
		return subject;
	}
	/**
	 * @param subject the subject to set
	 */
	public void setSubject(String subject) {
		this.subject = subject;
	}
	/**
	 * @return the strStartDay
	 */
	public String getStrStartDay() {
		return strStartDay;
	}
	/**
	 * @param strStartDay the strStartDay to set
	 */
	public void setStrStartDay(String strStartDay) {
		this.strStartDay = strStartDay;
	}
	/**
	 * @return the strEndDay
	 */
	public String getStrEndDay() {
		return strEndDay;
	}
	/**
	 * @param strEndDay the strEndDay to set
	 */
	public void setStrEndDay(String strEndDay) {
		this.strEndDay = strEndDay;
	}
	/**
	 * @return the left
	 */
	public Integer getLeft() {
		return left;
	}
	/**
	 * @param left the left to set
	 */
	public void setLeft(Integer left) {
		this.left = left;
	}
	/**
	 * @return the top
	 */
	public Integer getTop() {
		return top;
	}
	/**
	 * @param top the top to set
	 */
	public void setTop(Integer top) {
		this.top = top;
	}
	/**
	 * @return the width
	 */
	public Integer getWidth() {
		return width;
	}
	/**
	 * @param width the width to set
	 */
	public void setWidth(Integer width) {
		this.width = width;
	}
	/**
	 * @return the height
	 */
	public Integer getHeight() {
		return height;
	}
	/**
	 * @param height the height to set
	 */
	public void setHeight(Integer height) {
		this.height = height;
	}
	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}
	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}
	/**
	 * @return the contents
	 */
	public String getContents() {
		return contents;
	}
	/**
	 * @param contents the contents to set
	 */
	public void setContents(String contents) {
		this.contents = contents;
	}
	/**
	 * @return the view
	 */
	public String getView() {
		return view;
	}
	/**
	 * @param view the view to set
	 */
	public void setView(String view) {
		this.view = view;
	}
	/**
	 * @return the ids
	 */
	public List<String> getIds() {
		return ids;
	}
	/**
	 * @param ids the ids to set
	 */
	public void setIds(List<String> ids) {
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
