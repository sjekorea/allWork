package allwork.common.util;

public class CommonColumnUtil {
	
	
	public static String getRecruitColumn(){
		
		String rtnStr = "";
		rtnStr += "nic.no, nic.uid, nic.info_type, nic.biz_name, nic.biz_title, 'open', nic.biz_post, nic.biz_address1, nic.biz_address2";
		rtnStr += ", nic.biz_type1, getCodeName(nic.biz_type1) biz_type1_name";
		rtnStr += ", nic.biz_type2, getCodeName(nic.biz_type2) biz_type2_name";
		rtnStr += ", nic.biz_type3, getCodeName(nic.biz_type3) biz_type3_name";
		rtnStr += ", nic.biz_type4, getCodeName(nic.biz_type4) biz_type4_name";
		rtnStr += ", nic.biz_type5, getCodeName(nic.biz_type5) biz_type5_name";
		rtnStr += ", nic.biz_type6, getCodeName(nic.biz_type6) biz_type6_name";
		rtnStr += ", nic.biz_type7, getCodeName(nic.biz_type7) biz_type7_name";
		rtnStr += ", nic.biz_type8, getCodeName(nic.biz_type8) biz_type8_name";
		rtnStr += ", nic.biz_type9, getCodeName(nic.biz_type9) biz_type9_name";
		rtnStr += ", nic.biz_position";
		rtnStr += ", nic.biz_area1, getCodeName(nic.biz_area1) biz_area1_name";
		rtnStr += ", nic.biz_area2, getCodeName(nic.biz_area2) biz_area2_name";
		rtnStr += ", nic.biz_area3, getCodeName(nic.biz_area3) biz_area3_name";
		rtnStr += ", nic.biz_area4, getCodeName(nic.biz_area4) biz_area4_name";
		rtnStr += ", nic.biz_area5, getCodeName(nic.biz_area5) biz_area5_name";
		rtnStr += ", nic.biz_area6, getCodeName(nic.biz_area6) biz_area6_name";
		rtnStr += ", nic.biz_subway, nic.biz_business, nic.biz_men";
		rtnStr += ", nic.biz_jobfrom, getCodeName(nic.biz_jobfrom) biz_jobfrom_name";
		rtnStr += ", nic.biz_pay, getCodeName(nic.biz_pay) biz_pay_name";
		rtnStr += ", nic.biz_welfare, nic.biz_sex, nic.biz_age, nic.biz_ability";
		rtnStr += ", nic.biz_preferential, getCodeName(nic.biz_preferential) biz_preferential_name";
		rtnStr += ", nic.biz_career, nic.biz_detail, nic.biz_end_day, nic.biz_end_type, nic.biz_ing";
		rtnStr += ", nic.biz_method, getCodeName(nic.biz_method) biz_method_name";
		rtnStr += ", nic.biz_person, nic.biz_pemail, nic.biz_pphone, nic.biz_pfax";
		rtnStr += ", DATE_FORMAT(nic.wdate, '%m/%d') wdate";
		rtnStr += ", DATE_FORMAT(nic.u_wdate, '%m/%d') u_wdate";
		rtnStr += ", DATE_FORMAT(nic.j_wdate, '%m/%d') j_wdate";
		rtnStr += ", nic.service1, nic.service2, nic.service3, nic.service4, nic.service5, nic.service100";
		rtnStr += ", nic.service6, nic.service7, nic.service8, nic.service9, nic.service10, nic.service11";
		rtnStr += ", nic.biz_paper, getCodeName(nic.biz_paper) biz_paper_name";
		rtnStr += ", nic.biz_form, nic.biz_form_file, nic.sms_send, nic.biz_page, nic.hit, nic.type_r, nic.order_view";
		
		return rtnStr;
	}

}
