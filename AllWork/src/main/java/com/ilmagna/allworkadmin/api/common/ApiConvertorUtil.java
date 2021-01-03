package com.ilmagna.allworkadmin.api.common;


public class ApiConvertorUtil {
	
	public static String getSex(String sex) {
		String strSex = "";
		if (sex.compareToIgnoreCase("man") == 0) strSex = "남";
		else if (sex.compareToIgnoreCase("woman") == 0) strSex = "여";

		return strSex;
	}
}