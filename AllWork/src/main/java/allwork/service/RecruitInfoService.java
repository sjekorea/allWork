package allwork.service;

import java.util.List;
import java.util.Map;

public interface RecruitInfoService {
	
	List<Map<String, Object>> selectRecommandRecruitList(Map<String, Object> map) throws Exception;
}
