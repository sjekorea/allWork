package com.ilmagna.allworkadmin.push.domains;

import java.io.Serializable;

import org.json.simple.JSONObject;

import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;

public class PushItemModel extends ApiJqGridParams implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private Integer id;
	private Integer type;			//메시지 종류.	1 = 채용공고,		2 = 이력서,		3 = 면접요청.
	private Integer ref_id;			//			채용공고 ID			이력서 ID			채용공고 ID
	private String name;			//			회사이름			구직자 이음			회사이름
	private String title;			//			채용공고 제목		이력서 제목			채용공고 제목
	//private String detail;			//			핵심내용			보유기술
	private String wdate;			//			등록일			등록일			등록일
	private Long wtimestamp;		//			등록일 Timestamp	등록일 Timestamp	등록일 Timestamp

	private String uid;				//			수신자 사용자 ID.

	public PushItemModel() {
		this.id = 0;
		this.type = 0;
		this.ref_id = 0;
		this.name = "";
		this.title = "";
		//this.detail = "";
		this.wdate = "";
		this.wtimestamp = 0L;
	}
	
	
	/*
	 * JSON 처리.
	 */
	@SuppressWarnings("unchecked")
	public JSONObject getJsonObject() {
		JSONObject obj = new JSONObject();
		try {
			//JSON Object 구성.
			obj.put("id", id);
			obj.put("type", type);
			obj.put("ref_id", ref_id);
			obj.put("name", name);
			obj.put("title", title);
			//obj.put("detail", detail);
			obj.put("wdate", wdate);
			obj.put("wtimestamp", wtimestamp);
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

	
	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * @return the type
	 */
	public Integer getType() {
		return type;
	}
	/**
	 * @param type the type to set
	 */
	public void setType(Integer type) {
		this.type = type;
	}
	/**
	 * @return the ref_id
	 */
	public Integer getRef_id() {
		return ref_id;
	}
	/**
	 * @param ref_id the ref_id to set
	 */
	public void setRef_id(Integer ref_id) {
		this.ref_id = ref_id;
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
	 * @return the detail
	 */
	//public String getDetail() {
	//	return detail;
	//}
	/**
	 * @param detail the detail to set
	 */
	//public void setDetail(String detail) {
	//	this.detail = detail;
	//}
	/**
	 * @return the wdate
	 */
	public String getWdate() {
		return wdate;
	}
	/**
	 * @param wdate the wdate to set
	 */
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	/**
	 * @return the wtimestamp
	 */
	public Long getWtimestamp() {
		return wtimestamp;
	}
	/**
	 * @param wtimestamp the wtimestamp to set
	 */
	public void setWtimestamp(Long wtimestamp) {
		this.wtimestamp = wtimestamp;
	}

	/**
	 * @return the uid
	 */
	public String getUid() {
		return uid;
	}
	/**
	 * @param uid the uid to set
	 */
	public void setUid(String uid) {
		this.uid = uid;
	}
}
