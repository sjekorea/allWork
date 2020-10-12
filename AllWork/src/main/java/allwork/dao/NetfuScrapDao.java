package allwork.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import allwork.common.dao.AbstractDAO;

@Repository("netfuScrapDao")
public class NetfuScrapDao extends AbstractDAO{
	
	public int selectNetfuScrapCnt(Map<String, Object> map) throws Exception{
		return selectCnt("netfuScrap.selectNetfuScrapCnt", map);
	}
	

}
