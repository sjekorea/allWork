package allwork.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;

import allwork.common.CommandMap;
import allwork.dao.NetfuItemResumeDao;
import allwork.service.NetfuItemResumeService;
import allwork.service.PaymentInfoService;
import allwork.vo.NetfuItemResumeVo;

@Service("netfuItemResumeService")
public class NetfuItemResumeServiceImpl implements NetfuItemResumeService{
	
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="netfuItemResumeDao")
	private NetfuItemResumeDao netfuItemResumeDao;

	@Resource(name="paymentInfoService")
	private PaymentInfoService paymentInfoService;	

	
	@Override
	public int selectRecentlyResumeNo(Map<String, Object> map) throws Exception {
		return netfuItemResumeDao.selectRecentlyResumeNo(map);
	}
	
	@Override
	public int selectNetfuItemResumeCnt(Map<String, Object> map) throws Exception {
		int rtnCnt = 0;
		/*
		if("keyword".equals((String)map.get("searchFlag"))){
			rtnCnt = netfuItemResumeDao.selectKeywordNetfuItemResumeCnt(map);
		}else{
			rtnCnt = netfuItemResumeDao.selectNetfuItemResumeCnt(map);
		}
		*/
		rtnCnt = netfuItemResumeDao.selectNetfuItemResumeCnt(map);

		return rtnCnt;
	}
	
	@Override
	public int selectNetfuItemMyResumeCnt(Map<String, Object> map) throws Exception {
		int rtnCnt = 0;
		/*
		if("keyword".equals((String)map.get("searchFlag"))){
			rtnCnt = netfuItemResumeDao.selectKeywordNetfuItemResumeCnt(map);
		}else{
			rtnCnt = netfuItemResumeDao.selectNetfuItemMyResumeCnt(map);
		}
		*/
		rtnCnt = netfuItemResumeDao.selectNetfuItemMyResumeCnt(map);

		return rtnCnt;
	}

	@Override
	//public List<Map<String, Object>> selectNetfuItemResumeList(Map<String, Object> map) throws Exception {
	public List<NetfuItemResumeVo> selectNetfuItemResumeList(boolean bPaidUser, Map<String, Object> map) throws Exception {
		List<Map<String, Object>> rtnList = new ArrayList<Map<String, Object>>();
		/*
		if("keyword".equals((String)map.get("searchFlag"))){
			rtnList = netfuItemResumeDao.selectKeywordNetfuItemResumeList(map);
		}else{
			rtnList = netfuItemResumeDao.selectNetfuItemResumeList(map);
		}
		*/
		List<NetfuItemResumeVo> listResult = new ArrayList<NetfuItemResumeVo>();
		rtnList = netfuItemResumeDao.selectNetfuItemResumeList(map);
		for (int i = 0; i < rtnList.size(); i++) {
			NetfuItemResumeVo item = (NetfuItemResumeVo) rtnList.get(i);
			
			if (bPaidUser) {
				int paidResume = 0;
				CommandMap commandMap = new CommandMap();
				commandMap.put("loginId", map.get("loginId2"));
				try {
					commandMap.put("resumeNo", item.getNo());
					int prsCnt = paymentInfoService.selectPaidResumeSearchCount(commandMap.getMap());
					if (prsCnt > 0) paidResume = 1;
				} catch (Exception e2) { }					

				item.setPaidResume(paidResume);
			}

			listResult.add(item);				
		}

		//return rtnList;
		return listResult;
	}

	@Override
	public List<Map<String, Object>> selectNetfuItemResumeAllList(Map<String, Object> map) throws Exception {
		return	netfuItemResumeDao.selectNetfuItemResumeAllList(map);
	}
	
	@Override
	public Map<String, Object> selectNetfuItemResumeMap(Map<String, Object> map) throws Exception {
		return netfuItemResumeDao.selectNetfuItemResumeMap(map);
	}
	
	// 유료회원 이력서 목록
	@Override
	public List<Map<String, Object>> selectPayResumeList(Map<String, Object> map) throws Exception {
		return netfuItemResumeDao.selectPayResumeList(map);
	}
	
	// 이력서 정보 등록
	@Override
	public int insertNetfuItemResume(Map<String, Object> map) throws Exception {
		return netfuItemResumeDao.insertNetfuItemResume(map);
	}
	
	// 이력서수정
	@Override
	public int updateNetfuItemResume(Map<String, Object> map) throws Exception {
		return netfuItemResumeDao.updateNetfuItemResume(map);
	}
	
	// 이력서 공개/비공개 설정
	@Override
	public int updateNetfuItemResumeSecret(Map<String, Object> map) throws Exception {
		return netfuItemResumeDao.updateNetfuItemResumeSecret(map);
	}
	
	// 이력서 정보  삭제
	@Override
	public int deleteNetfuItemResumeMulti(Map<String, Object> map) throws Exception {
		return netfuItemResumeDao.deleteNetfuItemResumeMulti(map);
	}


}
