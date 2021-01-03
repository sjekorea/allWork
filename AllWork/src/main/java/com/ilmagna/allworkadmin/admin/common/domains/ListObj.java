package com.ilmagna.allworkadmin.admin.common.domains;

public class ListObj {
	private String value;
	private String label;
	private Object etc;

	public ListObj() {

	}

	public ListObj(String value) {
		this.value = value;
		this.label = value;
	}

	public ListObj(String value, String label) {
		this.value = value;
		this.label = label;
	}

	public ListObj(String value, String label, Object etc) {
		this.value = value;
		this.label = label;
		this.etc = etc;
	}
	
	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public Object getEtc() {
		return etc;
	}

	public void setEtc(Object etc) {
		this.etc = etc;
	}

}
