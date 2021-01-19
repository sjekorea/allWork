package allwork.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import allwork.common.dao.AbstractDAO;

@Repository("paymentInfoDao")
public class PaymentInfoDao extends AbstractDAO{
	
	// 결제 정보 조회 수
	public int selectPaymentInfoCnt(Map<String, Object> map) throws Exception{
		return selectCnt("paymentInfo.selectPaymentInfoCnt", map);
	}
	
	// 결제 정보 목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPaymentInfoList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("paymentInfo.selectPaymentInfoList", map);
	}
	
	// 총 결제 금액
	public int selectPaymentTotal(Map<String, Object> map) throws Exception{
		return selectCnt("paymentInfo.selectPaymentTotal", map);
	}
	
	// 결제 정보 등록
	public int insertPaymentInfo(Map<String, Object> map) throws Exception{
		return insert("paymentInfo.insertPaymentInfo", map);
	}
	
}
