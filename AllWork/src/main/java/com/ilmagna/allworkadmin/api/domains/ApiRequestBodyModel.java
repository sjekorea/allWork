package com.ilmagna.allworkadmin.api.domains;

import java.io.Serializable;

public class ApiRequestBodyModel implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private Integer id;

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
}
