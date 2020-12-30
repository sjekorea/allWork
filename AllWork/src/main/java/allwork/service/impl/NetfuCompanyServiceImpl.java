package allwork.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import allwork.dao.NetfuCompanyDao;
import allwork.service.NetfuCompanyService;

@Service("netfuCompanyService")
public class NetfuCompanyServiceImpl implements NetfuCompanyService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="netfuCompanyDao")
	private NetfuCompanyDao netfuCompanyDao;

	
	// 채용 정보 상세 검색 Count
	@Override
	public int selectBizNoCnt(Map<String, Object> map) throws Exception {
		return netfuCompanyDao.selectBizNoCnt(map);
	}
	
	// 기업 정보
	@Override
	public Map<String, Object> selectNetfuCompanyMap(Map<String, Object> map) throws Exception {
		return netfuCompanyDao.selectNetfuCompanyMap(map);
	}
	
	// 기업 정보 등록
	@Override
	public int insertNetfuCompany(Map<String, Object> map) throws Exception {
		return netfuCompanyDao.insertNetfuCompany(map);
	}
	
	

}
