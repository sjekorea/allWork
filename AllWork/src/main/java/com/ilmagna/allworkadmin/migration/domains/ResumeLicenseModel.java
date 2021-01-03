package com.ilmagna.allworkadmin.migration.domains;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;
import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;

public class ResumeLicenseModel extends ApiJqGridParams implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;

	
	//데이터 항목.
	private List<ResumeLicenseItemModel> data;	//자격증 항목 목록.

	
	/*
	 * Constructor.
	 */
	public ResumeLicenseModel() {
		this.data = new ArrayList<ResumeLicenseItemModel>();
	}
	
	
	/*
	 * JSON 처리.
	 */
	@SuppressWarnings("unchecked")
	public JSONObject getJsonObject() {
		JSONObject obj = new JSONObject();
		try {
			//JSON Object 구성.
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
			
			this.data = new ArrayList<ResumeLicenseItemModel>();
			JSONArray data = (JSONArray) jsonObject.get("data");
			for (int i = 0; i < data.size(); i++) {
				JSONObject obj = (JSONObject) data.get(i);

				ResumeLicenseItemModel dataItem = new ResumeLicenseItemModel();
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
	public boolean parseLicense(String strData) {
		boolean bResult = false;
		try {
			if (ApiCommonUtils.isNullOrEmpty(strData)) return bResult;
			
			//Step 2
			int pos = strData.indexOf("{");
			int posLast = strData.lastIndexOf("}");
			if (pos < 0) return bResult;
			String strProc = strData.substring(0, pos);
			String[] listData = strProc.split(":");
			if (listData.length < 2) return bResult;

			int nCount = Integer.parseInt(listData[1]);						//--자격증명 항목의 개수.
			//System.out.println("자갹증명 항목의 개수: " + nCount);

			//Step 3.
			strProc = strData.substring(pos + 1, posLast);
			int nStartPos = 0;
			for (int i = 0; i < nCount; i++) {
				pos = strProc.indexOf("{", nStartPos);
				posLast = strProc.indexOf("}", pos);
				if(pos < 0 || posLast < 0) continue;
				
				
				ResumeLicenseItemModel itemModel = new ResumeLicenseItemModel();
				itemModel.setId(i);

				String strItem = strProc.substring(pos + 1, posLast);
				String[] data = strItem.split(";");
				for (int j = 0; j < data.length; j += 2) {
					String[] listMeta = data[j].split(":");
					if (listMeta.length < 3) continue;

					String strKey = listMeta[2].replaceAll("\"", "");
					if (strKey.equalsIgnoreCase("qualification")) {			//-- 자격증
						String[] listInfo = data[j + 1].split(":");
						if (listInfo.length < 3) continue;
						itemModel.setQualification(listInfo[2].replaceAll("\"", ""));
						//System.out.println("자격증: " + itemModel.getQualification());
					}
					else if (strKey.equalsIgnoreCase("public_place")) {		//-- 발행처
						String[] listInfo = data[j + 1].split(":");
						if (listInfo.length < 3) continue;
						itemModel.setPublic_place(listInfo[2].replaceAll("\"", ""));
						//System.out.println("발행처: " + itemModel.getPublic_place());
					}
					else if (strKey.equalsIgnoreCase("obtain_date")) {		//-- 취득일자
						String[] listInfo = data[j + 1].split(":");
						if (listInfo.length < 3) continue;
						itemModel.setObtain_date(listInfo[2].replaceAll("\"", ""));
						//System.out.println("취득일자: " + itemModel.getObtain_date());
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
	 * @return the data
	 */
	public List<ResumeLicenseItemModel> getData() {
		return data;
	}
	/**
	 * @param data the data to set
	 */
	public void setData(List<ResumeLicenseItemModel> data) {
		this.data = data;
	}
}
