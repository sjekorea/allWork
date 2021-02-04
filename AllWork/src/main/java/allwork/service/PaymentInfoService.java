package allwork.service;

import java.util.List;
import java.util.Map;

public interface PaymentInfoService {
	
	int selectPaymentInfoCnt(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectPaymentInfoList(Map<String, Object> map) throws Exception;
	int selectPaymentTotal(Map<String, Object> map) throws Exception;
	int insertPaymentInfo(Map<String, Object> map) throws Exception;
	int updateRefundPaymentInfo(Map<String, Object> map) throws Exception;
	//유료열람서비스
	int insertPaidResumeSearch(Map<String, Object> map) throws Exception;
	int selectPaidResumeSearchCount(Map<String, Object> map) throws Exception;
}
