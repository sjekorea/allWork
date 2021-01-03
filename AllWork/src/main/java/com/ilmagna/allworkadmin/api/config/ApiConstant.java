package com.ilmagna.allworkadmin.api.config;

public class ApiConstant {

	public static final Integer USER_TYPE_USER = 1;			//개인회원.
	public static final Integer USER_TYPE_COMPANY = 2;		//기업회원.
	public static final Integer USER_TYPE_ADMIN = 3;		//관리자회원.

	public static class Result {
		public static final String RESULT_CODE_KEY = "status";	// "result";
		
		public static final String RESULT_SUCCESS =	"1";		// "success";
		public static final String RESULT_ERROR = "0";			// "error";
		//public static final String RESULT_FAIL = "fail";
			

		public static final String RESULT_ID = "id";
		public static final String RESULT_USER_TYPE = "user_type";
		public static final String RESULT_USER_ID = "user_id";
		public static final String RESULT_TOKEN = "token";
		public static final String RESULT_USER_NAME = "user_name";
		public static final String RESULT_USER_PW = "user_pw";

		public static final String RESULT_ENTITY = "entity";
		public static final String RESULT_META = "meta";
		public static final String RESULT_DATA = "data";
		
		public static final String RESULT_EXISTS = "exists";
		public static final String RESULT_LOGGED_IN = "logged_in";
		

		public static final String RESULT_RESULT_MSG = "resultMsg";
		public static final String RESULT_ERROR_MSG = "errorMsg";
		
		public static final String RESULT_ERROR_CODE = "errorCode";

		public static final Boolean RESULT_YES = true;
		public static final Boolean RESULT_NO = false;

		
		public static final String RESULT_ROW_KEY = "row";
		public static final String RESULT_ROWS_KEY = "rows";
		public static final String RESULT_CODE_ROWS_KEY = "codeRows";
		public static final String RESULT_ID_KEY = "id";
		public static final String RESULT_CHK_IS_DUP = "resultChkIsDup";
		
		public static final String USER_SESSION_KEY = "userSession";
	}


	public static final long ACCESS_TOKEN_VALIDITY_SECONDS = 5*60*60;
	public static final String SIGNING_KEY = "mancred";
	public static final String TOKEN_PREFIX = "Bearer ";
	public static final String HEADER_STRING = "Authorization";
	public static final String AUTHORITIES_KEY = "scopes";

	
	public static final Integer REQUEST_TYPE_SALES = 0;			//매출 데이터 수시전송(Default)
	public static final Integer REQUEST_TYPE_DAILY = 1;			//매출 데이터 일마감 전송.
	public static final Integer REQUEST_TYPE_PURCHASE = 2;		//매입 데이터 전송.

	public static final Integer REQUEST_ACTION_ADD = 0;			//신규 데이터 등록.
	public static final Integer REQUEST_ACTION_UPDATE = 1;		//기존 데이터 수정.
}
