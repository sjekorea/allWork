package com.ilmagna.allworkadmin.admin.common.domains;

/**
 * ListType에 따라서 해당 Select Box를 생성된다. 
 */
public enum ListType {
	//사용자.
	userId("userId"),
	userName("userName"),
	
	
	//채용의뢰기업.
	recruitCompanyCode("recruitCompanyCode"),
	recruitCompanyName("recruitCompanyName"),
	//채용의뢰기업 채용정보.
	recruitItemCode("recruitItemCode"),
	recruitItemName("recruitItemName"),
	
	
	//직종
	bizTypeCode("bizTypeCode"),
	bizTypeName("bizTypeName"),
	//근무지
	bizAreaCode("bizAreaCode"),
	bizAreaName("bizAreaName"),

	
	//게시판 그룹 종류.
	bbsGroupCode("bbsGroupCode"),
	bbsGroupName("bbsGroupName"),
	//게시판 Sub 그룹 종류.
	bbsSubGroupCode("bbsSubGroupCode"),
	bbsSubGroupName("bbsSubGroupName"),
	//게시판  종류.
	bbsCode("bbsCode"),
	bbsName("bbsName"),

	
	//카테고리 코드 종류.
	categoryTypeId("categoryTypeId"),
	categoryTypeName("categoryTypeName");
	
	

	
	private String value;

	ListType(String value) {
		this.value = value;
	}

	public String value() {
		return value;
	}

	public static ListType fromValue(String v) {
		for (ListType s : ListType.values()) {
			if (s.value.equalsIgnoreCase(v))
				return s;
		}
		throw new IllegalArgumentException(v);
	}
}
