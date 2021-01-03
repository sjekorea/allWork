package com.ilmagna.allworkadmin.api.config;

import java.util.HashMap;
import java.util.Map;

public class ApiErrorMsg {
	public static final Map<Integer, String> errorMsgMap = new HashMap<Integer, String>();

	static {
		//공통.
		errorMsgMap.put(ApiErrorCode.ECODE_INTERNAL_EXCEPTION, "[Internal Error] 작업 수행중에 Exception 발생");
		errorMsgMap.put(ApiErrorCode.ECODE_INVALID_FORM_DATA, "입력 데이터 오류.");
		errorMsgMap.put(ApiErrorCode.ECODE_LOGIN_REQUIRED, "Login이 필요한 기능입니다. 먼저 Login을 하세요.");
		errorMsgMap.put(ApiErrorCode.ECODE_UNDER_CONSTRUCTION, "구현중 - 미구현.");

		//Login/Logout
		errorMsgMap.put(ApiErrorCode.ECODE_LOGIN_INVALID_ACCOUNT, "사용자 ID 또는 비밀번호가 일치하지 않습니다.");
		errorMsgMap.put(ApiErrorCode.ECODE_LOGIN_ROLE_FAIL, "[Internal Error] 회원 사용자 유형이 존재하지 않습니다.");
		errorMsgMap.put(ApiErrorCode.ECODE_LOGIN_INVALID_ACCOUNT, "사용자 ID 또는 비밀번호가 일치하지 않습니다.");
		errorMsgMap.put(ApiErrorCode.ECODE_LOGIN_INVALID_ACCOUNT, "사용자 ID 또는 비밀번호가 일치하지 않습니다.");

		//관리자 권한 관리.
		errorMsgMap.put(ApiErrorCode.ECODE_ADMIN_ROLE_FIND_FAIL, "관리자 권한이 존재하지 않습니다.");
		errorMsgMap.put(ApiErrorCode.ECODE_ADMIN_ROLE_DUPLICATED, "관리자 권한 ID가 존재합니다. 다른 ID를 사용하세요.");
		errorMsgMap.put(ApiErrorCode.ECODE_ADMIN_ROLE_UPDATE_FIND_FAIL, "수정하려는 관리자 권한 정보가 존재하지 않습니다.");
		errorMsgMap.put(ApiErrorCode.ECODE_ADMIN_ROLE_DELETE_FIND_FAIL, "삭제하려는 관리자 권한 정보가 존재하지 않습니다.");
		
		//관리자  관리.
		errorMsgMap.put(ApiErrorCode.ECODE_ADMIN_FIND_FAIL, "관리자가 존재하지 않습니다.");
		errorMsgMap.put(ApiErrorCode.ECODE_ADMIN_DUPLICATED, "관리자 ID가 존재합니다. 다른 ID를 사용하세요.");
		errorMsgMap.put(ApiErrorCode.ECODE_ADMIN_UPDATE_FIND_FAIL, "수정하려는 관리자 정보가 존재하지 않습니다.");
		errorMsgMap.put(ApiErrorCode.ECODE_ADMIN_DELETE_FIND_FAIL, "삭제하려는 관리자 정보가 존재하지 않습니다.");
		
		//사용자 유형 관리.
		errorMsgMap.put(ApiErrorCode.ECODE_USER_ROLE_FIND_FAIL, "사용자 유형이 존재하지 않습니다.");
		errorMsgMap.put(ApiErrorCode.ECODE_USER_ROLE_DUPLICATED, "사용자 유형 ID가 존재합니다. 다른 ID를 사용하세요.");
		errorMsgMap.put(ApiErrorCode.ECODE_USER_ROLE_UPDATE_FIND_FAIL, "수정하려는 사용자 유형 정보가 존재하지 않습니다.");
		errorMsgMap.put(ApiErrorCode.ECODE_USER_ROLE_DELETE_FIND_FAIL, "삭제하려는 사용자 유형 정보가 존재하지 않습니다.");
		
		//사용자  관리.
		errorMsgMap.put(ApiErrorCode.ECODE_USER_FIND_FAIL, "사용자 정보가 존재하지 않습니다.");
		errorMsgMap.put(ApiErrorCode.ECODE_USER_DUPLICATED, "사용자 ID가 존재합니다. 다른 ID를 사용하세요.");
		errorMsgMap.put(ApiErrorCode.ECODE_USER_UPDATE_FIND_FAIL, "수정하려는 사용자 정보가 존재하지 않습니다.");
		errorMsgMap.put(ApiErrorCode.ECODE_USER_DELETE_FIND_FAIL, "삭제하려는 사용자 정보가 존재하지 않습니다.");

		//판매 기록.
		errorMsgMap.put(ApiErrorCode.ECODE_SALES_RECORD_FIND_FAIL, "주유소 매출기록이 존재하지 않습니다.");
		errorMsgMap.put(ApiErrorCode.ECODE_SALES_RECORD_DUPLICATED, "주유소 매출기록 ID가 존재합니다. 다른 ID를 사용하세요.");
		errorMsgMap.put(ApiErrorCode.ECODE_SALES_RECORD_UPDATE_FIND_FAIL, "수정하려는 주유소 매출기록 정보가 존재하지 않습니다.");
		errorMsgMap.put(ApiErrorCode.ECODE_SALES_RECORD_DELETE_FIND_FAIL, "삭제하려는 주유소 매출기록 정보가 존재하지 않습니다.");

		//주유기 기록.
		errorMsgMap.put(ApiErrorCode.ECODE_NOZZLE_RECORD_FIND_FAIL, "주유기 기록이 존재하지 않습니다.");
		errorMsgMap.put(ApiErrorCode.ECODE_NOZZLE_RECORD_DUPLICATED, "주유기 기록 ID가 존재합니다. 다른 ID를 사용하세요.");
		errorMsgMap.put(ApiErrorCode.ECODE_NOZZLE_RECORD_UPDATE_FIND_FAIL, "수정하려는 주유기 기록 정보가 존재하지 않습니다.");
		errorMsgMap.put(ApiErrorCode.ECODE_NOZZLE_RECORD_DELETE_FIND_FAIL, "삭제하려는 주유기 기록 정보가 존재하지 않습니다.");

		//주유탱크 액세스 기록.
		errorMsgMap.put(ApiErrorCode.ECODE_TANK_RECORD_FIND_FAIL, "주유탱크 액세스 기록이 존재하지 않습니다.");
		errorMsgMap.put(ApiErrorCode.ECODE_TANK_RECORD_DUPLICATED, "주유탱크 액세스 기록 ID가 존재합니다. 다른 ID를 사용하세요.");
		errorMsgMap.put(ApiErrorCode.ECODE_TANK_RECORD_UPDATE_FIND_FAIL, "수정하려는 주유탱크 액세스 기록 정보가 존재하지 않습니다.");
		errorMsgMap.put(ApiErrorCode.ECODE_TANK_RECORD_DELETE_FIND_FAIL, "삭제하려는 주유탱크 액세스 기록 정보가 존재하지 않습니다.");
		
		//주유탱크 측정기록.
		errorMsgMap.put(ApiErrorCode.ECODE_TANK_BALANCE_RECORD_FIND_FAIL, "주유탱크 측정기록이 존재하지 않습니다.");
		errorMsgMap.put(ApiErrorCode.ECODE_TANK_BALANCE_RECORD_DUPLICATED, "주유탱크 측정기록 ID가 존재합니다. 다른 ID를 사용하세요.");
		errorMsgMap.put(ApiErrorCode.ECODE_TANK_BALANCE_RECORD_UPDATE_FIND_FAIL, "수정하려는 주유탱크 측정기록 정보가 존재하지 않습니다.");
		errorMsgMap.put(ApiErrorCode.ECODE_TANK_BALANCE_RECORD_DELETE_FIND_FAIL, "삭제하려는 주유탱크 측정기록 정보가 존재하지 않습니다.");

	}


	//Error Code에 해당하는 Error Message 전달.
	public static String getErrorMsg(int errorCode) {
		return errorMsgMap.get(errorCode);
	}
}
