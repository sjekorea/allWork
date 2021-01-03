package com.ilmagna.allworkadmin.admin.common.domains;

import java.util.List;
import java.util.Map;

public class ListValues {
	protected Map<ListType, List<ListValue>> resultData;
	protected String resultCode;

	public Map<ListType, List<ListValue>> getResultData() {
		return resultData;
	}

	public void setResultData(Map<ListType, List<ListValue>> resultData) {
		this.resultData = resultData;
	}

	public String getResultCode() {
		return resultCode;
	}

	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}
}
