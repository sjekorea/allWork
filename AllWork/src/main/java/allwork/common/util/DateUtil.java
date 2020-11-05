package allwork.common.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public class DateUtil {
	
	private int year;
	private int month;
	private int day;
	private int week;
	private int hh;
	private int mm;
	private int ss;
	
	/**
	*	오늘 날짜 정보 HashMap으로 전체 정보 return.
	*/
	public Map<String, Object> getCurrDate() throws Exception{
		Map<String, Object> dateInfo = new HashMap<String, Object>();
		String str_pt_month = "";
		String str_pt_day = "";

		try{
			Calendar today = Calendar.getInstance();
			year = today.get(Calendar.YEAR);
			month = today.get(Calendar.MONTH)+1;
			day = today.get(Calendar.DATE);
			week = today.get(Calendar.DAY_OF_WEEK);
			hh = today.get(Calendar.HOUR_OF_DAY);
			mm = today.get(Calendar.MINUTE);
			ss = today.get(Calendar.SECOND);

			// 앞에 0붙이기
			if(month<10){
				str_pt_month = "0"+Integer.toString(month);
			}else{
				str_pt_month = Integer.toString(month);
			}
			if(day<10){
				str_pt_day = "0"+Integer.toString(day);
			}else{
				str_pt_day = Integer.toString(day);
			}

			dateInfo.put("year", year);
			dateInfo.put("month", month);
			dateInfo.put("day", day);
			dateInfo.put("week", week);
			dateInfo.put("hh", hh);
			dateInfo.put("mm", mm);
			dateInfo.put("ss", ss);
		}catch (Exception e){
			System.out.println("DateUtil.getCurrDate() EXCEPTION !!!! \n"+e.toString());
		}
		return dateInfo;
	}
	
	
	/**
	*	특정 날짜 정보 HashMap으로 전체 정보 return.
	*/
	public Map<String, Object> getSpecificDate(String date) throws Exception{
		
		Map<String, Object> dateInfo = new HashMap<String, Object>();
		String str_pt_month = "";
		String str_pt_day = "";

		try{
			Calendar specificDay = Calendar.getInstance();
			
		    SimpleDateFormat df = new SimpleDateFormat("yyyy-mm-dd");
		    Date nDate = df.parse(date) ;
		     
		    Calendar cal = Calendar.getInstance() ;
		    cal.setTime(nDate);
			
			year = specificDay.get(Calendar.YEAR);
			month = specificDay.get(Calendar.MONTH)+1;
			day = specificDay.get(Calendar.DATE);
			week = specificDay.get(Calendar.DAY_OF_WEEK);
			hh = specificDay.get(Calendar.HOUR_OF_DAY);
			mm = specificDay.get(Calendar.MINUTE);
			ss = specificDay.get(Calendar.SECOND);

			// 앞에 0붙이기
			if(month<10){
				str_pt_month = "0"+Integer.toString(month);
			}else{
				str_pt_month = Integer.toString(month);
			}
			if(day<10){
				str_pt_day = "0"+Integer.toString(day);
			}else{
				str_pt_day = Integer.toString(day);
			}

			dateInfo.put("year", year);
			dateInfo.put("month", month);
			dateInfo.put("day", day);
			dateInfo.put("week", week);
			dateInfo.put("hh", hh);
			dateInfo.put("mm", mm);
			dateInfo.put("ss", ss);
		}catch (Exception e){
			System.out.println("DateUtil.getSpecificDate() EXCEPTION !!!! \n"+e.toString());
		}
		return dateInfo;
	}
	
	
	/**
	*	현재 년도를 서버에서 읽어올때 - String
	*/
	public static String str_thisYear() throws Exception {

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy", java.util.Locale.KOREA);
		Date currentTime = new Date();
		String dYear = formatter.format(currentTime);
		return dYear;
	}


	/**
	*	현재 년도를 서버에서 읽어올때 - int Type으로 변환된 현재 년도
	*/
	public static int int_thisYear() throws Exception {

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy", java.util.Locale.KOREA);
		Date currentTime = new Date();
		int dYear = 0;
		try{
			dYear = Integer.parseInt(formatter.format(currentTime));
		}catch(NumberFormatException e){
			dYear = 0;
		}
		return dYear;
	}



	/**
	*
	*	현재 달을 서버에서 읽어올때 - String Type으로 변환된 현재 달
	*/
	public static String str_thisMonth() throws Exception {

		SimpleDateFormat formatter = new SimpleDateFormat("MM", java.util.Locale.KOREA);
		Date currentTime = new Date();
		String dMonth = formatter.format(currentTime);
		return  dMonth;
	}


	/**
	*
	*	현재 달을 서버에서 읽어올때 - int Type으로 변환된 현재 달
	*/
	public static int int_thisMonth() throws Exception {

		SimpleDateFormat formatter = new SimpleDateFormat("MM", java.util.Locale.KOREA);
		Date currentTime = new Date();
		int dMonth = 0;
		try{
			dMonth = Integer.parseInt(formatter.format(currentTime));
		}catch(NumberFormatException e){
			dMonth = 0;
		}
		return  dMonth;
	}


	/**
	*	현재날짜를 서버에서 읽어올때 - String Type으로 변환된 현재 날짜
	*/
	public static String str_thisDay() throws Exception {

		SimpleDateFormat formatter = new SimpleDateFormat("dd", java.util.Locale.KOREA);
		Date currentTime = new Date();
		String dDay = formatter.format(currentTime);
		return  dDay;
	}


	/**
	*	현재날짜를 서버에서 읽어올때 - int Type으로 변환된 현재 날짜
	*/
	public static int int_thisDay() throws Exception {

		SimpleDateFormat formatter = new SimpleDateFormat("dd", java.util.Locale.KOREA);
		Date currentTime = new Date();
		int dDay = 0;
		try{
			dDay = Integer.parseInt(formatter.format(currentTime));
		}catch(NumberFormatException e){
			dDay = 0;
		}
		return  dDay;
	}


	/**
	*	현재시각을 서버에서 읽어올때 - String Type으로 변환된 현재 시각
	*/
	public static String str_thisHour() throws Exception {

		SimpleDateFormat formatter = new SimpleDateFormat("HH", java.util.Locale.KOREA);
		Date currentTime = new Date();
		String dHour = formatter.format(currentTime);
		return  dHour;
	}


	/**
	*	현재시각을 서버에서 읽어올때 - int Type으로 변환된 현재 시각
	*/
	public static int int_thisHour() throws Exception {

		SimpleDateFormat formatter = new SimpleDateFormat("HH", java.util.Locale.KOREA);
		Date currentTime = new Date();
		int dHour = 0;
		try{
			dHour = Integer.parseInt(formatter.format(currentTime));
		}catch(NumberFormatException e){
			dHour = 0;
		}
		return  dHour;
	}


	/**
	*	현재분을 서버에서 읽어올때 - String Type으로 변환된 현재 분
	*/
	public static String str_thisMin() throws Exception {

		SimpleDateFormat formatter = new SimpleDateFormat("mm", java.util.Locale.KOREA);
		Date currentTime = new Date();
		String dMin = formatter.format(currentTime);
		return  dMin;
	}


	/**
	*	현재분을 서버에서 읽어올때 - int Type으로 변환된 현재 분
	*/
	public static int int_thisMin() throws Exception {

		SimpleDateFormat formatter = new SimpleDateFormat("mm", java.util.Locale.KOREA);
		Date currentTime = new Date();
		int dMin = 0;
		try{
			dMin = Integer.parseInt(formatter.format(currentTime));
		}catch(NumberFormatException e){
			dMin = 0;
		}
		return  dMin;
	}


	/**
	*	현재초를 서버에서 읽어올때 - String Type으로 변환된 현재 분
	*/
	public static String str_thisSec() throws Exception {

		SimpleDateFormat formatter = new SimpleDateFormat("ss", java.util.Locale.KOREA);
		Date currentTime = new Date();
		String dSec = formatter.format(currentTime);
		return  dSec;
	}


	/**
	*	현재초를 서버에서 읽어올때 - int Type으로 변환된 현재 분
	*/
	public static int int_thisSec() throws Exception {

		SimpleDateFormat formatter = new SimpleDateFormat("ss", java.util.Locale.KOREA);
		Date currentTime = new Date();
		int dSec = 0;
		try{
			dSec = Integer.parseInt(formatter.format(currentTime));
		}catch(NumberFormatException e){
			dSec = 0;
		}
		return  dSec;
	}

	/**
	*	현재날짜,시간을 서버에서 읽어올때  - 0000년 00월 00일 00:00
	*/
	public static String getKorNowDate() throws Exception {
		return str_thisYear()+"년 "+str_thisMonth()+"월 "+str_thisDay()+"일 "+str_thisHour()+":"+str_thisMin();
	}	
	
	/**
	*	현재날짜,시간을 서버에서 읽어올때  - 구분자에 의해 String Type으로 변환된 현재 날짜와 시간
	*/
	public static String getNowDate(String div) throws Exception {
		return str_thisYear()+div+str_thisMonth()+div+str_thisDay()+" "+str_thisHour()+":"+str_thisMin()+":"+str_thisSec();
	}
	
	/**
	*	오늘날짜와 특정 날짜 비교
	*/
	public static int getCompareDate(String compareDateStr) throws Exception{
		
		Date compareDate;	// 비교일
		Date currentDate; 		// 현재날짜 Date
		String today = ""; 		// 현재날짜
		String compareVal = "N";
		int compare = 0;

		try{
		
			SimpleDateFormat df = new SimpleDateFormat ("yyyy-MM-dd", Locale.KOREA );
			Date currentTime = new Date();
			today = df.format( currentTime ); //현재시간 (String)

			compareDate = df.parse(compareDateStr);
			currentDate = df.parse( today );

			compare = currentDate.compareTo(compareDate); // 날짜비교
			
		}catch (Exception e){
			System.out.println("DateUtil.getCompareDate() EXCEPTION !!!! \n"+e.toString());
		}
		return compare;
	}
	
	
	/**
	*	특정 날짜 요일 구하기
	*/
	public static String getDayOfWeek(String compareDateStr) throws Exception{
		
		String rtnStr = "";
		int dayOfWeek = -1;
		
		try{
			Calendar specificDay = Calendar.getInstance();
			
		    SimpleDateFormat df = new SimpleDateFormat("yyyy-mm-dd");
		    Date nDate = df.parse(compareDateStr) ;
		     
		    Calendar cal = Calendar.getInstance() ;
		    cal.setTime(nDate);
			
			dayOfWeek = specificDay.get(Calendar.DAY_OF_WEEK);
			
			switch(dayOfWeek){
	        case 1:
	        	rtnStr = "일";
	            break ;
	        case 2:
	        	rtnStr = "월";
	            break ;
	        case 3:
	        	rtnStr = "화";
	            break ;
	        case 4:
	        	rtnStr = "수";
	            break ;
	        case 5:
	        	rtnStr = "목";
	            break ;
	        case 6:
	        	rtnStr = "금";
	            break ;
	        case 7:
	        	rtnStr = "토";
	            break ;
			}
			
		}catch (Exception e){
			System.out.println("DateUtil.getDayOfWeek() EXCEPTION !!!! \n"+e.toString());
		}
		return rtnStr;
	}
}
