package com.ilmagna.allworkadmin.admin.common;

public class ListItemString {
	protected String value;
	protected String label;
	
	public ListItemString() {
		value = "";
		label = "";
	}
	
	public ListItemString(String value, String label) {
		this.value = value;
		this.label = label;
	}
	
	public static String getLabel(String value) { return ""; };
}