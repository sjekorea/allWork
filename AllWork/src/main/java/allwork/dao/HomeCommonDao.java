package allwork.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import allwork.common.dao.AbstractDAO;

@Repository("homeCommonDao")
public class HomeCommonDao extends AbstractDAO{
	
	// 메인화면 popup list
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMainPopupList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("homeCommon.selectMainPopupList", map);
	}
	
	// 메인화면 banner list
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMainBannerList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("homeCommon.selectMainBannerList", map);
	}
	
	// 메인화면 채용공고 list
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMainRecruitList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("homeCommon.selectMainRecruitList", map);
	}

}
