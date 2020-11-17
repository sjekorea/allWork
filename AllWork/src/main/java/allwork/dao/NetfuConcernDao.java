package allwork.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import allwork.common.dao.AbstractDAO;

@Repository("netfuConcernDao")
public class NetfuConcernDao extends AbstractDAO{
	
	
	// 관심기업 등록 여부 
	public int selectNetfuConcernRegistCnt(Map<String, Object> map) throws Exception{
		return selectCnt("netfuConcern.selectNetfuConcernRegistCnt", map);
	}
	
	// 관심기업 채용 정보  갯수
	public int selectNetfuConcernCnt(Map<String, Object> map) throws Exception{
		return selectCnt("netfuConcern.selectNetfuConcernCnt", map);
	}
	
	// 관심기업 목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNetfuConcernList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("netfuConcern.selectNetfuConcernList", map);
	}

	// 관심기업 채용 정보  갯수
	public int selectNetfuConcernRecruitCnt(Map<String, Object> map) throws Exception{
		return selectCnt("netfuConcern.selectNetfuConcernRecruitCnt", map);
	}
	
	// 관심기업 채용 정보 목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNetfuConcernRecruitList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("netfuConcern.selectNetfuConcernRecruitList", map);
	}
	
	// 관심기업 채용 정보 등록
	public int insertNetfuConcern(Map<String, Object> map) throws Exception{ 
		return delete("netfuConcern.insertNetfuConcern", map);
	}
	
	// 관심기업 채용 정보 삭제
	public int deleteNetfuConcernMulti(Map<String, Object> map) throws Exception{ 
		return delete("netfuConcern.deleteNetfuConcernMulti", map);
	}

}
