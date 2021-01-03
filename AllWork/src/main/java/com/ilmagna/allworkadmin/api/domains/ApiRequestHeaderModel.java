package com.ilmagna.allworkadmin.api.domains;

import java.io.Serializable;

public class ApiRequestHeaderModel implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private String	key;						// 인증키
	private Integer type;						// 0 = 수시전송(디폴트), 1 = 일마감 전송, 2 = 매입데이터 전송
	private Integer action;						// 0= add (default), 1=update
	private Integer total;						// 전체 데이터의 개수
	private Integer start;						// 데이터의 시작 index
	private Integer count;						// 전송하는 데이터의 개수

	private String sidx;						// sorting field.
	private String sord;						// asc 또는 desc

	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getAction() {
		return action;
	}
	public void setAction(Integer action) {
		this.action = action;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	
	public String getSidx() {
		return sidx;
	}
	public void setSidx(String sidx) {
		this.sidx = sidx;
	}
	public String getSord() {
		return sord;
	}
	public void setSord(String sord) {
		this.sord = sord;
	}
}
