package allwork.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import allwork.common.dao.AbstractDAO;

@Repository("netfuItemResumeDao")
public class NetfuItemResumeDao extends AbstractDAO{
	
	public int selectNetfuItemResumeCnt(Map<String, Object> map) throws Exception{
		return selectCnt("netfuItemResume.selectNetfuItemResumeCnt", map);
	}

}
