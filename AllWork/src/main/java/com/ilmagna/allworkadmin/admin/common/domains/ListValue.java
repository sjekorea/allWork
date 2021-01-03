package com.ilmagna.allworkadmin.admin.common.domains;

public class ListValue {
	private String value;
	private String label;
	private String etc;

	public ListValue() {

	}

	public ListValue(String value) {
		this.value = value;
		this.label = value;
	}

	public ListValue(String value, String label) {
		this.value = value;
		this.label = label;
	}

	public ListValue(String value, String label, String etc) {
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

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

}
