package allwork.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import allwork.dao.NetfuOnlineRecruitDao;
import allwork.service.NetfuOnlineRecruitService;


@Service("netfuOnlineRecruitService")
public class NetfuOnlineRecruitServiceImpl implements NetfuOnlineRecruitService{
	
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="netfuOnlineRecruitDao")
	private NetfuOnlineRecruitDao netfuOnlineRecruitDao;
	
	
	// 온라인 입사지원 Count - 개인회원 홈
	@Override
	public int selectOnlineRecruitCnt(Map<String, Object> map) throws Exception {
		return netfuOnlineRecruitDao.selectOnlineRecruitCnt(map);
	}
	
	// 입사 지원 count
	@Override
	public int selectNetfuOnlineRecruitRegistCnt(Map<String, Object> map) throws Exception {
		return netfuOnlineRecruitDao.selectNetfuOnlineRecruitRegistCnt(map);
	}
	
	// 면접 요청 기업 Count
	@Override
	public int selectInterviewRequestCompanyCnt(Map<String, Object> map) throws Exception {
		return netfuOnlineRecruitDao.selectInterviewRequestCompanyCnt(map);
	}
	
	// 면접 요청 기업 목록 
	@Override
	public List<Map<String, Object>> selectInterviewRequestCompanyList(Map<String, Object> map) throws Exception {
		return netfuOnlineRecruitDao.selectInterviewRequestCompanyList(map);
	}
	
	// 입사지원현황 Count
	@Override
	public int selectApplyCnt(Map<String, Object> map) throws Exception {
		return netfuOnlineRecruitDao.selectApplyCnt(map);
	}
	
	// 입사지원현황 목록 
	@Override
	public List<Map<String, Object>> selectApplyList(Map<String, Object> map) throws Exception {
		return netfuOnlineRecruitDao.selectApplyList(map);
	}
	
	// 입사지원자현황 Count
	@Override
	public int selectApplicantCnt(Map<String, Object> map) throws Exception {
		return netfuOnlineRecruitDao.selectApplicantCnt(map);
	}
	
	// 입사지원자현황 목록 
	@Override
	public List<Map<String, Object>> selectApplicantList(Map<String, Object> map) throws Exception {
		return netfuOnlineRecruitDao.selectApplicantList(map);
	}
	
	// 입사지원정보 삭제
	@Override
	public int deleteNetfuOnlineRecruitMulti(Map<String, Object> map) throws Exception {
		return netfuOnlineRecruitDao.deleteNetfuOnlineRecruitMulti(map);
	}
	
	// 입사지원정보 저장
	@Override
	public int insertNetfuOnlineRecruit(Map<String, Object> map) throws Exception {
		return netfuOnlineRecruitDao.insertNetfuOnlineRecruit(map);
	}

}
