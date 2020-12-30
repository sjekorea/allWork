package allwork.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import allwork.common.dao.AbstractDAO;

@Repository("netfuItemCompanyDao")
public class NetfuItemCompanyDao extends AbstractDAO{
	
	// 채용 정보 검색 갯수 
	public int selectNetfuItemCompanyCnt(Map<String, Object> map) throws Exception{
		return selectCnt("netfuItemCompany.selectNetfuItemCompanyCnt", map);
	}
	
	// 채용 정보 검색 결과 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNetfuItemCompanyList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("netfuItemCompany.selectNetfuItemCompanyList", map);
	}
	
	// 채용 정보 검색 갯수 
	public int selectKeywordNetfuItemCompanyCnt(Map<String, Object> map) throws Exception{
		return selectCnt("netfuItemCompany.selectKeywordNetfuItemCompanyCnt", map);
	}
	
	// 채용 정보 검색 결과 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectKeywordNetfuItemCompanyList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("netfuItemCompany.selectKeywordNetfuItemCompanyList", map);
	}
	
	// 기업별 채용공고 count 
	public int selectNetfuItemCompanyCntByCompany(Map<String, Object> map) throws Exception{
		return selectCnt("netfuItemCompany.selectNetfuItemCompanyCntByCompany", map);
	}
	
	// 기업별 채용공고 목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNetfuItemCompanyListByCompany(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("netfuItemCompany.selectNetfuItemCompanyListByCompany", map);
	}
	
	// 진행중인 채용공고 - selectbox 용
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNetfuItemCompanyProceess(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("netfuItemCompany.selectNetfuItemCompanyProceess", map);
	}
	
	// 채용정보 상세
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectNetfuItemCompanyMap(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("netfuItemCompany.selectNetfuItemCompanyMap", map);
	}

}
