package allwork.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import allwork.dao.HomeCommonDao;
import allwork.service.HomeCommonService;

@Service("homeCommonService")
public class HomeCommonServiceImpl implements HomeCommonService{
	
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="homeCommonDao")
	private HomeCommonDao homeCommonDao;
	
	
	// 메인화면 팝업 리스트
	@Override
	public List<Map<String, Object>> selectMainPopupList(Map<String, Object> map) throws Exception {
		return homeCommonDao.selectMainPopupList(map);
	}
	
	@Override
	public Map<String, Object> selectMainPopupMap(Map<String, Object> map) throws Exception {
		return homeCommonDao.selectMainPopupMap(map);
	}
	
	// 메인화면 배너 리스트
	@Override
	public List<Map<String, Object>> selectMainBannerList(Map<String, Object> map) throws Exception {
		return homeCommonDao.selectMainBannerList(map);
	}
	
	// 메인화면 롤배너 리스트
	@Override
	public List<Map<String, Object>> selectMainRollBannerList(Map<String, Object> map) throws Exception {
		return homeCommonDao.selectMainRollBannerList(map);
	}
	
	// 메인화면 상단 롤배너 리스트
	@Override
	public List<Map<String, Object>> selectMainTopRollBannerList(Map<String, Object> map) throws Exception {
		return homeCommonDao.selectMainTopRollBannerList(map);
	}
	
	// 메인 채용공고 리스트
	@Override
	public List<Map<String, Object>> selectMainRecruitList(Map<String, Object> map) throws Exception {
		return homeCommonDao.selectMainRecruitList(map);
	}
	
	// 메인 채용공고 리스트
	@Override
	public List<Map<String, Object>> selectMainPayRecruitList(Map<String, Object> map) throws Exception {
		return homeCommonDao.selectMainPayRecruitList(map);
	}

}
