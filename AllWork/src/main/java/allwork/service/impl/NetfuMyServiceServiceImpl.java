package allwork.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import allwork.common.CommandMap;
import allwork.dao.NetfuMyServiceDao;
import allwork.service.NetfuMyServiceService;
import allwork.service.PaymentInfoService;
import allwork.vo.NetfuItemResumeVo;

@Service("netfuMyServiceService")
public class NetfuMyServiceServiceImpl implements NetfuMyServiceService{
	
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="netfuMyServiceDao")
	private NetfuMyServiceDao netfuMyServiceDao;

	@Resource(name="paymentInfoService")
	private PaymentInfoService paymentInfoService;	


	// 맞춤 채용 정보  검색 Count
	@Override
	public int selectMyServiceRecruitCnt(Map<String, Object> map) throws Exception {
		return netfuMyServiceDao.selectMyServiceRecruitCnt(map);
	}
	
	// 맞춤 채용 정보  목록 
	@Override
	public List<Map<String, Object>> selectMyServiceRecruitList(Map<String, Object> map) throws Exception {
		return netfuMyServiceDao.selectMyServiceRecruitList(map);
	}
	
	// 맞춤 인재 정보  검색 Count
	@Override
	public int selectMyServiceResumeCnt(Map<String, Object> map) throws Exception {
		return netfuMyServiceDao.selectMyServiceResumeCnt(map);
	}
	
	// 맞춤 인재 정보  목록 
	@Override
	//public List<Map<String, Object>> selectMyServiceResumeList(Map<String, Object> map) throws Exception {
	public List<NetfuItemResumeVo> selectMyServiceResumeList(boolean bPaidUser, Map<String, Object> map) throws Exception {
		//return netfuMyServiceDao.selectMyServiceResumeList(map);
		List<Map<String, Object>> rtnList = netfuMyServiceDao.selectMyServiceResumeList(map);
		List<NetfuItemResumeVo> listResult = new ArrayList<NetfuItemResumeVo>();
		for (int i = 0; i < rtnList.size(); i++) {
			NetfuItemResumeVo item = (NetfuItemResumeVo) rtnList.get(i);
			
			int paidResume = 0;
			if (bPaidUser) {
				CommandMap commandMap = new CommandMap();
				commandMap.put("loginId", map.get("loginId"));
				try {
					commandMap.put("resumeNo", item.getNo());
					int prsCnt = paymentInfoService.selectPaidResumeSearchCount(commandMap.getMap());
					if (prsCnt > 0) paidResume = 1;
				} catch (Exception e2) { }					
			}
			item.setPaidResume(paidResume);

			listResult.add(item);				
		}
		return listResult;
	}
	
	// 맞춤 정보 설정 정보
	@Override
	public Map<String, Object> selectNetfuMyServiceMap(Map<String, Object> map) throws Exception {
		return netfuMyServiceDao.selectNetfuMyServiceMap(map);
	}
	
	// 맞춤 채용정보 등록
	@Override
	public int insertNetfuMyService(Map<String, Object> map) throws Exception {
		return netfuMyServiceDao.insertNetfuMyService(map);
	}
	
	// 맞춤 채용정보 수정
	@Override
	public int updateNetfuMyService(Map<String, Object> map) throws Exception {
		return netfuMyServiceDao.updateNetfuMyService(map);
	}

}
