package com.ilmagna.allworkadmin.api.common;

import java.util.List;

import org.apache.commons.lang.StringUtils;

public class ApiJqGridParams {
	private int total;			
	private int rows = 10;			
	private int page;			
	private String keyword;		
	private int offset;
	private int startIdx;
	private int endIdx;
	private String pagerEnableYn = "Y";
	private int totalPage;
	private List<String> colNames;
	private List<String> colModels;
	
	private String systemId;
	private String start;
	private String end;
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getOffset() {
		return offset;
	}
	
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public int getStartIdx() {
		return startIdx;
	}
	public void setStartIdx(int startIdx) {
		this.startIdx = startIdx;
	}
	public int getEndIdx() {
		return endIdx;
	}
	public void setEndIdx(int endIdx) {
		this.endIdx = endIdx;
	}
	public String getPagerEnableYn() {
		return pagerEnableYn;
	}
	public void setPagerEnableYn(String pagerEnableYn) {
		this.pagerEnableYn = pagerEnableYn;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<String> getColNames() {
		return colNames;
	}
	public void setColNames(List<String> colNames) {
		this.colNames = colNames;
	}
	public List<String> getColModels() {
		return colModels;
	}
	public void setColModels(List<String> colModels) {
		this.colModels = colModels;
	}
	
	public String getSystemId() {
		return systemId;
	}
	public void setSystemId(String systemId) {
		this.systemId = systemId;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	
	public void calOffsetValue(int totalRows) {
		if (StringUtils.equalsIgnoreCase(this.pagerEnableYn, "Y")) {
			this.offset = (page - 1) * this.rows;
			this.startIdx = this.offset;
			this.endIdx = this.rows;
			this.totalPage = (totalRows / this.rows) + ((totalRows % this.rows != 0) ? 1 : 0);
		} else {
			this.offset = 1;
			this.startIdx = this.offset;
			this.endIdx = totalRows;
			this.totalPage = 1;			
		}
	}
	public void calOffsetValue(String pagerEnableYn) {
		this.offset = (page - 1) * this.rows;
		this.startIdx = this.offset;
		this.endIdx = this.rows;
		this.pagerEnableYn = pagerEnableYn;
	}
}