package allwork.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import allwork.common.dao.AbstractDAO;


@Repository("testInfoDao")
public class TestInfoDao extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTestInfoList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("testInfo.selectTestInfoList", map);
	}
	
	public int selectTestInfoCnt(Map<String, Object> map) throws Exception{
		return selectCnt("testInfo.selectTestInfoCnt", map);
	}

	public int insertTestInfo(Map<String, Object> map) throws Exception{ 
		return insert("testInfo.insertTestInfo", map);
	}	

	public int updateTestInfo(Map<String, Object> map) throws Exception{ 
		return update("testInfo.updateTestInfo", map);
	}	
	
	public int deleteTestInfo(Map<String, Object> map) throws Exception{ 
		return delete("testInfo.deleteTestInfo", map);
	}

}
