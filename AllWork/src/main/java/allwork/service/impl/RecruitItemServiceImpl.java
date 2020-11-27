package allwork.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import allwork.dao.RecruitItemDao;
import allwork.service.RecruitItemService;

@Service("recruitItemService")
public class RecruitItemServiceImpl implements RecruitItemService{

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="recruitItemDao")
	private RecruitItemDao recruitItemDao;
	

	@Override
	public List<Map<String, Object>> selectRecommandRecruitList(Map<String, Object> map) throws Exception {
		return recruitItemDao.selectRecommandRecruitList(map);
	}

}
