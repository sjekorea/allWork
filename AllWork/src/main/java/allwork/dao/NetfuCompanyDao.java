package allwork.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import allwork.common.dao.AbstractDAO;

@Repository("netfuCompanyDao")
public class NetfuCompanyDao extends AbstractDAO{
	
	// 사업자 번호 중복 검사 
	public int selectBizNoCnt(Map<String, Object> map) throws Exception{
		return selectCnt("netfuCompany.selectBizNoCnt", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectNetfuCompanyMap(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("netfuCompany.selectNetfuCompanyMap", map);
	}
	
	// 기업 정보 등록
	public int insertNetfuCompany(Map<String, Object> map) throws Exception{ 
		return insert("netfuCompany.insertNetfuCompany", map);
	}

	//(begin) 2021.01.04 by s.yoo
	// 기업 정보 수정
	public int updateNetfuCompany(Map<String, Object> map) throws Exception{ 
		return insert("netfuCompany.updateNetfuCompany", map);
	}
	//(end) 2021.01.04 by s.yoo

}
