package allwork.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import allwork.common.dao.AbstractDAO;

@Repository("netfuItemCompanyDao")
public class NetfuItemCompanyDao extends AbstractDAO{
	
	// 채용정보 상세
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectNetfuItemCompanyMap(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("netfuItemCompany.selectNetfuItemCompanyMap", map);
	}
	
	// 온라인 입사지원 Count - 개인회원 홈
	public int selectOnlineRecruitCnt(Map<String, Object> map) throws Exception{
		return selectCnt("netfuItemCompany.selectOnlineRecruitCnt", map);
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
