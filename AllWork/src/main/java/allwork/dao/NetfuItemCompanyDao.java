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
	
	// 기업별 채용공고 count 
	public int selectNetfuItemCompanyCntByCompany(Map<String, Object> map) throws Exception{
		return selectCnt("netfuItemCompany.selectNetfuItemCompanyCntByCompany", map);
	}
	
	// 기업별 채용공고 목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNetfuItemCompanyListByCompany(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("netfuItemCompany.selectNetfuItemCompanyListByCompany", map);
	}
	
	// 채용정보 상세
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectNetfuItemCompanyMap(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("netfuItemCompany.selectNetfuItemCompanyMap", map);
	}
	
	// 맞춤 채용 정보  갯수 - 개인 회원 홈
	public int selectRecruitSettedCnt(Map<String, Object> map) throws Exception{
		return selectCnt("netfuItemCompany.selectRecruitSettedCnt", map);
	}
	
	// 맞춤 채용 정보 목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRecruitSettedList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("netfuItemCompany.selectRecruitSettedList", map);
	}

}
