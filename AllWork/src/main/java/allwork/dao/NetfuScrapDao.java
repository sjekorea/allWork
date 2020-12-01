package allwork.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import allwork.common.dao.AbstractDAO;

@Repository("netfuScrapDao")
public class NetfuScrapDao extends AbstractDAO{
	
	// 스크랩한 채용 정보  갯수
	public int selectRecruitScrapCnt(Map<String, Object> map) throws Exception{
		return selectCnt("netfuScrap.selectRecruitScrapCnt", map);
	}
	
	// 스크랩한 채용 정보 목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRecruitScrapList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("netfuScrap.selectRecruitScrapList", map);
	}
	
	// 스크랩한 이력서 정보  갯수
	public int selectResumeScrapCnt(Map<String, Object> map) throws Exception{
		return selectCnt("netfuScrap.selectResumeScrapCnt", map);
	}
	
	// 스크랩한 이력서 정보 목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectResumeScrapList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("netfuScrap.selectResumeScrapList", map);
	}
	
	// 스크랩 여부
	public int selectNetfuScrapRegistCnt(Map<String, Object> map) throws Exception{
		return selectCnt("netfuScrap.selectNetfuScrapRegistCnt", map);
	}
	
	// 스크랩한 채용 정보 등록
	public int insertNetfuScrap(Map<String, Object> map) throws Exception{ 
		return insert("netfuScrap.insertNetfuScrap", map);
	}
	
	// 스크랩한 채용 정보 삭제
	public int deleteNetfuScrapMulti(Map<String, Object> map) throws Exception{ 
		return delete("netfuScrap.deleteNetfuScrapMulti", map);
	}

}
