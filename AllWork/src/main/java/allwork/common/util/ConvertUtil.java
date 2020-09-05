package allwork.common.util;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;


public class ConvertUtil {
	
	public static String checkNull(String arg){
		String rtnStr = "";
		if(arg == null || "".equals(arg) || "null".equals(arg) || "NULL".equals(arg)){
			rtnStr = "";
		}else{
			rtnStr = arg;
		}
		return rtnStr;
	}
	
	public static Object checkNull(Object arg){
		Object rtnStr = new Object();
		if(arg == null || "".equals(arg.toString())){
			rtnStr = "";
		}else{
			rtnStr = arg;
		}
		return rtnStr;
	}
	
	public static String checkNullToStr(Object arg){
		String rtnStr = "";
		if(arg == null || "".equals(arg.toString())){
			rtnStr = "";
		}else{
			rtnStr = (String)arg;
		}
		return rtnStr;
	}
	
	public static int checkNullToInt(String arg){
		int rtnNum = 0;
		
		if(arg == null || "".equals(arg) || "null".equals(arg) || "NULL".equals(arg)){
			rtnNum = 0;
		}else{
			rtnNum = Integer.parseInt(arg);
		}
		return rtnNum;
	}
	
	public static Map<String, Object> checkMapNull(Map<String, Object> arg){
		Map<String, Object> rtnObj = new HashMap<String, Object>();
		if(arg != null){
			rtnObj = arg;
		}
		return rtnObj;
	}
	
	public static String fillZero(int arg){
		
		String tmpStr = String.valueOf(arg);
		if(tmpStr.length() == 1){
			tmpStr = "0"+tmpStr;
		}
		return tmpStr;
	}
	
	public static Map<String, Object> converObjectToMap(Object obj){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		try {

			if(obj != null){
				Field[] fields = obj.getClass().getDeclaredFields();
				
				for(int i=0; i<= fields.length-1;i++){
					fields[i].setAccessible(true);
					resultMap.put(fields[i].getName(), fields[i].get(obj));
				}
			}
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return resultMap;
	}
	
	public static String convertEnterToBr(String arg){
		return arg.replaceAll("(\r\n|\r|\n|\n\r)", "<br/>");
	}
	
	public static String convertEnterToSpace(String arg){
		return arg.replaceAll("(\r\n|\r|\n|\n\r)", "");
	}
	
	public static String convertBrToEnter(String arg){
		return arg.replaceAll("<br/>", "\r\n");
	}
	
	public static String convertQueryQuotes(String org){

		int pos = -2;
		while((pos = org.indexOf("\"", pos + 2)) != -1){
			String left = org.substring(0, pos);
			String right = org.substring(pos, org.length());
			org = left + "\\" + right;
		}
		pos = -2;
		while((pos = org.indexOf("\'", pos + 2)) != -1){
			String left = org.substring(0, pos);
			String right = org.substring(pos, org.length());
			org = left + "\\" + right;
		}
		
		return org;		
	}
	
	public static String convertJsonStringSpecialChar(String jsonString){
		jsonString.replaceAll("\"", "\\\"");
		jsonString.replaceAll("\u0027", "\\\'");
		jsonString.replaceAll("\u003d", "=");
		return jsonString;
	}
	
}
