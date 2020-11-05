package allwork.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CodeConvertUtil {
	
	// 채용 정보 "성별" 항목 
	public static String getBizSex(String bizSex){
		String rtnStr = "";
		
		if("man".equals(bizSex)){
			rtnStr = "남";
		}else if("woman".equals(bizSex)){
			rtnStr = "여";
		}else{
			rtnStr = "무관";
		}
		return rtnStr;
	}
	
	
	// 채용 정보  "마감" 항목 
	public static String getRecruitStatus(String bizIng, String bizEndType, String bizEndDay){
		
		String rtnStr = "";
		int dateCompareResult = 0;
		String dayOfWeek = "";
		
		try{

			if("yes".equals(bizIng)){
				rtnStr = "<p class='deadline deadline01'>채용 마감</p>";
			}else{
				if("get".equals(bizEndType)){
					rtnStr = "<p class='deadline deadline04'>채용시마감</p>";
				}else if("often".equals(bizEndType)){
					rtnStr = "<p class='deadline deadline00'>상시채용</p>";
				}else{
					if("".equals(ConvertUtil.checkNull(bizEndDay))){
						rtnStr = "<p class='deadline deadline00'>상시채용</p>";
					}else{
						if(bizEndDay.length() != 10){
							rtnStr = "<p class='deadline deadline00'>상시채용</p>";
						}else{
							dateCompareResult = DateUtil.getCompareDate(bizEndDay);
							if( dateCompareResult > 0){  // 오늘날짜가 마감일 이후
								rtnStr = "<p class='deadline deadline01'>채용 마감</p>";
							}else if( dateCompareResult < 0){  // 오늘날짜가 마감일 이전
								rtnStr = "<p class='deadline deadline02'> ~"+bizEndDay.substring(5)+"("+DateUtil.getDayOfWeek(bizEndDay)+")"+"</p>";
							}else{
								rtnStr = "<p class='deadline deadline00'>오늘 마감</p>";
							}	
						}
					}
				}
			}
		}catch(Exception e){
			System.out.println("CodeConvertUtil.getRecruitStatus EXCEPTION !!!! \n"+e.toString());
		}
		return rtnStr;
	}
	
	
	// 채용 정보  "마감" 항목 
	public static String getRecruitStatusText(String bizIng, String bizEndType, String bizEndDay){
		
		String rtnStr = "";
		int dateCompareResult = 0;
		String dayOfWeek = "";
		
		try{

			if("yes".equals(bizIng)){
				rtnStr = "채용 마감";
			}else{
				if("get".equals(bizEndType)){
					rtnStr = "채용시마감";
				}else if("often".equals(bizEndType)){
					rtnStr = "상시채용";
				}else{
					if("".equals(ConvertUtil.checkNull(bizEndDay))){
						rtnStr = "상시채용";
					}else{
						if(bizEndDay.length() != 10){
							rtnStr = "상시채용";
						}else{
							dateCompareResult = DateUtil.getCompareDate(bizEndDay);
							if( dateCompareResult > 0){  // 오늘날짜가 마감일 이후
								rtnStr = "채용 마감";
							}else if( dateCompareResult < 0){  // 오늘날짜가 마감일 이전
								rtnStr = bizEndDay;
							}else{
								rtnStr = "오늘 마감";
							}	
						}
					}
				}
			}
		}catch(Exception e){
			System.out.println("CodeConvertUtil.getRecruitStatus EXCEPTION !!!! \n"+e.toString());
		}
		return rtnStr;
	}
	

}
