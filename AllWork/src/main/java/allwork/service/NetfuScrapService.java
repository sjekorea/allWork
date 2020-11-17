package allwork.service;

import java.util.List;
import java.util.Map;

public interface NetfuScrapService {

	int selectNetfuScrapCnt(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectNetfuScrapList(Map<String, Object> map) throws Exception;
	int insertNetfuScrap(Map<String, Object> map) throws Exception;
	int deleteNetfuScrapMulti(Map<String, Object> map) throws Exception;

}
