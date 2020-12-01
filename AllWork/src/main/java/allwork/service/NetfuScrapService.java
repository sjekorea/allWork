package allwork.service;

import java.util.List;
import java.util.Map;

public interface NetfuScrapService {

	int selectRecruitScrapCnt(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectRecruitScrapList(Map<String, Object> map) throws Exception;
	int selectResumeScrapCnt(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectResumeScrapList(Map<String, Object> map) throws Exception;
	int selectNetfuScrapRegistCnt(Map<String, Object> map) throws Exception;
	int insertNetfuScrap(Map<String, Object> map) throws Exception;
	int deleteNetfuScrapMulti(Map<String, Object> map) throws Exception;

}
