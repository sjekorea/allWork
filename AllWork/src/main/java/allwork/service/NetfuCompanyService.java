package allwork.service;

import java.util.Map;

public interface NetfuCompanyService {

	int selectBizNoCnt(Map<String, Object> map) throws Exception;
	Map<String, Object> selectNetfuCompanyMap(Map<String, Object> map) throws Exception;
	int insertNetfuCompany(Map<String, Object> map) throws Exception;

	//(begin) 2021.01.04 by s.yoo
	// ��� ���� ����
	int updateNetfuCompany(Map<String, Object> map) throws Exception;
	//(end) 2021.01.04 by s.yoo

}
