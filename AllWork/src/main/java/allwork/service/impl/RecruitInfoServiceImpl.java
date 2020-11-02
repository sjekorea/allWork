package allwork.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import allwork.dao.RecruitInfoDao;
import allwork.service.RecruitInfoService;

@Service("recruitInfoService")
public class RecruitInfoServiceImpl implements RecruitInfoService{

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="recruitInfoDao")
	private RecruitInfoDao recruitInfoDao;
	

	@Override
	public List<Map<String, Object>> selectRecommandRecruitList(Map<String, Object> map) throws Exception {
		return recruitInfoDao.selectRecommandRecruitList(map);
	}

}
