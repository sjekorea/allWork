package allwork.service;

import java.util.List;
import java.util.Map;

public interface NetfuItemResumeService {

	int selectRecentlyResumeNo(Map<String, Object> map) throws Exception; 
	List<Map<String, Object>> selectNetfuItemResumeList(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectNetfuItemResumeAllList(Map<String, Object> map) throws Exception;
	int selectNetfuItemResumeCnt(Map<String, Object> map) throws Exception; 
	int selectNetfuItemMyResumeCnt(Map<String, Object> map) throws Exception; 
	Map<String, Object> selectNetfuItemResumeMap(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectPayResumeList(Map<String, Object> map) throws Exception;
	int insertNetfuItemResume(Map<String, Object> map) throws Exception;
	int updateNetfuItemResume(Map<String, Object> map) throws Exception;
	int updateNetfuItemResumeSecret(Map<String, Object> map) throws Exception;
	int deleteNetfuItemResumeMulti(Map<String, Object> map) throws Exception;
	
}
