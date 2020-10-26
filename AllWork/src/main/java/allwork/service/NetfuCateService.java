package allwork.service;

import java.util.List;
import java.util.Map;

public interface NetfuCateService {
	
	List<Map<String, Object>> selectNetfuCateList(Map<String, Object> map) throws Exception;
	Map<String, Object> selectNetfuCateMap(Map<String, Object> map) throws Exception;

}
