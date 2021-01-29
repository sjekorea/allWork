package allwork.common.util;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CodingErrorAction;
import java.util.HashMap;
import java.util.Map;

import de.ailis.pherialize.Mixed;


public class ConvertUtil {
	
	public static String checkNull(String arg){
		String rtnStr = "";
		try {
			if(arg == null || "".equals(arg) || "null".equals(arg) || "NULL".equals(arg)){
				rtnStr = "";
			}else{
				rtnStr = arg;
			}
		} catch(Exception e) {
			e.printStackTrace();			
		}
		return rtnStr;
	}
	
	public static Object checkNull(Object arg){
		Object rtnStr = new Object();
		try {
			if(arg == null || "".equals(arg.toString())){
				rtnStr = "";
			}else{
				rtnStr = arg;
			}
		} catch(Exception e) {
			e.printStackTrace();			
		}
		return rtnStr;
	}
	
	public static String checkNullToStr(Object arg){
		String rtnStr = "";
		try {
			if(arg == null || "".equals(arg.toString())){
				rtnStr = "";
			}else{
				rtnStr = (String)arg;
			}
		} catch(Exception e) {
			e.printStackTrace();			
		}
		return rtnStr;
	}
	
	public static int checkNullToInt(String arg){
		int rtnNum = 0;
		try {
			if(arg == null || "".equals(arg) || "null".equals(arg) || "NULL".equals(arg)){
				rtnNum = 0;
			}else{
				rtnNum = Integer.parseInt(arg);
			}
		} catch(Exception e) {
			e.printStackTrace();			
		}
		return rtnNum;
	}
	
	public static Map<String, Object> checkMapNull(Map<String, Object> arg){
		Map<String, Object> rtnObj = new HashMap<String, Object>();
		try {
			if(arg != null){
				rtnObj = arg;
			}
		} catch(Exception e) {
			e.printStackTrace();			
		}
		return rtnObj;
	}
	
	public static String fillZero(int arg){
		
		String tmpStr = String.valueOf(arg);
		try {
			if(tmpStr.length() == 1){
				tmpStr = "0"+tmpStr;
			}
		} catch(Exception e) {
			e.printStackTrace();			
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
		try {
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
		} catch(Exception e) {
			e.printStackTrace();			
		}
		
		return org;		
	}
	
	public static String convertJsonStringSpecialChar(String jsonString){
		jsonString.replaceAll("\"", "\\\"");
		jsonString.replaceAll("\u0027", "\\\'");
		jsonString.replaceAll("\u003d", "=");
		return jsonString;
	}
	
	// Method Name : comp()
	// Description : 제한적으로 보여줘야될 string인 경우 특정 길이 이상이면 [...]로 대체하는 메소드(한글의 경우는 compByte()를 사용해야 됨)
	// Parameter
	//	-- String str : 제한시킬 Data
	//	-- int i : 보여주고자 하는 길이
	// Return Type
	//	-- String : 표시될 data 내용 
	public static String comp(String str, Integer i) {
		if(str==null)	return "";
		String tmp = str;
		try {
			int cutLength = i.intValue();
			if(tmp.length() > cutLength) tmp = tmp.substring(0, cutLength)+"...";
		} catch(Exception e) {
			e.printStackTrace();			
		}
		return tmp;
	}


	// Method Name : compByte()
	// Description : 제한적으로 보여줘야될 string인 경우 특정 길이 이상이면 길이만큼 byte계산하여 보여줘야하지만
	//					  subString 은 한글이 들어있는 문자열을 바이트단위로 끊어주지 않고 글자 수 대로 끊는다.
	//					  이것을 byte 단위로 끊어주는 메소드임. 
	//					  예를 들면 String str = "가나다라", ConvertUtil.compByte(str,4,"..."); 
	//					  결과 : 가나... 
	//					  
	// Parameter
	//	-- String str : 제한시킬 Data
	//	-- int i : 표시하고자 하는 길이
	//	-- String trail : 제한길이 이후 표시될 문자(혹은 특수문자)
	// Return Type 
	//	-- String : 표시될 data 내용
	public static String compByte(String str, Integer i, String trail){
		if(str == null)	return "";
		String tmp = str;
		try {
			int cutLength = i.intValue();
			int slen = 0, blen = 0;
			char c;
			if(length(tmp) > cutLength+2){
				tmp = substring(tmp, cutLength)+trail;
			}
		} catch(Exception e) {
			e.printStackTrace();			
		}
		return tmp;
	}
	
	
	// 문자열 인코딩을 고려해서 문자열 자르기
	public static String substring(String parameterName, int maxLength) {
		int DB_FIELD_LENGTH = maxLength;
 
		Charset utf8Charset = Charset.forName("UTF-8");
		CharsetDecoder cd = utf8Charset.newDecoder();
 
		try {
			byte[] sba = parameterName.getBytes("UTF-8");
			// Ensure truncating by having byte buffer = DB_FIELD_LENGTH
			ByteBuffer bb = ByteBuffer.wrap(sba, 0, DB_FIELD_LENGTH); // len in [B]
			CharBuffer cb = CharBuffer.allocate(DB_FIELD_LENGTH); // len in [char] <= # [B]
			// Ignore an incomplete character
			cd.onMalformedInput(CodingErrorAction.IGNORE);
			cd.decode(bb, cb, true);
			cd.flush(cb);
			parameterName = new String(cb.array(), 0, cb.position());
		} catch (UnsupportedEncodingException e) {
			System.err.println("### 지원하지 않는 인코딩입니다." + e);
		}
 
		return parameterName;
	}
 
	
	// 문자열 인코딩에 따라서 글자수 체크
	public static int length(CharSequence sequence) {
		int count = 0;
		try {
			for (int i = 0, len = sequence.length(); i < len; i++) {
				char ch = sequence.charAt(i);
	 
				if (ch <= 0x7F) {
					count++;
				} else if (ch <= 0x7FF) {
					count += 2;
				} else if (Character.isHighSurrogate(ch)) {
					count += 4;
					++i;
				} else {
					count += 3;
				}
			}
		} catch(Exception e) {
			e.printStackTrace();			
		}
		return count;
	}
	
	
	// 나이 계산
	public static String calcAge(String birth){
		String rtnStr = "";
		
		try{
			if(!"".equals(ConvertUtil.checkNull(birth))){
				if(birth.length() > 4){
					int thisYear = DateUtil.int_thisYear();
					int compareYear = Integer.parseInt(birth.substring(0, 4));
					
					rtnStr = String.valueOf((thisYear - compareYear)+1)+"세";
				}
			}
		}catch(Exception e){
			System.out.println("ConvertUtil.calcAge Exceptoin!!!!! \n"+e.toString());
		}
		
		return rtnStr;
		
	}
	
	
	public static Mixed unserializeString(String serializeData)
	{
		int pos = 0;
		int length = 0;

		pos = serializeData.indexOf(':', pos + 2);
		length = Integer.parseInt(serializeData.substring(pos + 2, pos));
		
		int startPos = pos+2;
		int lastEndPos = pos+2+length;
		String original = serializeData.substring(startPos, lastEndPos);
		// BigChar means characters occupy more than one byte
		//e.g. Chinese characters. The length defined in serialization are for byte (one Chinese character use more than one byte), but the "charAt" function is for codePoint(one Chinese character is on codePoint)
		// Actually, this is not the exact number of bigchar because in some encoding, one Character need 3 or more bytes. But for solving this issue, this doesn't matter.
		int numberOfBigChar = original.getBytes().length - length; 
		String actual = serializeData.substring(startPos, lastEndPos-numberOfBigChar);
		
		pos = pos + length + 4 - numberOfBigChar;
		return new Mixed(actual);
	}

	//(begin) 2021.01.08 by s.yoo
	/*
	 * 채용공고 입사지원서 종류 이름.
	 */
	public static String getRecruitBizFormName(String bizForm) {
		String strBizFormName = "";
		try {
			if (bizForm == null || bizForm.length() < 1) return "";
	
			if (bizForm.contains("online")) strBizFormName = "온라인 이력서";
			if (bizForm.contains("confirm")) strBizFormName += (strBizFormName.length() > 0)? ", 자사 입사지원서 양식" : "자사 입사지원서 양식";
		} catch(Exception e) {
			e.printStackTrace();			
		}
		
		return strBizFormName;
	}
	public static boolean isRecruitBizFormConfirm(String bizForm) {
		if (bizForm == null || bizForm.length() < 1) return false;
		return bizForm.contains("confirm");
	}
	public static boolean isRecruitBizFormOnline(String bizForm) {
		if (bizForm == null || bizForm.length() < 1) return false;
		return bizForm.contains("online");
	}


	/*
	 * 채용마감
	 */
	public static String getEndCond(String bizIng, String bizEndType, String bizEndDay) {
		String strBizEndCond = "";
		try {
			if (!bizIng.equalsIgnoreCase("yes")) return "채용마감";
	
			if (bizEndType.equalsIgnoreCase("get")) strBizEndCond = "채용시까지";
			else if (bizEndType.equalsIgnoreCase("often")) strBizEndCond = "상시채용";
			//else if (bizEndType.equalsIgnoreCase("input")) strBizEndCond = bizEndDay;
			else strBizEndCond = bizEndDay;
		} catch(Exception e) {
			e.printStackTrace();			
		}

		return strBizEndCond;
	}

	/*
	 * 채용마감 - 기타채용정보
	 */
	public static String getEndCondOther(String bizEndDay) {
		String strBizEndCond = "";
		try {
			if (bizEndDay == null || bizEndDay.length() < 1) return "";
			String[] listDay = bizEndDay.split(" ");
			//strBizEndCond = (listDay.length > 1)? listDay[0] : listDay[1];
			strBizEndCond = listDay[0];
		} catch(Exception e) {
			e.printStackTrace();			
		}

		return strBizEndCond;
	}

	public static String getEndCond4Index(String bizIng, String bizEndType, String bizEndDay) {
		String strBizEndCond = "";
		try {
			if (!bizIng.equalsIgnoreCase("yes")) return "채용마감";
	
			if (bizEndType.equalsIgnoreCase("input")) strBizEndCond = "마감: " + bizEndDay;
			else if (bizEndType.equalsIgnoreCase("get")) strBizEndCond = "채용시까지";
			else if (bizEndType.equalsIgnoreCase("often")) strBizEndCond = "상시채용";
		} catch(Exception e) {
			e.printStackTrace();			
		}

		return strBizEndCond;
	}
	
	/*
	 * 이메일과 전화번호 분할.
	 */
	public static String getPhone01(String strPhoneNo) {
		String strValue = "";
		try {
			if (strPhoneNo == null || strPhoneNo.length() < 1) return strValue;
			String[] list = strPhoneNo.split("-");
			if (list.length > 0) strValue = list[0];   	
		} catch(Exception e) {
			e.printStackTrace();			
		}
		return strValue;
	}
	public static String getPhone02(String strPhoneNo) {
		String strValue = "";
		try {
			if (strPhoneNo == null || strPhoneNo.length() < 1) return strValue;
			String[] list = strPhoneNo.split("-");
			if (list.length > 1) strValue = list[1];   	
		} catch(Exception e) {
			e.printStackTrace();			
		}
		return strValue;
	}
	public static String getPhone03(String strPhoneNo) {
		String strValue = "";
		try {
			if (strPhoneNo == null || strPhoneNo.length() < 1) return strValue;
			String[] list = strPhoneNo.split("-");
			if (list.length > 2) strValue = list[2];   	
		} catch(Exception e) {
			e.printStackTrace();			
		}
		return strValue;
	}

	public static String getEmail01(String strEmail) {
		String strValue = "";
		try {
			if (strEmail == null || strEmail.length() < 1) return strValue;
			String[] list = strEmail.split("\\@");
			if (list.length > 0) strValue = list[0];   	
		} catch(Exception e) {
			e.printStackTrace();			
		}
		return strValue;
	}
	public static String getEmail02(String strEmail) {
		String strValue = "";
		try {
			if (strEmail == null || strEmail.length() < 1) return strValue;
			String[] list = strEmail.split("\\@");
			if (list.length > 1) strValue = list[1];   	
		} catch(Exception e) {
			e.printStackTrace();			
		}
		return strValue;
	}

	/*
	 * 개인 신상정보 감추기 지원
	 */
	//구직자 이름
	public static String getPersonNameHidden(String strName, Integer paidResume) {
		if (paidResume != null && paidResume == 1) return strName;
		
		if (strName == null || strName.length() < 2) return "";
		return strName.substring(0, 1) + "OO";
	}

	//구직자 UID
	public static String getUidHidden(String strUid, Integer paidResume) {
		if (paidResume != null && paidResume == 1) return strUid;
		
		if (strUid == null || strUid.length() < 1) return "";
		return "OOOOOO";
	}

	//전화번호
	public static String getPhoneNoHidden(String strPhoneNo, Integer paidResume) {
		if (paidResume != null && paidResume == 1) return strPhoneNo;
		
		if (strPhoneNo == null || strPhoneNo.length() < 4) return "";
		String[] list = strPhoneNo.split("-");
		if (list.length < 2)
			return(list[0].substring(0, 3) + "-OOOO-OOOO");
		
		String strHiddenValue = list[0];
		if (list.length > 1)	strHiddenValue += "-OOOO";
		if (list.length > 2)	strHiddenValue += "-OOOO";
		
		return strHiddenValue;
	}

	//이메일
	public static String getEmailHidden(String strEmail, Integer paidResume) {
		if (paidResume != null && paidResume == 1) return strEmail;
		
		if (strEmail == null || strEmail.length() < 1) return "";
		String[] list = strEmail.split("@");
		if (list.length < 2) return "";
		return("****@********.***");
	}

	//주소
	public static String getAddressHidden(String strPost, String strAddress1, String strAddress2, Integer paidResume) {
		if (paidResume != null && paidResume == 1) return strPost + " " + strAddress1 + " " + strAddress2;
		
		if (strAddress1 == null || strAddress1.length() < 1) return "";
		String[] list = strAddress1.split(" ");

		String strHiddenValue = "[" + strPost + "]";
		if (list.length > 0) strHiddenValue += " " + list[0];
		if (list.length > 1) strHiddenValue += " " + list[1];
		strHiddenValue += " ***** ";
		
		return strHiddenValue;
	}
	//(begin) 2021.01.08 by s.yoo 

}
