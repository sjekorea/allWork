package allwork.service;

import java.util.List;
import java.util.Map;

public interface NetfuMyServiceService {

	int selectMyServiceRecruitCnt(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectMyServiceRecruitList(Map<String, Object> map) throws Exception;
	int selectMyServiceResumeCnt(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectMyServiceResumeList(Map<String, Object> map) throws Exception;
	Map<String, Object> selectNetfuMyServiceMap(Map<String, Object> map) throws Exception;
	int insertNetfuMyService(Map<String, Object> map) throws Exception;
	int updateNetfuMyService(Map<String, Object> map) throws Exception;

}
