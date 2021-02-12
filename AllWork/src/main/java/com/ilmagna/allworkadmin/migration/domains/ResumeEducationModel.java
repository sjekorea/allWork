package com.ilmagna.allworkadmin.migration.domains;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;
import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;
import com.ilmagna.allworkadmin.api.domains.ApiCategoryModel;
import com.ilmagna.allworkadmin.api.services.ApiCategoryService;

public class ResumeEducationModel extends ApiJqGridParams implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;


	//데이터 항목.
	private Integer final_degree;					//최종학력.
	private String strFinal_degree;
	private List<ResumeEducationItemModel> data;	//학력항목 목록.

	
	/*
	 * Constructor.
	 */
	public ResumeEducationModel() {
		this.final_degree = 0;
		this.strFinal_degree = "";
		this.data = new ArrayList<ResumeEducationItemModel>();
	}
	
	
	/*
	 * JSON 처리.
	 */
	@SuppressWarnings("unchecked")
	public JSONObject getJsonObject() {
		JSONObject obj = new JSONObject();
		try {
			//JSON Object 구성.
			obj.put("final_degree", final_degree);
			obj.put("strFinal_degree", strFinal_degree);

			JSONArray list = new JSONArray();
			for (int i = 0; i < data.size(); i++) {
				list.add(data.get(i).getJsonObject());
			}
			obj.put("data", list);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return obj;
	}

	public String getJsonString() {
		String strResult = "";
		try {
			//JSON Object 구성.
			JSONObject obj = getJsonObject();

			//JSON 문자열 구성.
			strResult = obj.toJSONString();
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return strResult;
	}

	public boolean parseJsonString(String strData) {
		boolean bResult = false;
		try {
			if (ApiCommonUtils.isNullOrEmpty(strData)) return bResult;
			
			//JSON 문자열을 Java Object로 변환.
			JSONParser parser = new JSONParser();
			
			JSONObject jsonObject = (JSONObject) parser.parse(strData);
			
			try {
				Integer final_degree = Integer.parseInt(String.valueOf((Integer) jsonObject.get("final_degree")));
				this.setFinal_degree(final_degree);
			} catch(Exception e2) {}

			String strFinal_degree = (String) jsonObject.get("strFinal_degree");
			this.setStrFinal_degree(strFinal_degree);

			this.data = new ArrayList<ResumeEducationItemModel>();
			JSONArray data = (JSONArray) jsonObject.get("data");
			for (int i = 0; i < data.size(); i++) {
				JSONObject obj = (JSONObject) data.get(i);

				ResumeEducationItemModel dataItem = new ResumeEducationItemModel();
				dataItem.parseJsonObj(obj);
				
				this.data.add(dataItem);
			}
 
			//작업결과 등록.
			bResult = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bResult;
	}

		
	/*
	 * 기존 데이터 파싱.
	 */
	public boolean parseEducation(ApiCategoryService categoryService, String strData) {
		boolean bResult = false;
		try {
			if (ApiCommonUtils.isNullOrEmpty(strData)) return bResult;
			
			//Step 1
			String[] listData = strData.split("____");
			if (listData.length < 2) return bResult;

			try {
				int nSummary = Integer.parseInt(listData[0]);					//-- 최종학력.
				this.setFinal_degree(nSummary);
				this.setStrFinal_degree(getDegree(nSummary));				
			} catch(Exception e2) {}
			//System.out.println("최종학력: " + this.getFinal_degree());
			String strInput = listData[1];
			
			//Step 2
			int pos = strInput.indexOf("{");
			int posLast = strInput.lastIndexOf("}");
			if (pos < 0) return bResult;
			String strProc = strInput.substring(0, pos);
			listData = strProc.split(":");
			if (listData.length < 2) return bResult;

			int nCount = Integer.parseInt(listData[1]);						//--학력항목의 개수.
			//System.out.println("학력항목 개수: " + nCount);

			//Step 3.
			strProc = strInput.substring(pos + 1, posLast);
			int nStartPos = 0;
			for (int i = 0; i < nCount; i++) {
				pos = strProc.indexOf("{", nStartPos);
				posLast = strProc.indexOf("}", pos);
				if(pos < 0 || posLast < 0) continue;
				
				
				ResumeEducationItemModel itemModel = new ResumeEducationItemModel();
				itemModel.setId(i);
				
				String strItem = strProc.substring(pos + 1, posLast);
				String[] data = strItem.split(";");
				for (int j = 0; j < data.length; j += 2) {
					String[] listMeta = data[j].split(":");
					if (listMeta.length < 3) continue;
					
					String strKey = listMeta[2].replaceAll("\"", "");
					if (strKey.equalsIgnoreCase("school")) {				//-- 학교
						String[] listInfo = data[j + 1].split(":");
						if (listInfo.length < 3) continue;
						itemModel.setSchool(listInfo[2].replaceAll("\"", ""));
						//System.out.println("학교: " + itemModel.getSchool());
					}
					else if (strKey.equalsIgnoreCase("lesson")) {			//-- 전공
						String[] listInfo = data[j + 1].split(":");
						if (listInfo.length < 3) continue;
						itemModel.setLesson(listInfo[2].replaceAll("\"", ""));
						//System.out.println("전공: " + itemModel.getLesson());
					}
					else if (strKey.equalsIgnoreCase("lesson2")) {			//-- 학과
						String[] listInfo = data[j + 1].split(":");
						if (listInfo.length < 3) continue;
						itemModel.setLesson2(listInfo[2].replaceAll("\"", ""));
						//System.out.println("학과: " + itemModel.getLesson2());
					}
					else if (strKey.equalsIgnoreCase("lesson_sdate")) {		//-- 입학년도
						String[] listInfo = data[j + 1].split(":");
						if (listInfo.length < 3) continue;
						itemModel.setLesson_sdate(listInfo[2].replaceAll("\"", ""));
						//System.out.println("입학년도: " + itemModel.getLesson_sdate());
					}
					else if (strKey.equalsIgnoreCase("lesson_sdate2")) {	//-- 입학년도 월
						String[] listInfo = data[j + 1].split(":");
						if (listInfo.length < 3) continue;
						itemModel.setLesson_sdate2(listInfo[2].replaceAll("\"", ""));
						//System.out.println("입학월: " + itemModel.getLesson_sdate2());
					}
					else if (strKey.equalsIgnoreCase("lesson_edate")) {		//-- 졸업년도
						String[] listInfo = data[j + 1].split(":");
						if (listInfo.length < 3) continue;
						itemModel.setLesson_edate(listInfo[2].replaceAll("\"", ""));
						//System.out.println("졸업년도: " + itemModel.getLesson_edate());
					}
					else if (strKey.equalsIgnoreCase("lesson_edate2")) {	//-- 졸업년도 월
						String[] listInfo = data[j + 1].split(":");
						if (listInfo.length < 3) continue;
						itemModel.setLesson_edate2(listInfo[2].replaceAll("\"", ""));
						//System.out.println("졸업월: " + itemModel.getLesson_edate2());
					}
					else if (strKey.equalsIgnoreCase("school2")) {			//-- 학위
						String[] listInfo = data[j + 1].split(":");
						if (listInfo.length < 3) continue;
						itemModel.setSchool2(listInfo[2].replaceAll("\"", ""));
						itemModel.setStrDegree(getDegreeByStr(listInfo[2].replaceAll("\"", "")));
						//System.out.println("학위: " + itemModel.getSchool2());
					}
					else if (strKey.equalsIgnoreCase("lesson_state")) {		//-- 상태
						String[] listInfo = data[j + 1].split(":");
						if (listInfo.length < 3) continue;
						itemModel.setLesson_state(listInfo[2].replaceAll("\"", ""));
						itemModel.setStrState(getState(categoryService, listInfo[2].replaceAll("\"", "")));
						//System.out.println("상태: " + itemModel.getLesson_state());
					}
				}
				this.data.add(itemModel);
				
				nStartPos = posLast;
			}
			
			//작업결과 등록.
			bResult = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bResult;
	}

	
	private String getDegree(int nDegree) {
		String strDegree = "";
		
		if (nDegree == 1) strDegree = "고등학교";
		else if (nDegree == 2) strDegree = "전문학사";
		else if (nDegree == 3) strDegree = "학사";
		else if (nDegree == 4) strDegree = "석사";
		else if (nDegree == 5) strDegree =  "박사";
		
		return strDegree;
	}
	private String getDegreeByStr(String strDegree) {
		if (ApiCommonUtils.isNullOrEmpty(strDegree)) return strDegree;
		return getDegree(Integer.parseInt(strDegree));
	}
	private String getState(ApiCategoryService categoryService, String codeState) {
		String strState = "";
		try {
			if (ApiCommonUtils.isNullOrEmpty(codeState)) return strState;
			
			ApiCategoryModel modelCategory = new ApiCategoryModel();
			modelCategory.setCode(codeState);
			modelCategory = categoryService.getCategory(modelCategory);
			if (modelCategory == null) return strState;
			
			strState = modelCategory.getName();
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return strState;
	}
	
	
	/*
	 * 데이터 마이그레이션 - JSON 문자열로 변환.
	 */
	public String migrate() {
		String strResult = "";
		try {
			//JSON 문자열 구성.
			strResult = getJsonString();
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return strResult;
	}
	

	/*
	 * Getters & Setters.
	 */
	/**
	 * @return the final_degree
	 */
	public Integer getFinal_degree() {
		return final_degree;
	}
	/**
	 * @param final_degree the final_degree to set
	 */
	public void setFinal_degree(Integer final_degree) {
		this.final_degree = final_degree;
	}
	/**
	 * @return the strFinal_degree
	 */
	public String getStrFinal_degree() {
		return strFinal_degree;
	}
	/**
	 * @param strFinal_degree the strFinal_degree to set
	 */
	public void setStrFinal_degree(String strFinal_degree) {
		this.strFinal_degree = strFinal_degree;
	}
	/**
	 * @return the data
	 */
	public List<ResumeEducationItemModel> getData() {
		return data;
	}
	/**
	 * @param data the data to set
	 */
	public void setData(List<ResumeEducationItemModel> data) {
		this.data = data;
	}
}
