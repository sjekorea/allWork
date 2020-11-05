package allwork.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import allwork.dao.NetfuItemCompanyDao;
import allwork.service.NetfuItemCompanyService;

@Service("netfuItemCompanyService")
public class NetfuItemCompanyServiceImpl implements NetfuItemCompanyService{
	
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="netfuItemCompanyDao")
	private NetfuItemCompanyDao netfuItemCompanyDao;

	
	// 온라인 입사지원 Count - 개인회원 홈
	@Override
	public int selectOnlineRecruitCnt(Map<String, Object> map) throws Exception {
		return netfuItemCompanyDao.selectOnlineRecruitCnt(map);
	}
	
	// 맞춤 채용 정보 Count
	@Override
	public int selectRecruitSettedCnt(Map<String, Object> map) throws Exception {
		return netfuItemCompanyDao.selectRecruitSettedCnt(map);
	}
	
	// 맞춤 채용 정보 목록 
	@Override
	public List<Map<String, Object>> selectRecruitSettedList(Map<String, Object> map) throws Exception {
		return netfuItemCompanyDao.selectRecruitSettedList(map);
	}
	
	// 스크랩한 채용정보 Count 
	@Override
	public int selectRecruitScrapCnt(Map<String, Object> map) throws Exception {
		return netfuItemCompanyDao.selectRecruitScrapCnt(map);
	}
	
	// 스크랩한 채용정보 목록 
	@Override
	public List<Map<String, Object>> selectRecruitScrapList(Map<String, Object> map) throws Exception {
		return netfuItemCompanyDao.selectRecruitScrapList(map);
	}
	
	// 스크랩한 채용정보 삭제
	@Override
	public int deleteRecruitScrapMulti(Map<String, Object> map) throws Exception {
		return netfuItemCompanyDao.deleteRecruitScrapMulti(map);
	}

}
