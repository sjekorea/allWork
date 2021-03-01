package allwork.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import allwork.dao.RecruitOtherDao;
import allwork.service.RecruitOtherService;

@Service("recruitOtherService")
public class RecruitOtherServiceImpl implements RecruitOtherService{
	
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="recruitOtherDao")
	private RecruitOtherDao recruitOtherDao;
	
	
	// 일반채용정보  Count
	@Override
	public int selectRecruitOtherCnt(Map<String, Object> map) throws Exception {
		return recruitOtherDao.selectRecruitOtherCnt(map);
	}
	
	// 일반채용정보   목록 
	@Override
	public List<Map<String, Object>> selectRecruitOtherList(Map<String, Object> map) throws Exception {
		return recruitOtherDao.selectRecruitOtherList(map);
	}

	@Override
	public Map<String, Object> selectRecruitOtherMap(Map<String, Object> map) throws Exception {
		return recruitOtherDao.selectRecruitOtherMap(map);
	}

	
	
	// 금일등록 채용정보 갯수 
	@Override
	public int selectTodayRecruitOtherCnt(Map<String, Object> map) throws Exception {
		return recruitOtherDao.selectTodayRecruitOtherCnt(map);
	}
}
