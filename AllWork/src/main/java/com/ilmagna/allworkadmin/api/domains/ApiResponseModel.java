package com.ilmagna.allworkadmin.api.domains;

import java.io.Serializable;

public class ApiResponseModel implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private ApiResponseHeaderModel meta;
	private ApiResponseBodyModel data;
	
	public ApiResponseHeaderModel getMeta() {
		return meta;
	}
	public void setMeta(ApiResponseHeaderModel meta) {
		this.meta = meta;
	}
	
	public ApiResponseBodyModel getData() {
		return data;
	}
	public void setData(ApiResponseBodyModel data) {
		this.data = data;
	}
}
