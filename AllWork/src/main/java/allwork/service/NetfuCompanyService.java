package allwork.service;

import java.util.Map;

public interface NetfuCompanyService {

	int selectBizNoCnt(Map<String, Object> map) throws Exception;
	Map<String, Object> selectNetfuCompanyMap(Map<String, Object> map) throws Exception;
	int insertNetfuCompany(Map<String, Object> map) throws Exception;

}
