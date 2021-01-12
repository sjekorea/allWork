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
		rtnStr += ", nic.biz_form, nic.biz_form_file, nic.sms_send, nic.biz_page, nic.hit, nic.type_r, nic.order_view, pay_type";
		
		return rtnStr;
	}
	
	
	public static String getResumeColumn(){
		
		String rtnStr = "";
		rtnStr += "nir.no, nir.uid, nir.info_type, nir.basic, nir.name, nir.inid_p_chk, nir.inid_photo, nir.inid_phone, nir.inid_hphone, nir.inid_email, nir.inid_post ";
		rtnStr += ", nir.inid_address1, nir.inid_address2, nir.inid_home, nir.inid_title, nir.indi_condition";
		rtnStr += ", nir.inid_area1, getCodeName(nir.inid_area1) inid_area1_name";
		rtnStr += ", nir.inid_area2, getCodeName(nir.inid_area2) inid_area2_name";
		rtnStr += ", nir.inid_area3, getCodeName(nir.inid_area3) inid_area3_name";
		rtnStr += ", nir.inid_area4, getCodeName(nir.inid_area4) inid_area4_name";
		rtnStr += ", nir.inid_area5, getCodeName(nir.inid_area5) inid_area5_name";
		rtnStr += ", nir.inid_area6, getCodeName(nir.inid_area6) inid_area6_name";
		rtnStr += ", nir.inid_type1, getCodeName(nir.inid_type1) inid_type1_name";
		rtnStr += ", nir.inid_type2, getCodeName(nir.inid_type2) inid_type2_name";
		rtnStr += ", nir.inid_type3, getCodeName(nir.inid_type3) inid_type3_name";
		rtnStr += ", nir.inid_type4, getCodeName(nir.inid_type4) inid_type4_name";
		rtnStr += ", nir.inid_type5, getCodeName(nir.inid_type5) inid_type5_name";
		rtnStr += ", nir.inid_type6, getCodeName(nir.inid_type6) inid_type6_name";
		rtnStr += ", nir.inid_type7, getCodeName(nir.inid_type7) inid_type7_name";
		rtnStr += ", nir.inid_type8, getCodeName(nir.inid_type8) inid_type8_name";
		rtnStr += ", nir.inid_type9, getCodeName(nir.inid_type9) inid_type9_name";
		rtnStr += ", nir.inid_mylskill";
		rtnStr += ", nir.inid_jobform, getCodeName(nir.inid_jobform) inid_jobform_name";
		rtnStr += ", nir.inid_pay, getCodeName(nir.inid_pay) inid_pay_name";
		rtnStr += ", nir.pay_type, getCodeName(nir.pay_type) pay_type_name";
		rtnStr += ", nir.inid_last_school, nir.inid_career, nir.inid_license, nir.inid_languages, nir.inid_introduce, nir.inid_secret";
		rtnStr += ", DATE_FORMAT(nir.wdate, '%m/%d') wdate";
		rtnStr += ", DATE_FORMAT(nir.u_wdate, '%m/%d') u_wdate";
		rtnStr += ", DATE_FORMAT(nir.j_wdate, '%m/%d') j_wdate";
		rtnStr += ", nir.hit, nir.service11, nir.service12, nir.service13, nir.service101, nir.service14, nir.service15, nir.service16, nir.service17";
		rtnStr += ", nir.inid_sex, nir.sms_send, nir.a_insert";
		rtnStr += ", nir.education2, nir.career2, nir.license2, nir.language2";
		rtnStr += ", nir.inid_area_job1, getCodeName(nir.inid_area_job1) inid_area_job1_name";
		rtnStr += ", nir.inid_area_job2, getCodeName(nir.inid_area_job2) inid_area_job2_name";
		rtnStr += ", nir.inid_area_job3, getCodeName(nir.inid_area_job3) inid_area_job3_name";
		rtnStr += ", nir.inid_area_job4, getCodeName(nir.inid_area_job4) inid_area_job4_name";
		rtnStr += ", nir.inid_area_job5, getCodeName(nir.inid_area_job5) inid_area_job5_name";
		rtnStr += ", nir.inid_area_job6, getCodeName(nir.inid_area_job6) inid_area_job6_name";
		rtnStr += ", nir.inid_area_job7, getCodeName(nir.inid_area_job7) inid_area_job7_name";
		rtnStr += ", nir.inid_area_job8, getCodeName(nir.inid_area_job8) inid_area_job8_name";
		rtnStr += ", nir.inid_area_job9, getCodeName(nir.inid_area_job9) inid_area_job9_name";
		rtnStr += ", portfolio_file";
		
		return rtnStr;
	}

}
