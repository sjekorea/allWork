package allwork.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CodeConvertUtil {
	
	// 채용 정보 "성별" ==> biz_sex 항목 
	public static String getBizSex(String bizSex){
		String rtnStr = "";
		try {
			if("man".equals(bizSex)){
				rtnStr = "남";
			}else if("woman".equals(bizSex)){
				rtnStr = "여";
			}else{
				rtnStr = "무관";
			}
		} catch(Exception e) {
			e.printStackTrace();			
		}
		return rtnStr;
	}
	
	
	// 채용 정보  "마감" 항목  ( html 형식으로 return )
	public static String getRecruitStatus(String bizIng, String bizEndType, String bizEndDay){
		
		String rtnStr = "";
		long dateCompareResult = 0;
		String dayOfWeek = "";
		
		try{

			if(!"yes".equals(bizIng)){
				rtnStr = "<p class='deadline deadline01'>채용마감</p>";
			}else{
				if("get".equals(bizEndType)){
					rtnStr = "<p class='deadline deadline04'>채용시까지</p>";
				}else if("often".equals(bizEndType)){
					rtnStr = "<p class='deadline deadline00'>상시채용</p>";
				}else{
					/*
					if("".equals(ConvertUtil.checkNull(bizEndDay))){
						rtnStr = "<p class='deadline deadline00'>상시채용</p>";
					}else{
						if(bizEndDay.length() != 10){
							rtnStr = "<p class='deadline deadline00'>상시채용</p>";
						}else{
							dateCompareResult = DateUtil.getCompareDate(bizEndDay);
							if( dateCompareResult < 0){  // 오늘날짜가 마감일 이후
								rtnStr = "<p class='deadline deadline01'>채용마감</p>";
							}else if( dateCompareResult > 0){  // 오늘날짜가 마감일 이전
								rtnStr = "<p class='deadline deadline02'> ~"+bizEndDay.substring(5)+"("+DateUtil.getDayOfWeek(bizEndDay)+")"+"</p>";
							}else{
								rtnStr = "<p class='deadline deadline00'>오늘 마감</p>";
							}	
						}
					}
					*/
					/*
					//rtnStr = "<p class='deadline deadline02'> ~"+bizEndDay.substring(5)+"("+DateUtil.getDayOfWeek(bizEndDay)+")"+"</p>";
					if("".equals(ConvertUtil.checkNull(bizEndDay))){
						rtnStr = "<p class='deadline deadline00'>미정</p>";
					}else{
						if(bizEndDay.length() != 10){
							rtnStr = "<p class='deadline deadline00'>미정</p>";
						}else{
							dateCompareResult = DateUtil.getCompareDate(bizEndDay);
							if( dateCompareResult < 0){  // 오늘날짜가 마감일 이후
								//rtnStr = "<p class='deadline deadline01'>마감일 경과: " + bizEndDay.substring(5) +"</p>";
								rtnStr = "<p class='deadline deadline01'>" + bizEndDay.substring(5) +"</p>";
							}else if( dateCompareResult > 0){  // 오늘날짜가 마감일 이전
								rtnStr = "<p class='deadline deadline02'> ~"+bizEndDay.substring(5)+"("+DateUtil.getDayOfWeek(bizEndDay)+")"+"</p>";
							}else{
								rtnStr = "<p class='deadline deadline00'>오늘 마감</p>";
							}	
						}
					}*/
					rtnStr = bizEndDay;
				}
			}
		}catch(Exception e){
			System.out.println("CodeConvertUtil.getRecruitStatus EXCEPTION !!!! \n"+e.toString());
		}
		return rtnStr;
	}
	
	
	// 채용 정보  "마감" 항목 ( text로 return )
	public static String getRecruitStatusText(String bizIng, String bizEndType, String bizEndDay){
		
		String rtnStr = "";
		long dateCompareResult = 0;
		String dayOfWeek = "";
		
		try{

			if("no".equals(bizIng)){
				rtnStr = "채용마감";
			}else{
				if("get".equals(bizEndType)){
					rtnStr = "채용시까지";
				}else if("often".equals(bizEndType)){
					rtnStr = "상시채용";
				}else{
					if("".equals(ConvertUtil.checkNull(bizEndDay))){
						rtnStr = "상시채용";
					}else{
						/*
						if(bizEndDay.length() != 10){
							rtnStr = "상시채용";
						}else{
							dateCompareResult = DateUtil.getCompareDate(bizEndDay);
							if( dateCompareResult < 0){  // 오늘날짜가 마감일 이후
								rtnStr = "채용마감";
							}else if( dateCompareResult > 0){  // 오늘날짜가 마감일 이전
								rtnStr = bizEndDay+" ( "+DateUtil.getDayOfWeek(bizEndDay)+"요일 ) 마김일"+(dateCompareResult)+"일전";
							}else{
								rtnStr = "오늘 마감";
							}	
						}
						*/
						rtnStr = bizEndDay;
					}
				}
			}
		}catch(Exception e){
			System.out.println("CodeConvertUtil.getRecruitStatusText EXCEPTION !!!! \n"+e.toString());
		}
		return rtnStr;
	}
	
	
	// 채용 정보  "마감" 항목 ( text로 return - 마감일자만 표시)
	public static String getRecruitStatusTextShort(String bizIng, String bizEndType, String bizEndDay){
		
		String rtnStr = "";
		long dateCompareResult = 0;
		String dayOfWeek = "";
		
		try{

			if(!"yes".equals(bizIng)){
				rtnStr = "채용마감";
			}else{
				if("get".equals(bizEndType)){
					rtnStr = "채용시까지";
				}else if("often".equals(bizEndType)){
					rtnStr = "상시채용";
				}else{
					/*
					if("".equals(ConvertUtil.checkNull(bizEndDay))){
						rtnStr = "상시채용";
					}else{
						if(bizEndDay.length() != 10){
							rtnStr = "상시채용";
						}else{
							dateCompareResult = DateUtil.getCompareDate(bizEndDay);
							if( dateCompareResult < 0){  // 오늘날짜가 마감일 이후
								rtnStr = "채용마감";
							}else if( dateCompareResult > 0){  // 오늘날짜가 마감일 이전
								rtnStr = bizEndDay+" ( "+DateUtil.getDayOfWeek(bizEndDay)+"요일 )";
							}else{
								rtnStr = "오늘 마감";
							}	
						}
					}
					*/
					rtnStr = bizEndDay;
				}
			}
		}catch(Exception e){
			System.out.println("CodeConvertUtil.getRecruitStatusText EXCEPTION !!!! \n"+e.toString());
		}
		return rtnStr;
	}
	
	
	// 채용 정보 "학력" ==> biz_ability 항목 
	public static String getBizAbility(String bizAbility){
		String rtnStr = "";
		try {
			if (bizAbility == null || bizAbility.length() < 1) return rtnStr;
			switch(bizAbility) {
				case "	netfu_63274_88718":
					return "무관";
				case "netfu_41476_98832":
					return "고등학교";
				case "netfu_98974_79615":
					return "전문학사";
				case "netfu_35887_12731":
					return "대졸";
				case "netfu_53810_38809":
					return "석사";
				case "netfu_47451_69200":
					return "박사";
				default:
					break;
			}
			
			int chkValue = ConvertUtil.checkNullToInt(bizAbility);
			
			switch(chkValue){
				case 1 :
					rtnStr = "고등학교";
					break;
				case 2 : 
					rtnStr = "전문학사";
					break;
				case 3 : 
					rtnStr = "학사";
					break;
				case 4 : 
					rtnStr = "석사";
					break;
				case 5 :  
					rtnStr = "박사";
				  	break;
				case 100 : 
					rtnStr = "학력무관";
				  	break;
				default : 
					rtnStr = "";
					break;
			}
		} catch(Exception e) {
			e.printStackTrace();			
		}
		return rtnStr;
	}
	
	// 채용 정보 "학력" ==> biz_ability 항목 
	public static String getBizAbilityShort(String bizAbility){
		String rtnStr = "";
		try {
			if (bizAbility == null || bizAbility.length() < 1) return rtnStr;
			switch(bizAbility) {
				case "	netfu_63274_88718":
					return "무관";
				case "netfu_41476_98832":
					return "고등학교";
				case "netfu_98974_79615":
					return "전문학사";
				case "netfu_35887_12731":
					return "학사";
				case "netfu_53810_38809":
					return "석사";
				case "netfu_47451_69200":
					return "박사";
				default:
					break;
			}
			
			int chkValue = ConvertUtil.checkNullToInt(bizAbility);
			
			switch(chkValue){
				
				case 1 : 
					rtnStr = "고등학교";
					break;
				case 2 : 
					rtnStr = "전문학사";
					break;
				case 3 : 
					rtnStr = "학사";
					break;
				case 4 : 
					rtnStr = "석사";
					break;
				case 5 :  
					rtnStr = "박사";
				  	break;
				case 100 : 
					rtnStr = "무관";
				  	break;
				default : 
					rtnStr = "";
					break;
			}
		} catch(Exception e) {
			e.printStackTrace();			
		}
		return rtnStr;
	}
	
	// 채용 정보 "연령" ==> biz_age 항목 
	public static String getBizAge(String bizAge){
		String rtnStr = "";
		try {
			if("none".equals(bizAge) || bizAge == null || bizAge.length() < 1){
				rtnStr = "무관";
			}else{
				rtnStr = bizAge + "세";				
			}
		} catch(Exception e) {
			e.printStackTrace();			
		}
		return rtnStr;
	}
	
	// 채용정보 "경력" ==> biz_career 항목
	public static String getBizCareer(String bizCareer){
		String rtnStr = "";
		try {
			if("100".equals(bizCareer)){
				rtnStr = "무관";
			}else if("102".equals(bizCareer)){
				rtnStr = "신입";
			}else if("".equals(bizCareer)){
				rtnStr = "";
			}else{
				rtnStr = bizCareer+"년";
			}
		} catch(Exception e) {
			e.printStackTrace();			
		}
		return rtnStr;
	}
	
	// 채용정보 "경력" ==> biz_career 항목
	public static String getBizCareerSplit(String career){
		String rtnStr = "";
		String[] careerArr;
		try {
			if(career.length() > 0){
				careerArr = career.split(",");
				
				if(careerArr.length == 4){
					if(careerArr[0] == "102"){
						rtnStr += "신입";
					}else{
						rtnStr += "경력("+careerArr[1]+"년~"+careerArr[2]+"년)";
					}
					
					if(careerArr[0] != "" && careerArr[3] != null){
						rtnStr += " / 무관";
					}
				}
			}
		} catch(Exception e) {
			e.printStackTrace();			
		}
		return rtnStr;
	}
	
	// 생년월일 정보
	public static String getBirthYear(String birth){
		
		String rtnStr = "00";
		try {
			String[] birthArr;
			if(birth.length() > 4){
				birthArr = birth.split("-");
				rtnStr = birthArr[0];
			}
		} catch(Exception e) {
			e.printStackTrace();			
		}
		return rtnStr;
	}
	
	
	// 현재상태 정보
	public static String getCondition(String condition){
		String rtnStr = "";
		try {
			switch(condition){
				case "1" : 
					rtnStr = "구직희망(미취업)"; break;
				case "2" : 
					rtnStr = "이직희망(재직중)"; break;
				case "3" : 
					rtnStr = "구직희망안함"; break;
				default : 
					rtnStr = ""; break;
			}
		} catch(Exception e) {
			e.printStackTrace();			
		}

		return rtnStr;
	}
	
	
	// 최종 학력 정보
	public static String getLastSchool(String inidLastSchool){
		String rtnStr = "";
		try {
			String lastSchoolArr[];
			
			if(!"".equals(ConvertUtil.checkNull(inidLastSchool)) && inidLastSchool.length() > 0){
				lastSchoolArr = inidLastSchool.split("____");
				
				if(lastSchoolArr.length > 1){
					rtnStr = CodeConvertUtil.getBizAbility(lastSchoolArr[0]);
				}
			}
		} catch(Exception e) {
			e.printStackTrace();			
		}

		return rtnStr;
	}

	
	// 경력 정보
	public static String getTotalCareer(String inidCareer){
		String rtnStr = "";
		try {
			String totalCareerArr[];
			
			if(!"".equals(ConvertUtil.checkNull(inidCareer)) && inidCareer.length() > 0){
				totalCareerArr = inidCareer.split("____");
				
				if(totalCareerArr.length > 2){
					rtnStr = totalCareerArr[0]+"년 "+totalCareerArr[1]+"개월";
				}
			}
		} catch(Exception e) {
			e.printStackTrace();			
		}

		return rtnStr;
	}
	

	
	// 급여정보
	public static String getPayInfo(String payType, String payTypeName, String payName){
		
		String rtnStr = "";
		try {
			if (payType.equalsIgnoreCase("payCheck01")) return "협의";
			rtnStr = payTypeName + " " + payName;
		} catch(Exception e) {
			e.printStackTrace();			
		}
		return rtnStr;
	}

}
