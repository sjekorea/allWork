package com.ilmagna.allworkadmin.admin.domains;

import java.io.Serializable;
import java.util.List;

import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;

public class AdminBbsSetupModel extends ApiJqGridParams implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private Integer id;
	private String boardCode;
	private String code;
	private String pCode;
	private String boardName;
	private String type;
	private String view;

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
	 * @return the boardCode
	 */
	public String getBoardCode() {
		return boardCode;
	}
	/**
	 * @param boardCode the boardCode to set
	 */
	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
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
	 * @return the pCode
	 */
	public String getpCode() {
		return pCode;
	}
	/**
	 * @param pCode the pCode to set
	 */
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	/**
	 * @return the boardName
	 */
	public String getBoardName() {
		return boardName;
	}
	/**
	 * @param boardName the boardName to set
	 */
	public void setBoardName(String boardName) {
		this.boardName = boardName;
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
