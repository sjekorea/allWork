package allwork.service;

import java.util.List;
import java.util.Map;

public interface NetfuItemCompanyService {
	
	Map<String, Object> selectNetfuItemCompanyMap(Map<String, Object> map) throws Exception;
	int selectOnlineRecruitCnt(Map<String, Object> map) throws Exception;
	int selectRecruitSettedCnt(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectRecruitSettedList(Map<String, Object> map) throws Exception;

}
