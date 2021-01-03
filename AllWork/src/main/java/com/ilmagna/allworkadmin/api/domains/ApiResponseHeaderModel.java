package com.ilmagna.allworkadmin.api.domains;

import java.io.Serializable;

public class ApiResponseHeaderModel implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private boolean	result;						// 작업처리 결과(true or false) - true = 성공, false = 실패.
	private Integer	result_code;				// 0~100 : 성공 관련 코드값, 101~ : 실패 관련 코드값
	private String	result_msg;					// 작업과 관련한 상세 메시지 또는 오류 메시지.
	private String	result_value;				// reserved.
	
	private Integer total;						// 전체 데이터의 개수
	private Integer start;						// 데이터의 시작 index
	private Integer count;						// 전송하는 데이터의 개수

	private String sidx;						// sorting field.
	private String sord;						// asc 또는 desc
	
	public	ApiResponseHeaderModel() {
		result = false;							// 작업처리 결과(true or false) - true = 성공, false = 실패.
		result_code = 0;						// 0~100 : 성공 관련 코드값, 101~ : 실패 관련 코드값
		result_msg = ".";						// 작업과 관련한 상세 메시지 또는 오류 메시지.
		result_value = "";						// reserved.
		
		total = 0;								// 전체 데이터의 개수
		start = 0;								// 데이터의 시작 index
		count = 0;								// 전송하는 데이터의 개수

		sidx = "";								// sorting field.
		sord = "";								// asc 또는 desc
	}

	public boolean isResult() {
		return result;
	}
	public void setResult(boolean result) {
		this.result = result;
	}
	public Integer getResult_code() {
		return result_code;
	}
	public void setResult_code(Integer result_code) {
		this.result_code = result_code;
	}
	public String getResult_msg() {
		return result_msg;
	}
	public void setResult_msg(String result_msg) {
		this.result_msg = result_msg;
	}
	public String getResult_value() {
		return result_value;
	}
	public void setResult_value(String result_value) {
		this.result_value = result_value;
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
