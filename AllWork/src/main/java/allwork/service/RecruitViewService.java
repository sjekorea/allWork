package allwork.service;

import java.util.List;
import java.util.Map;

public interface RecruitViewService {
	
	int selectRecruitViewCnt(Map<String, Object> map) throws Exception; 
	int selectReferenceViewCnt(Map<String, Object> map) throws Exception; 
	List<Map<String, Object>> selectRecruitViewList(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectResumeViewList(Map<String, Object> map) throws Exception;
	int insertRecruitView(Map<String, Object> map) throws Exception;
	
}
