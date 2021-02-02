package com.ilmagna.allworkadmin.api.common;


public class ApiConvertorUtil {
	
	
	public static String getBizEndDay(String strBizIng, String strBizType, String strBizDay) {
		String strEdate = "";
		if (!strBizIng.equalsIgnoreCase("yes")) return "채용마감";

		//채용마감일 등록.
		if (strBizType.equalsIgnoreCase("get"))			strEdate = "채용시까지";
		else if (strBizType.equalsIgnoreCase("often"))	strEdate = "상시채용";
		//else if (strBizType.equalsIgnoreCase("input"))	strEdate = strBizDay;
		else 											strEdate = strBizDay;
		
		return strEdate;
	}

	public static String getSex(String sex) {
		String strSex = "";
		if (ApiCommonUtils.isNullOrEmpty(sex))	return strSex;
		if (sex.compareToIgnoreCase("man") == 0) strSex = "남";
		else if (sex.compareToIgnoreCase("woman") == 0) strSex = "여";

		return strSex;
	}
}