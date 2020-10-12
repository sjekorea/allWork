package allwork.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import allwork.common.dao.AbstractDAO;

@Repository("netfuItemCompanyDao")
public class NetfuItemCompanyDao extends AbstractDAO{
	
	public int selectNetfuItemCompanyCnt(Map<String, Object> map) throws Exception{
		return selectCnt("netfuItemCompany.selectNetfuItemCompanyCnt", map);
	}

}
