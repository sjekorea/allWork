package allwork.service;

import java.util.List;
import java.util.Map;

public interface TestInfoService {
	
	List<Map<String, Object>> selectTestInfoList(Map<String, Object> map) throws Exception;
	int selectTestInfoCnt(Map<String, Object> map) throws Exception;
	int insertTestInfo(Map<String, Object> map) throws Exception;
	int updateTestInfo(Map<String, Object> map) throws Exception;
	int deleteTestInfo(Map<String, Object> map) throws Exception;

}
