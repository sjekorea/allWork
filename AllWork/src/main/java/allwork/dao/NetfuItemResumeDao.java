package allwork.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import allwork.common.dao.AbstractDAO;

@Repository("netfuItemResumeDao")
public class NetfuItemResumeDao extends AbstractDAO{
	
	// 최근 등록된 이력서 no
	public int selectRecentlyResumeNo(Map<String, Object> map) throws Exception{
		return selectCnt("netfuItemResume.selectRecentlyResumeNo", map);
	}
	
	// 등록된 이력서 갯수
	public int selectNetfuItemResumeCnt(Map<String, Object> map) throws Exception{
		return selectCnt("netfuItemResume.selectNetfuItemResumeCnt", map);
	}
	
	// 이력서 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNetfuItemResumeList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("netfuItemResume.selectNetfuItemResumeList", map);
	}
	
	// 이력서 정보
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectNetfuItemResumeMap(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("netfuItemResume.selectNetfuItemResumeMap", map);
	}

}
