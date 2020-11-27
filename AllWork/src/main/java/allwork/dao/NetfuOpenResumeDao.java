package allwork.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import allwork.common.dao.AbstractDAO;

@Repository("netfuOpenResumeDao")
public class NetfuOpenResumeDao extends AbstractDAO{
	
	// 이력서 열람 count
	public int selectNetfuOpenResumeCnt(Map<String, Object> map) throws Exception{
		return selectCnt("netfuOpenResume.selectNetfuOpenResumeCnt", map);
	}
}