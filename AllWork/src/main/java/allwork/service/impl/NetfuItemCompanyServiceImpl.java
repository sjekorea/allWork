package allwork.service.impl;

import java.util.ArrayList;
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
		int rtnCnt = 0;
		if("keyword".equals((String)map.get("searchFlag"))){
			rtnCnt = netfuItemCompanyDao.selectKeywordNetfuItemCompanyCnt(map);
		}else{
			rtnCnt = netfuItemCompanyDao.selectNetfuItemCompanyCnt(map);
		}
		return rtnCnt;
	}
	
	// 채용 정보 상세 검색  목록 
	@Override
	public List<Map<String, Object>> selectNetfuItemCompanyList(Map<String, Object> map) throws Exception {
		List<Map<String, Object>> rtnList = new ArrayList<Map<String, Object>>();
		if("keyword".equals((String)map.get("searchFlag"))){
			rtnList = netfuItemCompanyDao.selectKeywordNetfuItemCompanyList(map);
		}else{
			rtnList = netfuItemCompanyDao.selectNetfuItemCompanyList(map);
		}
		return rtnList;
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
	
	// 기업별 채용공고  지원자수
	@Override
	public int selectNetfuItemCompanyApplyCnt(Map<String, Object> map) throws Exception {
		return netfuItemCompanyDao.selectNetfuItemCompanyApplyCnt(map);
	}

	// 진행중인 채용공고-selectbox용
	@Override
	public List<Map<String, Object>> selectNetfuItemCompanyProceess(Map<String, Object> map) throws Exception {
		return netfuItemCompanyDao.selectNetfuItemCompanyProceess(map);
	}

	@Override
	public Map<String, Object> selectNetfuItemCompanyMap(Map<String, Object> map) throws Exception {
		return netfuItemCompanyDao.selectNetfuItemCompanyMap(map);
	}
	
	// 채용공고 등록
	@Override
	public int insertNetfuItemCompany(Map<String, Object> map) throws Exception {
		return netfuItemCompanyDao.insertNetfuItemCompany(map);
	}
	
	// 채용공고 수정
	@Override
	public int updateNetfuItemCompany(Map<String, Object> map) throws Exception {
		return netfuItemCompanyDao.updateNetfuItemCompany(map);
	}
	
	// 채용공고 삭제
	@Override
	public int deleteNetfuItemCompany(Map<String, Object> map) throws Exception {
		return netfuItemCompanyDao.deleteNetfuItemCompany(map);
	}
	
	// 채용공고 수정
	@Override
	public int updateNetfuItemCompanyBizIng(Map<String, Object> map) throws Exception {
		return netfuItemCompanyDao.updateNetfuItemCompanyBizIng(map);
	}
}
