package allwork.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import allwork.dao.PaymentInfoDao;
import allwork.service.PaymentInfoService;

@Service("paymentInfoService")
public class PaymentInfoServiceImpl implements PaymentInfoService{
	
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="paymentInfoDao")
	private PaymentInfoDao paymentInfoDao;
	
	
	@Override
	public int selectPaymentInfoCnt(Map<String, Object> map) throws Exception {
		return paymentInfoDao.selectPaymentInfoCnt(map);
	}
	
	@Override
	public List<Map<String, Object>> selectPaymentInfoList(Map<String, Object> map) throws Exception {
		return paymentInfoDao.selectPaymentInfoList(map);
	}
	
	@Override
	public int selectPaymentTotal(Map<String, Object> map) throws Exception {
		return paymentInfoDao.selectPaymentTotal(map);
	}
	
	@Override
	public int insertPaymentInfo(Map<String, Object> map) throws Exception {
		return paymentInfoDao.insertPaymentInfo(map);
	}
	

}
