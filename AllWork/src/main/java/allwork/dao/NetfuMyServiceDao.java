package allwork.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import allwork.common.dao.AbstractDAO;

@Repository("netfuMyServiceDao")
public class NetfuMyServiceDao extends AbstractDAO{
	
	// 맞춤 채용 정보 검색 갯수 
	public int selectMyServiceRecruitCnt(Map<String, Object> map) throws Exception{
		return selectCnt("netfuMyService.selectMyServiceRecruitCnt", map);
	}
	
	// 맞춤 채용 정보 검색 결과 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMyServiceRecruitList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("netfuMyService.selectMyServiceRecruitList", map);
	}
	
	// 맞춤 인재 정보 검색 갯수 
	public int selectMyServiceResumeCnt(Map<String, Object> map) throws Exception{
		return selectCnt("netfuMyService.selectMyServiceResumeCnt", map);
	}
	
	// 맞춤 인재 정보 검색 결과 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMyServiceResumeList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("netfuMyService.selectMyServiceResumeList", map);
	}
	
	// 맞춤 정보 등록 정보
	public Map<String, Object> selectNetfuMyServiceMap(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("netfuMyService.selectNetfuMyServiceMap", map);
	}
	
	// 맞춤 정보 등록
	public int insertNetfuMyService(Map<String, Object> map) throws Exception{
		return insert("netfuMyService.insertNetfuMyService", map);
	}

}
