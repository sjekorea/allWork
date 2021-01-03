package com.ilmagna.allworkadmin.admin.common;

public  class ListItemLong {
	protected Long value;
	protected String label;
	
	public ListItemLong() {
		value = 0L;
		label = "";
	}
	
	public ListItemLong(Long value, String label) {
		this.value = value;
		this.label = label;
	}
	
	public static String getLabel(Long value) { return ""; };
}