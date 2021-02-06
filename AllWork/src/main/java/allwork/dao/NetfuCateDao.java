package allwork.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import allwork.common.dao.AbstractDAO;

@Repository("netfuCateDao")
public class NetfuCateDao extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNetfuCateList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("netfuCate.selectNetfuCateList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNetfuCateJobTypeAllList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("netfuCate.selectNetfuCateJobTypeAllList", map);
	}
	
	public Map<String, Object> selectNetfuCateMap(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("netfuCate.selectNetfuCateMap", map);
	}
	

}
