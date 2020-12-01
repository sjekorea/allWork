package allwork.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import allwork.common.dao.AbstractDAO;

@Repository("netfuOnlineRecruitDao")
public class NetfuOnlineRecruitDao extends AbstractDAO{
	
	// 온라인 입사지원 Count - 개인회원 홈
	public int selectOnlineRecruitCnt(Map<String, Object> map) throws Exception{
		return selectCnt("netfuOnlineRecruit.selectOnlineRecruitCnt", map);
	}

	// 온라인 지원 여부
	public int selectNetfuOnlineRecruitRegistCnt(Map<String, Object> map) throws Exception{
		return selectCnt("netfuOnlineRecruit.selectNetfuOnlineRecruitRegistCnt", map);
	}

	// 면접 요청 기업 count
	public int selectInterviewRequestCompanyCnt(Map<String, Object> map) throws Exception{
		return selectCnt("netfuOnlineRecruit.selectInterviewRequestCompanyCnt", map);
	}
	
	// 면접 요청 기업 List
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectInterviewRequestCompanyList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("netfuOnlineRecruit.selectInterviewRequestCompanyList", map);
	}

	// 입사 지원 현황 count
	public int selectApplyCnt(Map<String, Object> map) throws Exception{
		return selectCnt("netfuOnlineRecruit.selectApplyCnt", map);
	}
	
	// 입사지원 현황 List
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectApplyList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("netfuOnlineRecruit.selectApplyList", map);
	}

	// 입사 지원자 현황 count
	public int selectApplicantCnt(Map<String, Object> map) throws Exception{
		return selectCnt("netfuOnlineRecruit.selectApplicantCnt", map);
	}
	
	// 입사지원자 현황 List
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectApplicantList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("netfuOnlineRecruit.selectApplicantList", map);
	}
	
	// 입사 지원 정보 삭제
	public int deleteNetfuOnlineRecruitMulti(Map<String, Object> map) throws Exception{ 
		return delete("netfuOnlineRecruit.deleteNetfuOnlineRecruitMulti", map);
	}

}
