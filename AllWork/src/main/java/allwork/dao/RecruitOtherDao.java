package allwork.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import allwork.common.dao.AbstractDAO;

@Repository("recruitOtherDao")
public class RecruitOtherDao extends AbstractDAO{
	
	// 채용 정보 검색 갯수 
	public int selectRecruitOtherCnt(Map<String, Object> map) throws Exception{
		return selectCnt("recruitOther.selectRecruitOtherCnt", map);
	}
	
	// 채용 정보 검색 결과 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRecruitOtherList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("recruitOther.selectRecruitOtherList", map);
	}
}
