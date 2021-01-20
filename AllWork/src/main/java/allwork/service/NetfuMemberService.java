package allwork.service;

import java.util.Map;

public interface NetfuMemberService {

	Map<String, Object> selectNetfuMemberMap(Map<String, Object> map) throws Exception;
	int selectNetfuMemberLoginCnt(Map<String, Object> map) throws Exception; 
	int selectNetfuMemberSNSLoginCnt(Map<String, Object> map) throws Exception; 
	int updateNetfuMemberSNS(Map<String, Object> map) throws Exception;
	int selectUidExistCnt(Map<String, Object> map) throws Exception; 
	//(begin) 2021.01.03 by s.yoo
	Map<String, Object> findId(Map<String, Object> map) throws Exception;
	Map<String, Object> findPw(Map<String, Object> map) throws Exception;
	int resetPw(Map<String, Object> map) throws Exception;
	int memberUnregister(Map<String, Object> map) throws Exception;
	int updateLoginInfo(Map<String, Object> map) throws Exception;
	int updateMyInfo(Map<String, Object> map) throws Exception;
	//(end) 2021.01.03 by s.yoo
	int insertNetfuMember(Map<String, Object> map) throws Exception;
	int updatePw(Map<String, Object> map) throws Exception;
	int updatePayServiceInfo(Map<String, Object> map) throws Exception;
	int updatePayService1Info(Map<String, Object> map) throws Exception;
	int updatePayService2Info(Map<String, Object> map) throws Exception;
	int updateViewCount(Map<String, Object> map) throws Exception;

}
