package com.ilmagna.allworkadmin.admin.common.domains;

import java.util.List;

public class InputParam {
	private SelectReq selectReq;
	private List<String> codes;
	
	public SelectReq getSelectReq() {
		return selectReq;
	}
	public void setSelectReq(SelectReq selectReq) {
		this.selectReq = selectReq;
	}
	public List<String> getCodes() {
		return codes;
	}
	public void setCodes(List<String> codes) {
		this.codes = codes;
	}
}