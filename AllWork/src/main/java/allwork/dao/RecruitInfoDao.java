package allwork.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import allwork.common.dao.AbstractDAO;

@Repository("recruitInfoDao")
public class RecruitInfoDao extends AbstractDAO{
	
	// 추천채용정보 List - 개인회원 홈
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRecommandRecruitList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("recruitInfo.selectRecommandRecruitList", map);
	}
}
