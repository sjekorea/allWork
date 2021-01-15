package com.ilmagna.allworkadmin.migration.domains;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;
import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;

public class ResumeCareerModel extends ApiJqGridParams implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;

	
	//데이터 항목.
	private Integer total_year;						//전체경력 년수
	private Integer total_month;					//전체경력 월수
	private List<ResumeCareerItemModel> data;	//경력항목 목록.

	
	/*
	 * Constructor.
	 */
	public ResumeCareerModel() {
		this.total_year = 0;
		this.total_month = 0;
		this.data = new ArrayList<ResumeCareerItemModel>();
	}
	
	
	/*
	 * JSON 처리.
	 */
	@SuppressWarnings("unchecked")
	public JSONObject getJsonObject() {
		JSONObject obj = new JSONObject();
		try {
			//JSON Object 구성.
			obj.put("total_year", total_year);
			obj.put("total_month", total_month);

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
				Integer total_year = Integer.parseInt(String.valueOf((Long) jsonObject.get("total_year")));
				this.setTotal_year(total_year);
				
				Integer total_month = Integer.parseInt(String.valueOf((Long) jsonObject.get("total_month")));
				this.setTotal_month(total_month);
			} catch(Exception e2) {}

			this.data = new ArrayList<ResumeCareerItemModel>();
			JSONArray data = (JSONArray) jsonObject.get("data");
			for (int i = 0; i < data.size(); i++) {
				JSONObject obj = (JSONObject) data.get(i);

				ResumeCareerItemModel dataItem = new ResumeCareerItemModel();
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
	public boolean parseCareer(String strData) {
		boolean bResult = false;
		try {
			if (ApiCommonUtils.isNullOrEmpty(strData)) return bResult;
			
			//Step 1
			String[] listData = strData.split("____");
			if (listData.length < 3) return bResult;

			String strYear = listData[0];
			int nTotalYear = 0;
			if(!ApiCommonUtils.isNullOrEmpty(strYear))
				nTotalYear = Integer.parseInt(listData[0]);				//-- 전체경력 - 년.
			this.setTotal_year(nTotalYear);

			String strMonth = listData[1];
			int nTotalMonth = 0;
			if(!ApiCommonUtils.isNullOrEmpty(strMonth))
				nTotalMonth = Integer.parseInt(strMonth);				//-- 전체경력 + 월.
			this.setTotal_month(nTotalMonth);
			//System.out.println("전체경력: " + this.getTotal_year() + "년 " + this.getTotal_month() + "개월");
			String strInput = listData[2];
			
			//Step 2
			int pos = strInput.indexOf("{");
			int posLast = strInput.lastIndexOf("}");
			if (pos < 0) return bResult;
			String strProc = strInput.substring(0, pos);
			listData = strProc.split(":");
			if (listData.length < 2) return bResult;

			int nCount = Integer.parseInt(listData[1]);						//--경력항목의 개수.
			//System.out.println("경력항목 개수: " + nCount);

			//Step 3.
			strProc = strInput.substring(pos + 1, posLast);
			int nStartPos = 0;
			for (int i = 0; i < nCount; i++) {
				pos = strProc.indexOf("{", nStartPos);
				posLast = strProc.indexOf("}", pos);
				if(pos < 0 || posLast < 0) continue;
				
				
				ResumeCareerItemModel itemModel = new ResumeCareerItemModel();
				itemModel.setId(i);

				String strItem = strProc.substring(pos + 1, posLast);
				String[] data = strItem.split(";");
				for (int j = 0; j < data.length; j += 2) {
					String[] listMeta = data[j].split(":");
					if (listMeta.length < 3) continue;
					
					String strKey = listMeta[2].replaceAll("\"", "");
					if (strKey.equalsIgnoreCase("company")) {				//-- 회사명
						String[] listInfo = data[j + 1].split(":");
						if (listInfo.length < 3) continue;
						itemModel.setCompany(listInfo[2].replaceAll("\"", ""));
						//System.out.println("회사명: " + itemModel.getCompany());
					}
					else if (strKey.equalsIgnoreCase("business")) {			//-- 담당업무
						String[] listInfo = data[j + 1].split(":");
						if (listInfo.length < 3) continue;
						itemModel.setBusiness(listInfo[2].replaceAll("\"", ""));
						//System.out.println("담당업무: " + itemModel.getBusiness());
					}
					else if (strKey.equalsIgnoreCase("hold_sdate")) {		//-- 입사년도
						String[] listInfo = data[j + 1].split(":");
						if (listInfo.length < 3) continue;
						itemModel.setHold_sdate(listInfo[2].replaceAll("\"", ""));
						//System.out.println("입사년도: " + itemModel.getHold_sdate());
					}
					else if (strKey.equalsIgnoreCase("hold_sdate2")) {		//-- 입사월
						String[] listInfo = data[j + 1].split(":");
						if (listInfo.length < 3) continue;
						itemModel.setHold_sdate2(listInfo[2].replaceAll("\"", ""));
						//System.out.println("입사월: " + itemModel.getHold_sdate2());
					}
					else if (strKey.equalsIgnoreCase("hold_edate")) {		//-- 퇴사년도
						String[] listInfo = data[j + 1].split(":");
						if (listInfo.length < 3) continue;
						itemModel.setHold_edate(listInfo[2].replaceAll("\"", ""));
						//System.out.println("퇴사년도: " + itemModel.getHold_edate());
					}
					else if (strKey.equalsIgnoreCase("hold_edate2")) {		//-- 퇴사월
						String[] listInfo = data[j + 1].split(":");
						if (listInfo.length < 3) continue;
						itemModel.setHold_edate2(listInfo[2].replaceAll("\"", ""));
						//System.out.println("퇴사월: " + itemModel.getHold_edate2());
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
	 * @return the total_year
	 */
	public Integer getTotal_year() {
		return total_year;
	}
	/**
	 * @param total_year the total_year to set
	 */
	public void setTotal_year(Integer total_year) {
		this.total_year = total_year;
	}
	/**
	 * @return the total_month
	 */
	public Integer getTotal_month() {
		return total_month;
	}
	/**
	 * @param total_month the total_month to set
	 */
	public void setTotal_month(Integer total_month) {
		this.total_month = total_month;
	}
	/**
	 * @return the data
	 */
	public List<ResumeCareerItemModel> getData() {
		return data;
	}
	/**
	 * @param data the data to set
	 */
	public void setData(List<ResumeCareerItemModel> data) {
		this.data = data;
	}
}
