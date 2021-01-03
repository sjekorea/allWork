package com.ilmagna.allworkadmin.admin.common;

public  class ListItemInteger {
	protected Integer value;
	protected String label;
	
	public ListItemInteger() {
		value = 0;
		label = "";
	}
	
	public ListItemInteger(Integer value, String label) {
		this.value = value;
		this.label = label;
	}
	
	public static String getLabel(Integer value) { return ""; };
}