package allwork.service;

import java.util.List;
import java.util.Map;

public interface NetfuConcernService {

	int selectNetfuConcernRegistCnt(Map<String, Object> map) throws Exception;	
	int selectNetfuConcernCnt(Map<String, Object> map) throws Exception;	
	List<Map<String, Object>> selectNetfuConcernList(Map<String, Object> map) throws Exception;	
	int selectNetfuConcernRecruitCnt(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectNetfuConcernRecruitList(Map<String, Object> map) throws Exception;
	int insertNetfuConcern(Map<String, Object> map) throws Exception;
	int deleteNetfuConcernMulti(Map<String, Object> map) throws Exception;

}
