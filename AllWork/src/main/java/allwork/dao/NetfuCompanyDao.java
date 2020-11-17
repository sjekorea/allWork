package allwork.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import allwork.common.dao.AbstractDAO;

@Repository("netfuCompanyDao")
public class NetfuCompanyDao extends AbstractDAO{
	
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectNetfuCompanyMap(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("netfuCompany.selectNetfuCompanyMap", map);
	}

}
