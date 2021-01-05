package com.ilmagna.allworkadmin.api.common;

import java.io.File;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Hex;
import org.joda.time.DateTime;
import org.joda.time.format.ISODateTimeFormat;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.multipart.MultipartFile;

import com.ilmagna.allworkadmin.api.authentication.security.domains.ApiCustomLoginAccountDetails;
import com.ilmagna.allworkadmin.api.authentication.security.domains.ApiLoginAccount;

public class ApiCommonUtils {
	
	
	/**
	 * Login 사용자 정보.
	 * @return
	 */
	public static ApiLoginAccount getLoginUser(HttpSession session) {
		ApiLoginAccount loginUser = null;
		try {
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			loginUser = ((ApiCustomLoginAccountDetails) authentication.getPrincipal()).getUser();
		} catch(Exception e) {
			
		}
		
		//Session에 Login 사용자 정보 획득.
		if (loginUser == null && session != null) {
			loginUser = (ApiLoginAccount) session.getAttribute("LoginUser");
		}

		return loginUser;
	}
	
	/**
	 * 날짜 문자열 처리.
	 */
	public static String dateStr2MonthStr(String strDate) {
		if (strDate == null) return "";
		if (strDate.length() < 7) return strDate;
		return strDate.substring(0, 7); // + "-01";
	}
	
	public static String dateStr2HourStr(Date dt) {
		/*
		if (strDate == null) return "";
		if (strDate.length() < 13) return strDate;
		String strToHour = "";
		try {
			String toHour = strDate.substring(11, 13);
			Integer nToHour = Integer.valueOf(toHour) + 1;
			strToHour = String.format("%02d", nToHour);
		} catch(Exception e) {}
		return strDate.substring(0, 13) + " ~ " + strToHour;
		*/
		if (dt == null) return "";
		
		// Create an instance of SimpleDateFormat used for formatting 
		// the string representation of date (month/day/year)
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH");

		// Get the date dt using Calendar object.
		//Date dt = Calendar.getInstance().getTime();		
		// Using DateFormat format method we can create a string 
		// representation of a date with the defined format.
		String reportDate = df.format(dt);

		// Print what date is dt!
		return reportDate + " ~ " + (dt.getHours() + 1);
	}
	
	
	/**
	 *****************************************************************************************
	 * Local Time과 UTC Time 변환.
	 *****************************************************************************************
	 */
	//Local Date와 Time 변환.
	/**
	 * Local Date 문자열을 Local Date로 변환.
	 * @param strDate
	 * @return
	 */
	public static Date TC_LocalString2LocalDate(String strDate, String strDateFormat) {
		if (isNullOrEmpty(strDate) || isNullOrEmpty(strDateFormat)) return null;

		Date dateLocal = null;
		//String strDate = "20190102123456"; String strDateFormat = "yyyyMMddHHmmss";
		try {
			//Local Date string -> Local Date.
			dateLocal = new SimpleDateFormat(strDateFormat).parse(strDate);
		} catch(Exception e) {}
		return dateLocal;
	}
	/**
	 * Local Date를 Local Date 문자열로 변환.
	 * @param strDate
	 * @return
	 */
	public static String TC_LocalDate2LocalString(Date dateLocal, String strDateFormat) {
		if (dateLocal == null || isNullOrEmpty(strDateFormat)) return "";

		String strLocal = "";
		//Date dateLocal = new Date();	String strDateFormat = "yyyy-MM-dd";
		try {		
			// Create an instance of SimpleDateFormat used for formatting 
			// the string representation of date (month/day/year)
			DateFormat df = new SimpleDateFormat(strDateFormat);

			// Get the date dt using Calendar object.
			//Date dt = Calendar.getInstance().getTime();		
			// Using DateFormat format method we can create a string 
			// representation of a date with the defined format.
			String reportDate = df.format(dateLocal);

			// Print what date is dt!
			strLocal = reportDate;
		} catch(Exception e) {}
		return strLocal;
	}

	//Local Time을 UTC Time으로 변환.
	/**
	 * Local Date 문자열을 UTC Date & Time으로 변환.
	 * @param strDate
	 * @return
	 */
	public static Date TC_LocalString2UtcDate(String strDate, String strDateFormat) {
		if (isNullOrEmpty(strDate) || isNullOrEmpty(strDateFormat)) return null;

		Date dateUtc = null;
		//String strDate = "20190102123456"; String strDateFormat = "yyyyMMddHHmmss";
		try {
			//Local Date string -> Local Date.
			Date dateLocal = TC_LocalString2LocalDate(strDate, strDateFormat);

			//Local Date -> UTC Date.
			dateUtc = TC_LocalDate2UtcDate(dateLocal);
		} catch(Exception e) {}
		return dateUtc;
	}
	/**
	 * Local Date 문자열을 UTC Date string으로 변환.
	 * @param strDate
	 * @return
	 */
	public static String TC_LocalString2UtcString(String strDate, String strDateFormat) {
		if (isNullOrEmpty(strDate) || isNullOrEmpty(strDateFormat)) return null;

		String strUtc = "";
		//String strDate = "20190102123456"; String strDateFormat = "yyyyMMddHHmmss";
		try {
			//Local Date string -> Local Date.
			Date dateLocal = new SimpleDateFormat(strDateFormat).parse(strDate);

			//Local Date -> UTC string.
			strUtc = TC_LocalDate2UtcString(dateLocal);
		} catch(Exception e) {}
		return strUtc;
	}
	/**
	 * Local Date를 UTC Date & Time으로 변환.
	 * @param strDate
	 * @return
	 */
	public static Date TC_LocalDate2UtcDate(Date dateLocal) {
		if (dateLocal == null) return null;

		Date dateUtc = null;
		//String dateLocal = new Date();
		try {
			///* - Local PC mySQL에서 동작하는 방법.
			//Local Date -> UTC Date string.
			String strUtc = TC_LocalDate2UtcString(dateLocal);

			//Local Date -> UTC Date
			TimeZone tz = TimeZone.getTimeZone("UTC");
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
			df.setTimeZone(tz);
			dateUtc = df.parse(strUtc);
			//*/
			/* - AWS mySQL에서 동작하는 방법.
			long localTime = dateLocal.getTime();
			TimeZone tzLocal = TimeZone.getDefault();
			int offset = tzLocal.getOffset(localTime);
			long utcTime = localTime - offset;
			dateUtc = new Date(utcTime);
			*/
		} catch(Exception e) {}
		return dateUtc;
	}
	/**
	 * Local Date를 UTC Date string으로 변환.
	 * @param strDate
	 * @return
	 */
	public static String TC_LocalDate2UtcString(Date dateLocal) {
		if (dateLocal == null) return "";

		String strUtc = null;
		//String dateLocal = new Date();
		try {
			//Local Date -> UTC Date string.
			TimeZone tz = TimeZone.getTimeZone("UTC");
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
			df.setTimeZone(tz);
			strUtc = df.format(dateLocal);
		} catch(Exception e) {}
		return strUtc;
	}

	//UTC Time을 Local Time으로 변환
	//(ToDo)

	
	
	
	
	/**
	 * 날짜 처리 모듈
	 */
	public static String localDate2LocalString(Date dt) {
		if (dt == null) return "";
		
		// Create an instance of SimpleDateFormat used for formatting 
		// the string representation of date (month/day/year)
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

		// Get the date dt using Calendar object.
		//Date dt = Calendar.getInstance().getTime();		
		// Using DateFormat format method we can create a string 
		// representation of a date with the defined format.
		String reportDate = df.format(dt);

		// Print what date is dt!
		return reportDate;
	}
	public static String localDateTime2LocalString(Date dt) {
		if (dt == null) return "";
		
		// Create an instance of SimpleDateFormat used for formatting 
		// the string representation of date (month/day/year)
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		// Get the date dt using Calendar object.
		//Date dt = Calendar.getInstance().getTime();		
		// Using DateFormat format method we can create a string 
		// representation of a date with the defined format.
		String reportDate = df.format(dt);

		// Print what date is dt!
		return reportDate;
	}
	public static String localDateHour2LocalString(Date dt) {
		if (dt == null) return "";
		
		// Create an instance of SimpleDateFormat used for formatting 
		// the string representation of date (month/day/year)
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH");

		// Get the date dt using Calendar object.
		//Date dt = Calendar.getInstance().getTime();		
		// Using DateFormat format method we can create a string 
		// representation of a date with the defined format.
		String reportDate = df.format(dt);

		// Print what date is dt!
		return reportDate;
	}
	public static String localMonth2LocalString(Date dt) {
		if (dt == null) return "";
		
		// Create an instance of SimpleDateFormat used for formatting 
		// the string representation of date (month/day/year)
		DateFormat df = new SimpleDateFormat("yyyy-MM");

		// Get the date dt using Calendar object.
		//Date dt = Calendar.getInstance().getTime();		
		// Using DateFormat format method we can create a string 
		// representation of a date with the defined format.
		String reportDate = df.format(dt);

		// Print what date is dt!
		return reportDate;
	}

	public static Date localString2LocalDate(String strDate)  {
		if (isNullOrEmpty(strDate)) return null;

		Date date = null;
		//String strDate = "2011-01-18";
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(strDate);
		} catch(Exception e) {}
		return date;
	}
	public static Date localString2LocalDateTime(String strDate)  {
		if (isNullOrEmpty(strDate)) return null;

		Date date = null;
		//String strDate = "2011-01-18 00:00:00.0";
		//String strDate = "2011-01-18 00:00:00";
		try {
			//date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(strDate);
			date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(strDate);
		} catch(Exception e) {}
		return date;		
	}

	public static Date localString2LocalDate_by_pos(String strDate)  {
		if (isNullOrEmpty(strDate)) return null;

		Date date = null;
		//String strDate = "2011-01-18";
		try {
			date = new SimpleDateFormat("yyyyMMdd").parse(strDate);
		} catch(Exception e) {}
		return date;
	}
	public static Date localString2LocalDateTime_by_pos(String strDate)  {
		if (isNullOrEmpty(strDate)) return null;

		Date date = null;
		//String strDate = "2011-01-18 00:00:00.0";
		//String strDate = "2011-01-18 00:00:00";
		try {
			//date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(strDate);
			date = new SimpleDateFormat("yyyyMMddHHmmss").parse(strDate);
		} catch(Exception e) {}
		return date;		
	}

	/**
	 * UTC Date/Time 처리.
	 * @param strDate
	 * @return
	 */
	public static String localDate2UtcString(Date date) {
		if (date == null) return "";
		TimeZone tz = TimeZone.getTimeZone("UTC");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm'Z'");
		df.setTimeZone(tz);
		return df.format(date);
	}

	public static Date utcString2UtcDate(String strDate) {
		if (isNullOrEmpty(strDate)) return null;

		//String strDate = "2011-04-15T20:08:18Z";
		DateTime date = ISODateTimeFormat.dateTimeParser().parseDateTime(strDate);
		return date.toDate();				
	}

	/*
	public static Date utcString2UtcDate(String strDate) {
		if (isNullOrEmpty(strDate)) return null;
		
		TimeZone tz = TimeZone.getTimeZone("UTC");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm'Z'");
		df.setTimeZone(tz);

		try {
			return df.parse(strDate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	*/
	
	
	/**
	 * Local Time과 UTC Time 변환.
	 * @param date
	 * @return
	 */
	public static Date localDate2UtcDate(Date date) {
		//Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
		Date gmt = new Date(sdf.format(date));
		return gmt;
	}
	public static Date utcDate2LocalDate(Date date) {
		String timeZone = Calendar.getInstance().getTimeZone().getID();
		Date local = new Date(date.getTime() + TimeZone.getTimeZone(timeZone).getOffset(date.getTime()));
		return local;
	}
	
	/*
	public static String localString2UtcString(String strDate) {
		
	}
	public static String utcString2LocalString(String strDate) {
		
	}
	*/
	
	/**
	 * Date Time 처리.
	 */
	public static Date addDays(Date currentDate, int days) {
		Calendar c = Calendar.getInstance();
		c.setTime(currentDate);

		// manipulate date
		//c.add(Calendar.YEAR, 1);
		//c.add(Calendar.MONTH, 1);
		c.add(Calendar.DATE, days); //same with c.add(Calendar.DAY_OF_MONTH, 1);
		//c.add(Calendar.HOUR, 1);
		//c.add(Calendar.MINUTE, 1);
		//c.add(Calendar.SECOND, 1);

		// convert calendar to date
		Date currentDatePlusDays = c.getTime();
		
		return currentDatePlusDays;
	}

	/**
	 * 유효기간 만료 검사.
	 */
	public static boolean isExpired(boolean expire_no_flag, Date expire_at) {
		if (expire_no_flag) return false;
		
		//현재 날짜 구하기.
		//Date today = localDate2UtcDate(new Date());
		Date today = new Date();
		if (today.after(expire_at)) return true;
		
		return false;
	}

	/**
	 * 첨부파일 Upload
	 */
	public static String loadAttachedFileName(String strFileName, String strFileCode) {
		String strFileNameDest = strFileCode;
		try {
			//파일 확장명 추출.
			int pos = strFileName.lastIndexOf(".");
			if (pos >= 0) {
	 			//String strBody = strFileName.substring(0, pos);
				String strExt = strFileName.substring(pos);
				
				strFileNameDest = strFileCode + strExt;
			}
		}
		catch(Exception e) {
			e.printStackTrace();			
		}
		return strFileNameDest;
	}

	public static File loadAttachedFile(MultipartFile attachedFile, String strFileNameDest) {
		File destFile = null;
		try {
			//파일 경로 구성.
			destFile = new File("D:\\Projects\\J2EE\\uploads\\" + strFileNameDest);
			//destFile = new File( attachedFile.getOriginalFilename());
		}
		catch(Exception e) {
			e.printStackTrace();			
		}
		return destFile;
	}

	/**
	 * 이미지 파일 Upload.
	 */
	public static String uploadPhotoFile(String uid, String prefix, MultipartFile photoFile, String filePathPhoto) {
		String strFilename = "";
		try {
			//Upload 폴더 생성.
	        File file = new File(filePathPhoto);
	        if(file.exists() == false){
	        	file.mkdirs();
	        }

	        //Target 파일이름 생성.
			String strKey = encodeMD5(generateTimeId());
			if (strKey.length() >= 4)
				strKey = strKey.substring(0, 4);
			strFilename = prefix + "_" + uid + "_" + strKey;
			//System.out.println(strFilename);
	        
			//Target 파일 Path 설정.
			File destFile = new File(filePathPhoto + strFilename);
			//System.out.println(destFile.getAbsolutePath());
			
	        //Upload 폴더로 파일 이동.
			photoFile.transferTo(destFile);
		}
		catch(Exception e) {
			strFilename = "";
			e.printStackTrace();			
		}
		return strFilename;
	}

	/**
	 * Excel 파일 Upload
	 */
	public static File loadExcelFile(MultipartFile excelFile) {
		File destFile = null;
		try {
			//destFile = new File("D:\\data\\uploads\\" + excelFile.getOriginalFilename());
			
			destFile = new File( excelFile.getOriginalFilename());
		}
		catch(Exception e) {
			e.printStackTrace();			
		}
		return destFile;
	}

	public static boolean isInteger(String str)  
	{
		try
		{
			double d = Double.parseDouble(str);
			if (d == (int)d) return true;
		} catch (NumberFormatException ex)
		{
			return false;
		}
		return false;
	}
	
	public static String emptyIfNullString(String value) {
		return (value == null)? "" : value;
	}
	public static String emptyIfNullChar(String value) {
		return (value.compareToIgnoreCase("Y") == 0 || value.compareToIgnoreCase("N") == 0)? "" + value : "?";
	}
	public static String emptyIfNullInteger(Integer value) {
		return (value == null)? "" : "" + value;
	}
	public static String emptyIfNullHex(Integer value) {
		return (value == null || value < 0)? "" : "" + ("0x" + Integer.toHexString(value).toUpperCase());
	}
	public static String emptyIfNullBoolean(Boolean value) {
		return (value == null)? "" : "" + value;
	}
	public static String emptyIfNullBooleanWithYN(Boolean value) {
		return (value == null)? "" : "" + (value? "Y" : "N");
	}
	public static String emptyIfNullFloat(Float value) {
		return (value == null)? "" : "" + value;
	}
	
	public static String parseString(String value) {
		if (isNullOrEmpty(value)) return "";
		if (isInteger(value))
			return "" + ((int) Double.parseDouble(value));
		return value.trim();
	}
	
	public static Integer parseInteger(String value) {
		Integer result = null;
		if (isNullOrEmpty(value)) return result;
		
		try {
			if (value.length() > 1 && value.substring(0, 2).equalsIgnoreCase("0X")) {
				//Hexadecimal string 처리.
				result = Integer.parseInt(value.substring(2), 16);
			}
			else {
				//소수점이 첨부되서 전달되는 정수 처리.
				result = (int) (Double.parseDouble(value));
			}
		} catch(Exception e) {}
		return result;
	}
	public static Boolean parseBoolean(String value) {
		Boolean result = false;
		if (isNullOrEmpty(value)) return result;
		
		try {
			result = Boolean.valueOf(value);
		} catch(Exception e) {}
		return result;
	}
	public static Boolean parseBooleanWithYN(String value) {
		Boolean result = false;
		if (isNullOrEmpty(value)) return result;
		
		try {
			result = value.equalsIgnoreCase("Y");
		} catch(Exception e) {}
		return result;
	}
	public static String parseCharWithYN(String value) {
		String result = "N";
		if (isNullOrEmpty(value)) return result;
		if (value.compareToIgnoreCase("Y") != 0 && value.compareToIgnoreCase("N") != 0) return result;
		
		return value;
	}
	public static Float parseFloat(String value) {
		Float result = null;
		if (isNullOrEmpty(value)) return result;
		
		try {
			result = Float.valueOf(value);
		} catch(Exception e) {}
		return result;
	}
	public static String parseIntString(String value) {
		String result = "";
		if (isNullOrEmpty(value)) return result;
		
		try {
			if (value.length() > 1 && value.substring(0, 2).equalsIgnoreCase("0X")) {
				//Hexadecimal string 처리.
				result = "" + Integer.parseInt(value.substring(2), 16);
			}
			else {
				//소수점이 첨부되서 전달되는 정수 처리.
				result = "" + ((int) (Double.parseDouble(value)));
			}
		} catch(Exception e) {}
		return result;
	}
	
	public static Date parseDate(String value) {
		Date result = null;
		if (isNullOrEmpty(value)) return result;
		
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			result = sdf.parse(value);
			//String date=sdf.format(result );
			//System.out.println(date);
		} catch(Exception e) {}
		return result;
	}
	
	

	//이벤트 Source 종류
	public static Integer parseSourceType(String value) {
		if (isNullOrEmpty(value)) return 0;
		
		value = value.trim();
		if (value.equals("0")) return 0;
		else if (value.equals("1")) return 1;
		else if (value.equals("2")) return 2;
		else if (value.equalsIgnoreCase("Platform")) return 0;
		else if (value.equalsIgnoreCase("App") || value.equalsIgnoreCase("Application")) return 1;
		else if (value.equalsIgnoreCase("Device")) return 2;
		
		return 0;
	}
	
	//이벤트 데이터 ID
	public static String parseEventDataID(Integer sourceType, String value) {
		if (isNullOrEmpty(value)) return "";
		
		value = value.trim().toLowerCase();
		if (sourceType == 0) {
			if (value.indexOf("cpu usage") >= 0) return "total_platform_cpu";
			else if (value.indexOf("memory usage") >= 0) return "total_platform_mem";
			else if (value.indexOf("disk usage") >= 0) return "total_platform_disk";			
		} else if (sourceType == 1) {
			if (value.indexOf("cpu usage") >= 0) return "app_cpu";
			else if (value.indexOf("memory usage") >= 0) return "app_mem";
		} else if (sourceType == 2) {
			if (value.indexOf("status") >= 0) return "status";
		}
		
		return "";
	}


	
	/**
	 * String 처리.
	 */
	public static boolean isNullOrEmpty(String value) {
		return value == null || value.trim().length() < 1 || value.equalsIgnoreCase("NULL");
	}
	
	/**
	 * Float 처리.
	 */
	public static boolean isNull(Float value) {
		return value == null;
	}

	
	/**
	 * 상수 이름 처리.
	 */

	/**
	 * Device ID 생성.
	 */
	//Device ID 자동생성에 사용.
	private static int rnum = 0;

	public static String generateDeviceId() {
		return encodeMD5(generateTimeId());
	}
	public static String generateUserPw() {
		String strKey = encodeMD5(generateTimeId());
		if (strKey.length() > 0)
			strKey = strKey.substring(0, 8);
		return strKey;
	}
	public static String generateTimeId() {
		String timeId = String.valueOf(generateTimeIdLong());
		return timeId;
	}
	public static long generateTimeIdLong() {
		long now = System.currentTimeMillis();
		if (++rnum >= 1000) {
			rnum %= 1000;
		}
		long timeId = now*1000 + rnum;
		return timeId;
	}
	public static String encodeMD5(String argv) {
		if (argv == null) {
			return null;
		}
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(argv.getBytes());
			
			byte[] passData = md.digest();
			return Hex.encodeHexString(passData);
		} catch (NoSuchAlgorithmException e) {
		}
		return null;
	}

	public static String generateGuestPw() {
		String key = "" + (System.currentTimeMillis() * (Math.random() + 0.1));
		return encodeMD5(key);
	}

	public static String generateCategoryCode() {
		String strKey = encodeMD5(generateTimeId());
		if (strKey.length() > 0)
			strKey = strKey.substring(0, 8);
		return strKey;
	}

	public static String generateAttachedFileCode() {
		String strKey = encodeMD5(generateTimeId());
		if (strKey.length() > 0)
			strKey = strKey.substring(0, 5);
		return "netfu_file_" + strKey;
	}

	/*
	 * 전화번호 변환.
	 */
	public static String getPhoneFormatStr(String strPhone) {
		String strResult = getPhoneNumberStr(strPhone);
		
		int nLen = strResult.length();
		if (nLen >= 11)
			strResult = strResult.substring(0, 3) + "-" + strResult.substring(3, 7) + "-" + strResult.substring(7, nLen);
		else if (nLen >= 10)
			strResult = strResult.substring(0, 3) + "-" + strResult.substring(3, 6) + "-" + strResult.substring(6, nLen);
		
		return strResult;
	}
	public static String getPhoneNumberStr(String strPhone) {
		if (ApiCommonUtils.isNullOrEmpty(strPhone)) return "";
		
		String strResult = strPhone.trim().replaceAll("-", "");
		return strResult;
	}
	
	
	/*
	 * Smart Editor 지원.
	 */
	public static String cnvtDoubleQuote2SingleQuote(String data) {
		if (data == null) return "";
		return data.replaceAll("\"", "'");
		
	}
}