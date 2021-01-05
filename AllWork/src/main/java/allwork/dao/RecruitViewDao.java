package allwork.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import allwork.common.dao.AbstractDAO;

@Repository("recruitViewDao")
public class RecruitViewDao extends AbstractDAO{

	
	// 열람정보 갯수
	public int selectRecruitViewCnt(Map<String, Object> map) throws Exception{
		return selectCnt("recruitView.selectRecruitViewCnt", map);
	}
	
	// 채용정보 열람정보 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRecruitViewList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("recruitView.selectRecruitViewList", map);
	}
	
	// 이력서 정보 열람정보 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectResumeViewList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("recruitView.selectResumeViewList", map);
	}
	
	// 열람정보 등록
	public int insertRecruitView(Map<String, Object> map) throws Exception{ 
		return insert("recruitView.insertRecruitView", map);
	}

}
