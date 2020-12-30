package allwork.service;

import java.util.List;
import java.util.Map;

public interface RecruitOtherService {
	
	int selectRecruitOtherCnt(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectRecruitOtherList(Map<String, Object> map) throws Exception;

}
