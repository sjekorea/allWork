/**
 * Push Notification 발송을 위해, 채용공고 또는 이력서의 정보를 구성하는 모델.
 */
package com.ilmagna.allworkadmin.push.domains;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONObject;

import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;
import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;
import com.ilmagna.allworkadmin.api.domains.ApiCategoryModel;
import com.ilmagna.allworkadmin.api.services.ApiCategoryService;

import allwork.common.CommandMap;
import allwork.common.QueryParser;

public class PushRequestModel extends ApiJqGridParams implements Serializable  {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private Integer requestId;						//Push Notification을 발생시키는 채용공고 또는 이력서 ID.
	private String name;							//회사이름 또는 구직자 이름.
	private String title;							//채용공고 제목 또는 이력서 제목.
	private List<String> listBizType;				//직무코드 목록
	private List<String> listArea;					//근무지 코드 목록 또는 희망근무지 코드 목록.

	
	/**
	 * 채용공고에 의한 Push Request 정보 생성.
	 * @param commandMap
	 * @return
	 */
	public static PushRequestModel generateRequestByRecruit(CommandMap commandMap, ApiCategoryService categoryService) {
		PushRequestModel model = new PushRequestModel();

		try {
			int recruitId = ((Long) commandMap.get("no")).intValue();
			//int recruitId = Integer.parseInt((String) commandMap.get("no"));
			String nameRecruit = (String) commandMap.get("bizName");
			String titleRecruit = (String) commandMap.get("bizTitle");
			
			List<String> listBizType = new ArrayList<String>();
			String bizType1 = (String) commandMap.get("bizType1");
			if(!ApiCommonUtils.isNullOrEmpty(bizType1))	listBizType.add(bizType1);
			String bizType4 = (String) commandMap.get("bizType4");
			if(!ApiCommonUtils.isNullOrEmpty(bizType4))	listBizType.add(bizType4);
			String bizType7 = (String) commandMap.get("bizType7");
			if(!ApiCommonUtils.isNullOrEmpty(bizType7))	listBizType.add(bizType7);
			
			List<String> listArea = new ArrayList<String>();
			String bizArea1 = (String) commandMap.get("bizArea1");
			String bizArea2 = (String) commandMap.get("bizArea2");
			if(!isAreaAll(bizArea1, bizArea2)) {
				String strAreaName = getAreaName(bizArea1, bizArea2, categoryService);
				if (!ApiCommonUtils.isNullOrEmpty(strAreaName))	listArea.add(strAreaName);
			}
			String bizArea3 = (String) commandMap.get("bizArea3");
			String bizArea4 = (String) commandMap.get("bizArea4");
			if(!isAreaAll(bizArea3, bizArea4)) {
				String strAreaName = getAreaName(bizArea3, bizArea4, categoryService);
				if (!ApiCommonUtils.isNullOrEmpty(strAreaName))	listArea.add(strAreaName);
			}
			String bizArea5 = (String) commandMap.get("bizArea5");
			String bizArea6 = (String) commandMap.get("bizArea6");
			if(!isAreaAll(bizArea5, bizArea6)) {
				String strAreaName = getAreaName(bizArea5, bizArea6, categoryService);
				if (!ApiCommonUtils.isNullOrEmpty(strAreaName))	listArea.add(strAreaName);
			}
			
			model.setRequestId(recruitId);
			model.setName(nameRecruit);
			model.setTitle(titleRecruit);
			model.setListBizType(listBizType);
			model.setListArea(listArea);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	//주어진 Area Code가 "전체"에 해당하면 true, 아니면 false를 전달한다.
	public static boolean isAreaAll(String strAreaCode1, String strAreaCode2) {
		//2단계까지 정의되지 않은 지역코드, 무시.
		if (ApiCommonUtils.isNullOrEmpty(strAreaCode1) || ApiCommonUtils.isNullOrEmpty(strAreaCode2)) return false;
		
		//1단계 지역코드가 "전체"인 경우, 무시.
		if (strAreaCode1.equalsIgnoreCase(QueryParser.g_AreaCodeAll)) return true;
		
		//2단계 지역코드가 "전체"인 경우, 무시.
		for (int i = 0; i < QueryParser.g_AreaAll.length; i++) {
			if (strAreaCode2.equalsIgnoreCase(QueryParser.g_AreaAll[i])) return true;
		}

		//지역코드가 1, 2 단계까지 전체가 아닌 특정지역으로 설정되어 있음.
		return false;
	}
	
	//주어진 Area Code에 대한 이름 (예: 서울 강남구) 구성 - <Category Code에 정의된 이름, 다음 주소검색에서 전달하는 이름>
	private static final Map<String, String> g_CityName = new HashMap<String, String>() {
        {
            put("서울", "서울");
            put("부산", "부산");
            put("대구", "대구");
            put("광주", "광주");
            put("대전", "대전");
            put("울산", "울산");
            put("인천", "인천");
            put("세종", "세종특별자치시");
            put("경기", "경기");
            put("강원", "강원");
            put("충북", "충북");
            put("충남", "충남");
            put("전북", "전북");
            put("전남", "전남");
            put("경북", "경북");
            put("경남", "경남");
            put("제주", "제주특별자치도");
        }
    };
    
	public static String getAreaName(String strAreaCode1, String strAreaCode2, ApiCategoryService categoryService) {
		String strAreaName = "";
		try {
			//(Step 1) 1단계 지역 이름 획득.
			ApiCategoryModel modelCate = new ApiCategoryModel();
			modelCate.setCode(strAreaCode1);
			ApiCategoryModel model01 = categoryService.getCategory(modelCate);
			if (ApiCommonUtils.isNullOrEmpty(model01.getName())) return "";
			
			//이름 변환.
			strAreaName = g_CityName.get(model01.getName());
			

			//(Step 2) 2단계 지역 이름 획득.
			modelCate = new ApiCategoryModel();
			modelCate.setCode(strAreaCode2);
			ApiCategoryModel model02 = categoryService.getCategory(modelCate);
			if (ApiCommonUtils.isNullOrEmpty(model02.getName())) return "";
			
			//시/군/구 이름만 추출.
			String[] listName02 = model02.getName().split(" ");
			strAreaName += " " + listName02[0];
		} catch (Exception e) {
			e.printStackTrace();
		}

		return strAreaName;
	}


	/**
	 * @return the requestId
	 */
	public Integer getRequestId() {
		return requestId;
	}
	/**
	 * @param requestId the requestId to set
	 */
	public void setRequestId(Integer requestId) {
		this.requestId = requestId;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the listArea
	 */
	public List<String> getListArea() {
		return listArea;
	}
	/**
	 * @param listArea the listArea to set
	 */
	public void setListArea(List<String> listArea) {
		this.listArea = listArea;
	}
	/**
	 * @return the listBizType
	 */
	public List<String> getListBizType() {
		return listBizType;
	}
	/**
	 * @param listBizType the listBizType to set
	 */
	public void setListBizType(List<String> listBizType) {
		this.listBizType = listBizType;
	}
}
