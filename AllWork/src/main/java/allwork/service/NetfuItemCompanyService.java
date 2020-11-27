package allwork.service;

import java.util.List;
import java.util.Map;

public interface NetfuItemCompanyService {
	
	int selectNetfuItemCompanyCnt(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectNetfuItemCompanyList(Map<String, Object> map) throws Exception;
	int selectNetfuItemCompanyCntByCompany(Map<String, Object> map) throws Exception;
	List<Map<String, Object>>selectNetfuItemCompanyListByCompany(Map<String, Object> map) throws Exception;
	Map<String, Object> selectNetfuItemCompanyMap(Map<String, Object> map) throws Exception;
	int selectRecruitSettedCnt(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectRecruitSettedList(Map<String, Object> map) throws Exception;

}
