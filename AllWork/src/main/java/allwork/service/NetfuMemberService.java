package allwork.service;

import java.util.Map;

public interface NetfuMemberService {

	Map<String, Object> selectNetfuMemberMap(Map<String, Object> map) throws Exception;
	int selectNetfuMemberLoginCnt(Map<String, Object> map) throws Exception; 
	int insertNetfuMember(Map<String, Object> map) throws Exception;

}
