package allwork.common;

import java.util.Map;

import org.apache.log4j.Logger;

import allwork.service.NetfuCateService;

/**
 * 채용정보와 인재정보 검색을 위한 DB Query를 생성하는 개체.
 */
public class QueryParser {
	  
	private static Logger log = Logger.getLogger("QueryParser");

	
	//지역정보 전체에 해당하는 Code 목록.
	private static String g_AreaDomesticAll = "netfu_78942_85121,netfu_73031_43959";
	private static String[] g_AreaAll = {
			  "netfu_1708_all",		"netfu_17301_37117",	"netfu_18659_23866",	"netfu_2279_12233",	"netfu_32425_73309"
			, "netfu_39485_61331",	"netfu_4076_all",		"netfu_42819_10883",	"netfu_4374_all",	"netfu_4729_12233"
			, "netfu_4954_12233",	"netfu_4956_all",		"netfu_5028_all",		"netfu_5271_all",	"netfu_59473_28205"
			, "netfu_6344_all",		"netfu_7191_12233"
	};
	
	//직무정보 전체에 해당하는 Code 목록.
	private static String[] g_BizTypeAll = {
			  "all"
	};

	//산업정보 전체에 해당하는 Code 목록.
	private static String[] g_IndustryAll = {
			  "all"
	};
	
	//경력 무관에 해당하는 Code 목록.
	private static String[] g_CareerAll = {
			  "000"
	};
	private static String[] g_CareerMapBefore = { "001", "002", "010", "020", "030", "040", "050", "060", "070" };
	private static int[] g_CareerMapAfter = { 0, 1, 1, 2, 3, 5, 10, 15, 20 };

	//학력 무관에 해당하는 Code 목록.
	private static String[] g_SchoolAll = {
			  "netfu_63274_88718"
	};
	private static String[] g_SchoolMapBefore = { "netfu_41476_98832", "netfu_98974_79615", "netfu_35887_12731", "netfu_53810_38809", "netfu_47451_69200" };
	private static int[] g_SchoolMapAfter = { 1, 2, 3, 4, 5 };


	/*
	 * [채용정보] 지역별 Query 생성.
	 */
	public static String genQueryRecruitArea(String strInput) {
		String strQuery = "";
		try {
			if (strInput == null || strInput.length() < 1) return strQuery;
			
			//주어진 조건 파싱.
			//	[입력형식] 대분류코드,소분류코드;대분류코드,소분류코드;대분류코드,소분류코드
			String[] listCond = strInput.split(";");
			for (int i = 0; i < listCond.length; i++) {
				if (listCond[i] == null || listCond[i].length() < 1) continue;
				
				//주어진 조건이 전체>국내인 경우, 모든 항목 검색.
				if (listCond[i].equalsIgnoreCase(g_AreaDomesticAll)) return "";

				//구체적인 정보 파싱.
				String[] listItem = listCond[i].split(",");
				if (listItem.length < 2) continue;
				if (listItem[0] == null || listItem[0].length() < 1
						|| listItem[1] == null || listItem[1].length() < 1) continue;
				
				//전체 옵션 판별.
				boolean bAll = false;
				for (int j = 0; j < g_AreaAll.length; j++) {
					if (listItem[1].equalsIgnoreCase(g_AreaAll[j])) {
						bAll = true;
						break;
					}
				}
				
				//DB Query 생성.
				strQuery += (strQuery.length() < 1)? "(" : " OR ";
				if (bAll) {
					strQuery += "nic.biz_area1 = '" + listItem[0] + "' OR nic.biz_area3 = '" + listItem[0] + "' OR nic.biz_area5 = '" + listItem[0] + "'";
				} else {
					strQuery += "nic.biz_area2 = '" + listItem[1] + "' OR nic.biz_area4 = '" + listItem[1] + "' OR nic.biz_area6 = '" + listItem[1] + "'";					
				}
			}
			if (strQuery != null && strQuery.length() > 0) strQuery += ")";
		}catch(Exception e){
			e.printStackTrace();
			log.info("genQueryRecruitArea Exception !!!!! \n" + e.toString());
		}
		return strQuery;
	}
	
	/*
	 * [채용정보] 직무별 Query 생성.
	 */
	public static String genQueryRecruitBizType(String strInput) {
		String strQuery = "";
		try {
			if (strInput == null || strInput.length() < 1) return strQuery;
			
			//주어진 조건 파싱.
			//	[입력형식] 대분류코드,중분류코드,소분류코드;대분류코드,중분류코드,소분류코드;대분류코드,중분류코드,소분류코드
			String[] listCond = strInput.split(";");
			for (int i = 0; i < listCond.length; i++) {
				if (listCond[i] == null || listCond[i].length() < 1) continue;

				//구체적인 정보 파싱.
				String[] listItem = listCond[i].split(",");
				if (listItem.length < 3) continue;
				if (listItem[0] == null || listItem[0].length() < 1
						|| listItem[1] == null || listItem[1].length() < 1
						|| listItem[2] == null || listItem[2].length() < 1) continue;
				
				//전체 옵션 판별.
				int nAllStep = 3;
				for (int j = 0; j < g_BizTypeAll.length; j++) {
					if (listItem[1].equalsIgnoreCase(g_BizTypeAll[j])) {
						nAllStep = 1;
						break;
					}
					if (listItem[2].equalsIgnoreCase(g_BizTypeAll[j])) {
						nAllStep = 2;
						break;
					}
				}
				
				//DB Query 생성.
				strQuery += (strQuery.length() < 1)? "(" : " OR ";
				if (nAllStep == 1) {
					strQuery += "nic.biz_type1 = '" + listItem[0] + "' OR nic.biz_type4 = '" + listItem[0] + "' OR nic.biz_type7 = '" + listItem[0] + "'";
				} else if (nAllStep == 2) {
					strQuery += "nic.biz_type2 = '" + listItem[1] + "' OR nic.biz_type5 = '" + listItem[1] + "' OR nic.biz_type8 = '" + listItem[1] + "'";					
				} else {
					strQuery += "nic.biz_type3 = '" + listItem[2] + "' OR nic.biz_type6 = '" + listItem[2] + "' OR nic.biz_type9 = '" + listItem[2] + "'";					
				}
			}
			if (strQuery != null && strQuery.length() > 0) strQuery += ")";
		}catch(Exception e){
			e.printStackTrace();
			log.info("genQueryRecruitBizType Exception !!!!! \n" + e.toString());
		}
		return strQuery;
	}

	/*
	 * [채용정보] 산업별 Query 생성.
	 */
	//산업정보 전체에 해당하는 Code 목록.
	public static String genQueryRecruitIndustry(String strInput) {
		String strQuery = "";
		try {
			if (strInput == null || strInput.length() < 1) return strQuery;
			
			//주어진 조건 파싱.
			//	[입력형식] 대분류코드,중분류코드,소분류코드;대분류코드,중분류코드,소분류코드;대분류코드,중분류코드,소분류코드
			String[] listCond = strInput.split(";");
			for (int i = 0; i < listCond.length; i++) {
				if (listCond[i] == null || listCond[i].length() < 1) continue;

				//구체적인 정보 파싱.
				String[] listItem = listCond[i].split(",");
				if (listItem.length < 3) continue;
				if (listItem[0] == null || listItem[0].length() < 1
						|| listItem[1] == null || listItem[1].length() < 1
						|| listItem[2] == null || listItem[2].length() < 1) continue;
				
				//전체 옵션 판별.
				int nAllStep = 3;
				for (int j = 0; j < g_IndustryAll.length; j++) {
					if (listItem[1].equalsIgnoreCase(g_IndustryAll[j])) {
						nAllStep = 1;
						break;
					}
					if (listItem[2].equalsIgnoreCase(g_IndustryAll[j])) {
						nAllStep = 2;
						break;
					}
				}
				
				//DB Query 생성.
				strQuery += (strQuery.length() < 1)? "(" : " OR ";
				if (nAllStep == 1) {
					strQuery += "nic.biz_area_job1 = '" + listItem[0] + "' OR nic.biz_area_job4 = '" + listItem[0] + "' OR nic.biz_area_job7 = '" + listItem[0] + "'";
				} else if (nAllStep == 2) {
					strQuery += "nic.biz_area_job2 = '" + listItem[1] + "' OR nic.biz_area_job5 = '" + listItem[1] + "' OR nic.biz_area_job8 = '" + listItem[1] + "'";					
				} else {
					strQuery += "nic.biz_area_job3 = '" + listItem[2] + "' OR nic.biz_area_job6 = '" + listItem[2] + "' OR nic.biz_area_job9 = '" + listItem[2] + "'";					
				}
			}
			if (strQuery != null && strQuery.length() > 0) strQuery += ")";
		}catch(Exception e){
			e.printStackTrace();
			log.info("genQueryRecruitIndustry Exception !!!!! \n" + e.toString());
		}
		return strQuery;
	}

	


	/*
	 * [인재정보] 지역별 Query 생성.
	 */
	public static String genQueryResumeArea(String strInput) {
		String strQuery = "";
		try {
			if (strInput == null || strInput.length() < 1) return strQuery;
			
			//주어진 조건 파싱.
			//	[입력형식] 대분류코드,소분류코드;대분류코드,소분류코드;대분류코드,소분류코드
			String[] listCond = strInput.split(";");
			for (int i = 0; i < listCond.length; i++) {
				if (listCond[i] == null || listCond[i].length() < 1) continue;
				
				//주어진 조건이 전체>국내인 경우, 모든 항목 검색.
				if (listCond[i].equalsIgnoreCase(g_AreaDomesticAll)) return "";

				//구체적인 정보 파싱.
				String[] listItem = listCond[i].split(",");
				if (listItem.length < 2) continue;
				if (listItem[0] == null || listItem[0].length() < 1
						|| listItem[1] == null || listItem[1].length() < 1) continue;
				
				//전체 옵션 판별.
				boolean bAll = false;
				for (int j = 0; j < g_AreaAll.length; j++) {
					if (listItem[1].equalsIgnoreCase(g_AreaAll[j])) {
						bAll = true;
						break;
					}
				}
				
				//DB Query 생성.
				strQuery += (strQuery.length() < 1)? "(" : " OR ";
				if (bAll) {
					strQuery += "nir.inid_area1 = '" + listItem[0] + "' OR nir.inid_area3 = '" + listItem[0] + "' OR nir.inid_area5 = '" + listItem[0] + "'";
				} else {
					strQuery += "nir.inid_area2 = '" + listItem[1] + "' OR nir.inid_area4 = '" + listItem[1] + "' OR nir.inid_area6 = '" + listItem[1] + "'";					
				}
			}
			if (strQuery != null && strQuery.length() > 0) strQuery += ")";
		}catch(Exception e){
			e.printStackTrace();
			log.info("genQueryResumeArea Exception !!!!! \n" + e.toString());
		}
		return strQuery;
	}
	
	/*
	 * [인재정보] 직무별 Query 생성.
	 */
	public static String genQueryResumeBizType(String strInput) {
		String strQuery = "";
		try {
			if (strInput == null || strInput.length() < 1) return strQuery;
			
			//주어진 조건 파싱.
			//	[입력형식] 대분류코드,중분류코드,소분류코드;대분류코드,중분류코드,소분류코드;대분류코드,중분류코드,소분류코드
			String[] listCond = strInput.split(";");
			for (int i = 0; i < listCond.length; i++) {
				if (listCond[i] == null || listCond[i].length() < 1) continue;

				//구체적인 정보 파싱.
				String[] listItem = listCond[i].split(",");
				if (listItem.length < 3) continue;
				if (listItem[0] == null || listItem[0].length() < 1
						|| listItem[1] == null || listItem[1].length() < 1
						|| listItem[2] == null || listItem[2].length() < 1) continue;
				
				//전체 옵션 판별.
				int nAllStep = 3;
				for (int j = 0; j < g_BizTypeAll.length; j++) {
					if (listItem[1].equalsIgnoreCase(g_BizTypeAll[j])) {
						nAllStep = 1;
						break;
					}
					if (listItem[2].equalsIgnoreCase(g_BizTypeAll[j])) {
						nAllStep = 2;
						break;
					}
				}
				
				//DB Query 생성.
				strQuery += (strQuery.length() < 1)? "(" : " OR ";
				if (nAllStep == 1) {
					strQuery += "nir.inid_type1 = '" + listItem[0] + "' OR nir.inid_type4 = '" + listItem[0] + "' OR nir.inid_type7 = '" + listItem[0] + "'";
				} else if (nAllStep == 2) {
					strQuery += "nir.inid_type2 = '" + listItem[1] + "' OR nir.inid_type5 = '" + listItem[1] + "' OR nir.inid_type8 = '" + listItem[1] + "'";					
				} else {
					strQuery += "nir.inid_type3 = '" + listItem[2] + "' OR nir.inid_type6 = '" + listItem[2] + "' OR nir.inid_type9 = '" + listItem[2] + "'";					
				}
			}
			if (strQuery != null && strQuery.length() > 0) strQuery += ")";
		}catch(Exception e){
			e.printStackTrace();
			log.info("genQueryResumeBizType Exception !!!!! \n" + e.toString());
		}
		return strQuery;
	}

	/*
	 * [인재정보] 산업별 Query 생성.
	 */
	public static String genQueryResumeIndustry(String strInput) {
		String strQuery = "";
		try {
			if (strInput == null || strInput.length() < 1) return strQuery;
			
			//주어진 조건 파싱.
			//	[입력형식] 대분류코드,중분류코드,소분류코드;대분류코드,중분류코드,소분류코드;대분류코드,중분류코드,소분류코드
			String[] listCond = strInput.split(";");
			for (int i = 0; i < listCond.length; i++) {
				if (listCond[i] == null || listCond[i].length() < 1) continue;

				//구체적인 정보 파싱.
				String[] listItem = listCond[i].split(",");
				if (listItem.length < 3) continue;
				if (listItem[0] == null || listItem[0].length() < 1
						|| listItem[1] == null || listItem[1].length() < 1
						|| listItem[2] == null || listItem[2].length() < 1) continue;
				
				//전체 옵션 판별.
				int nAllStep = 3;
				for (int j = 0; j < g_IndustryAll.length; j++) {
					if (listItem[1].equalsIgnoreCase(g_IndustryAll[j])) {
						nAllStep = 1;
						break;
					}
					if (listItem[2].equalsIgnoreCase(g_IndustryAll[j])) {
						nAllStep = 2;
						break;
					}
				}
				
				//DB Query 생성.
				strQuery += (strQuery.length() < 1)? "(" : " OR ";
				if (nAllStep == 1) {
					strQuery += "nir.inid_area_job1 = '" + listItem[0] + "' OR nir.inid_area_job4 = '" + listItem[0] + "' OR nir.inid_area_job7 = '" + listItem[0] + "'";
				} else if (nAllStep == 2) {
					strQuery += "nir.inid_area_job2 = '" + listItem[1] + "' OR nir.inid_area_job5 = '" + listItem[1] + "' OR nir.inid_area_job8 = '" + listItem[1] + "'";					
				} else {
					strQuery += "nir.inid_area_job3 = '" + listItem[2] + "' OR nir.inid_area_job6 = '" + listItem[2] + "' OR nir.inid_area_job9 = '" + listItem[2] + "'";					
				}
			}
			if (strQuery != null && strQuery.length() > 0) strQuery += ")";
		}catch(Exception e){
			e.printStackTrace();
			log.info("genQueryResumeIndustry Exception !!!!! \n" + e.toString());
		}
		return strQuery;
	}

	/*
	 * [인재정보] 자격증 Query 생성.
	 */
	public static String genQueryResumeLicense(String strInput, NetfuCateService netfuCateService) {
		String strQuery = "";
		try {
			if (strInput == null || strInput.length() < 1) return strQuery;

			//주어진 조건 파싱.
			//	[입력형식] 대분류코드,중분류코드,소분류코드;대분류코드,중분류코드,소분류코드;대분류코드,중분류코드,소분류코드
			String[] listCond = strInput.split(";");
			for (int i = 0; i < listCond.length; i++) {
				if (listCond[i] == null || listCond[i].length() < 1) continue;

				//구체적인 정보 파싱.
				String[] listItem = listCond[i].split(",");
				if (listItem.length < 3) continue;
				if (listItem[0] == null || listItem[0].length() < 1
						|| listItem[1] == null || listItem[1].length() < 1
						|| listItem[2] == null || listItem[2].length() < 1) continue;
				
				String strNameLicense = "";
				try {
					CommandMap commandMap = new CommandMap();
					commandMap.put("code", listItem[2]);
					Map<String, Object> jobList = netfuCateService.selectNetfuCateMap(commandMap.getMap());
					if (jobList != null && !jobList.isEmpty())
						strNameLicense = (String) jobList.get("name");
				} catch(Exception e1) {
					e1.printStackTrace();
				}

				//DB Query 생성.
				strQuery += (strQuery.length() < 1)? "(" : " OR ";
				strQuery += "nir.license2 LIKE '%\"qualification\":\"" + listItem[2] + "\"%'";
				if (strNameLicense != null && strNameLicense.length() > 0)
					strQuery += " OR nir.license2 LIKE '%\"qualification\":\"" + strNameLicense + "\"%'";
			}
			if (strQuery != null && strQuery.length() > 0) strQuery += ")";
		}catch(Exception e){
			e.printStackTrace();
			log.info("genQueryResumeLicense Exception !!!!! \n" + e.toString());
		}
		return strQuery;
	}

	/*
	 * [인재정보] 경력 Query 생성.
	 */
	public static String genQueryResumeCareer(String strInput) {
		String strQuery = "";
		try {
			if (strInput == null || strInput.length() < 1) return strQuery;
			
			//주어진 조건 파싱.
			//	[입력형식] 분류코드;분류코드;분류코드
			String[] listCond = strInput.split(";");
			for (int i = 0; i < listCond.length; i++) {
				if (listCond[i] == null || listCond[i].length() < 1) continue;
				
				//전체 옵션 판별.
				for (int j = 0; j < g_CareerAll.length; j++) {
					if (listCond[i].equalsIgnoreCase(g_CareerAll[j])) return "";
				}

				//검색하려는 Level 조사.
				int nLevel = -1;
				for (int j = 0; j < g_CareerMapBefore.length; j++) {
					if (listCond[i].equalsIgnoreCase(g_CareerMapBefore[j])) {
						nLevel = j;
						break;
					}
				}

				//DB Query 생성.
				if (nLevel >= 0) {
					strQuery += (strQuery.length() < 1)? "(" : " OR ";
					if (nLevel == 0) {
						strQuery += "nir.career_total < 1";
					} else if (nLevel == 1) {
						strQuery += "nir.career_total <= 1";
					} else {
						strQuery += "nir.career_total >= " + g_CareerMapAfter[nLevel];
					}
				}
			}
			if (strQuery != null && strQuery.length() > 0) strQuery += ")";
		}catch(Exception e){
			e.printStackTrace();
			log.info("genQueryResumeCareer Exception !!!!! \n" + e.toString());
		}
		return strQuery;
	}

	/*
	 * [인재정보] 학력 Query 생성.
	 */
	public static String genQueryResumeSchool(String strInput) {
		String strQuery = "";
		try {
			if (strInput == null || strInput.length() < 1) return strQuery;
			
			//주어진 조건 파싱.
			//	[입력형식] 분류코드;분류코드;분류코드
			String[] listCond = strInput.split(";");
			int nQueryLevel = 99;								//무관.
			for (int i = 0; i < listCond.length; i++) {
				if (listCond[i] == null || listCond[i].length() < 1) continue;
				
				//전체 옵션 판별.
				for (int j = 0; j < g_SchoolAll.length; j++) {
					if (listCond[i].equalsIgnoreCase(g_SchoolAll[j])) return "";
				}
				//검색하려는 Level 조사.
				int nLevel = 99;
				for (int j = 0; j < g_SchoolMapBefore.length; j++) {
					if (listCond[i].equalsIgnoreCase(g_SchoolMapBefore[j])) {
						nLevel = g_SchoolMapAfter[j];
						break;
					}
				}
				if (nQueryLevel > nLevel) nQueryLevel = nLevel;
			}

			//DB Query 생성.
			if (nQueryLevel <= 0 || nQueryLevel >= 99) return "";	//무관.
			strQuery = "";
			for (int i = nQueryLevel; i <= 5; i++) {
				strQuery += (strQuery.length() < 1)? "(" : " OR ";
				strQuery += "nir.education2 LIKE '%\"final_degree\":\"" + i + "\"%' OR nir.education2 LIKE '%\"final_degree\":" + i + "%' ";				
			}
			if (strQuery != null && strQuery.length() > 0) strQuery += ")";
		}catch(Exception e){
			e.printStackTrace();
			log.info("genQueryResumeSchool Exception !!!!! \n" + e.toString());
		}
		return strQuery;
	}

	/*
	 * [인재정보] 고용형태 Query 생성.
	 */
	public static String genQueryResumeJobForm(String strInput) {
		String strQuery = "";
		try {
			if (strInput == null || strInput.length() < 1) return strQuery;
			
			//주어진 조건 파싱.
			//	[입력형식] 분류코드;분류코드;분류코드
			String[] listCond = strInput.split(";");
			for (int i = 0; i < listCond.length; i++) {
				if (listCond[i] == null || listCond[i].length() < 1) continue;
				
				//DB Query 생성.
				strQuery += (strQuery.length() < 1)? "(" : " OR ";
				strQuery += "nir.inid_jobform LIKE '%" + listCond[i] + "%'";
			}
			if (strQuery != null && strQuery.length() > 0) strQuery += ")";
		}catch(Exception e){
			e.printStackTrace();
			log.info("genQueryResumeJobForm Exception !!!!! \n" + e.toString());
		}
		return strQuery;
	}

	/*
	 * [인재정보] 급여 Query 생성.
	 */
	public static String genQueryResumePay(String strInput) {
		String strQuery = "";
		try {
			if (strInput == null || strInput.length() < 1) return strQuery;
			
			//주어진 조건 파싱.
			//	[입력형식] 분류코드;분류코드;분류코드
			String[] listCond = strInput.split(";");
			for (int i = 0; i < listCond.length; i++) {
				if (listCond[i] == null || listCond[i].length() < 1) continue;
				
				//DB Query 생성.
				strQuery += (strQuery.length() < 1)? "(" : " OR ";
				strQuery += "nir.inid_pay = '" + listCond[i] + "'";
			}
			if (strQuery != null && strQuery.length() > 0) strQuery += ")";
		}catch(Exception e){
			e.printStackTrace();
			log.info("genQueryResumePay Exception !!!!! \n" + e.toString());
		}
		return strQuery;
	}
}
