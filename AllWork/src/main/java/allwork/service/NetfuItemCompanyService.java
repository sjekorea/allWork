package allwork.service;

import java.util.List;
import java.util.Map;

public interface NetfuItemCompanyService {
	
	int selectOnlineRecruitCnt(Map<String, Object> map) throws Exception;
	int selectRecruitSettedCnt(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectRecruitSettedList(Map<String, Object> map) throws Exception;
	int selectRecruitScrapCnt(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectRecruitScrapList(Map<String, Object> map) throws Exception;
	int deleteRecruitScrapMulti(Map<String, Object> map) throws Exception;

}
