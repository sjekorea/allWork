package allwork.service;

import java.util.List;
import java.util.Map;

public interface NetfuItemResumeService {

	int selectRecentlyResumeNo(Map<String, Object> map) throws Exception; 
	List<Map<String, Object>> selectNetfuItemResumeList(Map<String, Object> map) throws Exception;
	int selectNetfuItemResumeCnt(Map<String, Object> map) throws Exception; 
	Map<String, Object> selectNetfuItemResumeMap(Map<String, Object> map) throws Exception;
	int insertNetfuItemResume(Map<String, Object> map) throws Exception;
	
}
