package allwork.service;

import java.util.List;
import java.util.Map;

public interface HomeCommonService {
	
	List<Map<String, Object>> selectMainPopupList(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectMainBannerList(Map<String, Object> map) throws Exception;
	
}
