package allwork.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import allwork.common.dao.AbstractDAO;

@Repository("netfuScrapDao")
public class NetfuScrapDao extends AbstractDAO{
	
	// 스크랩한 채용 정보  갯수
	public int selectNetfuScrapCnt(Map<String, Object> map) throws Exception{
		return selectCnt("netfuScrap.selectNetfuScrapCnt", map);
	}
	
	// 스크랩한 채용 정보 목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNetfuScrapList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("netfuScrap.selectNetfuScrapList", map);
	}
	
	// 스크랩한 채용 정보 등록
	public int insertNetfuScrap(Map<String, Object> map) throws Exception{ 
		return delete("netfuScrap.insertNetfuScrap", map);
	}
	
	// 스크랩한 채용 정보 삭제
	public int deleteNetfuScrapMulti(Map<String, Object> map) throws Exception{ 
		return delete("netfuScrap.deleteNetfuScrapMulti", map);
	}

}
