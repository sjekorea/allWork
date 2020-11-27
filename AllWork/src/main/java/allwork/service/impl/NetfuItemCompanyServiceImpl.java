package allwork.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import allwork.dao.NetfuCompanyDao;
import allwork.dao.NetfuItemCompanyDao;
import allwork.service.NetfuItemCompanyService;

@Service("netfuItemCompanyService")
public class NetfuItemCompanyServiceImpl implements NetfuItemCompanyService{
	
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="netfuItemCompanyDao")
	private NetfuItemCompanyDao netfuItemCompanyDao;

	
	// 채용 정보 상세 검색 Count
	@Override
	public int selectNetfuItemCompanyCnt(Map<String, Object> map) throws Exception {
		return netfuItemCompanyDao.selectNetfuItemCompanyCnt(map);
	}
	
	// 채용 정보 상세 검색  목록 
	@Override
	public List<Map<String, Object>> selectNetfuItemCompanyList(Map<String, Object> map) throws Exception {
		return netfuItemCompanyDao.selectNetfuItemCompanyList(map);
	}
	
	// 기업별 채용공고  Count
	@Override
	public int selectNetfuItemCompanyCntByCompany(Map<String, Object> map) throws Exception {
		return netfuItemCompanyDao.selectNetfuItemCompanyCntByCompany(map);
	}
	
	// 기업별 채용공고   목록 
	@Override
	public List<Map<String, Object>> selectNetfuItemCompanyListByCompany(Map<String, Object> map) throws Exception {
		return netfuItemCompanyDao.selectNetfuItemCompanyListByCompany(map);
	}

	@Override
	public Map<String, Object> selectNetfuItemCompanyMap(Map<String, Object> map) throws Exception {
		return netfuItemCompanyDao.selectNetfuItemCompanyMap(map);
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

}
