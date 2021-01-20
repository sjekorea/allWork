package allwork.service;

import java.util.List;
import java.util.Map;

public interface NetfuItemCompanyService {
	
	int selectNetfuItemCompanyCnt(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectNetfuItemCompanyList(Map<String, Object> map) throws Exception;
	int selectNetfuItemCompanyCntByCompany(Map<String, Object> map) throws Exception;
	List<Map<String, Object>>selectNetfuItemCompanyListByCompany(Map<String, Object> map) throws Exception;
	int selectNetfuItemCompanyApplyCnt(Map<String, Object> map) throws Exception;
	List<Map<String, Object>>selectNetfuItemCompanyProceess(Map<String, Object> map) throws Exception;
	Map<String, Object> selectNetfuItemCompanyMap(Map<String, Object> map) throws Exception;
	int insertNetfuItemCompany(Map<String, Object> map) throws Exception;
	int updateNetfuItemCompany(Map<String, Object> map) throws Exception;
	int deleteNetfuItemCompany(Map<String, Object> map) throws Exception;
	int updateNetfuItemCompanyBizIng(Map<String, Object> map) throws Exception;

}
