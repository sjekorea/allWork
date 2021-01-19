package allwork.service;

import java.util.List;
import java.util.Map;

public interface PaymentInfoService {
	
	int selectPaymentInfoCnt(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectPaymentInfoList(Map<String, Object> map) throws Exception;
	int selectPaymentTotal(Map<String, Object> map) throws Exception;
	int insertPaymentInfo(Map<String, Object> map) throws Exception;
}
