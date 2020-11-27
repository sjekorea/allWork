package allwork.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import allwork.dao.NetfuOpenResumeDao;
import allwork.service.NetfuOpenResumeService;

@Service("netfuOpenResumeService")
public class NetfuOpenResumeServiceImpl implements NetfuOpenResumeService{
	
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="netfuOpenResumeDao")
	private NetfuOpenResumeDao netfuOpenResumeDao;
	

	@Override
	public int selectNetfuOpenResumeCnt(Map<String, Object> map) throws Exception {
		return netfuOpenResumeDao.selectNetfuOpenResumeCnt(map);
	}

}
