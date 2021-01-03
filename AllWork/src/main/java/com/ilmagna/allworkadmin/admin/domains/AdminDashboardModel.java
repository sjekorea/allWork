package com.ilmagna.allworkadmin.admin.domains;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;

public class AdminDashboardModel extends ApiJqGridParams implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private Integer id;
	private AdminDashboardItemModel db_today;				//금일 현황.
	private AdminDashboardItemModel db_week;				//금주 현황.
	private AdminDashboardItemModel db_month;				//금월 현황.
	private AdminDashboardItemModel db_year;				//금년 현황.
	private AdminDashboardItemModel db_total;				//전체 현황.
	private List<AdminDashboardItemModel> year_by_month;	//연도별 현황.
	
	Integer year;
	String fromDate, toDate;

	public AdminDashboardModel() {
		this.id = 0;
		this.db_today = new AdminDashboardItemModel();					//금일 현황.
		this.db_week = new AdminDashboardItemModel();					//금주 현황.
		this.db_month = new AdminDashboardItemModel();					//금월 현황.
		this.db_year = new AdminDashboardItemModel();					//금년 현황.
		this.db_total = new AdminDashboardItemModel();					//전체 현황.
		this.year_by_month = new ArrayList<AdminDashboardItemModel>();	//연도별 현황.
		for (int i = 0; i < 12; i++) {
			AdminDashboardItemModel item = new AdminDashboardItemModel();
			this.year_by_month.add(item);
		}
	}
	
	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * @return the db_today
	 */
	public AdminDashboardItemModel getDb_today() {
		return db_today;
	}
	/**
	 * @param db_today the db_today to set
	 */
	public void setDb_today(AdminDashboardItemModel db_today) {
		this.db_today = db_today;
	}
	/**
	 * @return the db_week
	 */
	public AdminDashboardItemModel getDb_week() {
		return db_week;
	}
	/**
	 * @param db_week the db_week to set
	 */
	public void setDb_week(AdminDashboardItemModel db_week) {
		this.db_week = db_week;
	}
	/**
	 * @return the db_month
	 */
	public AdminDashboardItemModel getDb_month() {
		return db_month;
	}
	/**
	 * @param db_month the db_month to set
	 */
	public void setDb_month(AdminDashboardItemModel db_month) {
		this.db_month = db_month;
	}
	/**
	 * @return the db_year
	 */
	public AdminDashboardItemModel getDb_year() {
		return db_year;
	}

	/**
	 * @param db_year the db_year to set
	 */
	public void setDb_year(AdminDashboardItemModel db_year) {
		this.db_year = db_year;
	}
	/**
	 * @return the year_by_month
	 */
	public List<AdminDashboardItemModel> getYear_by_month() {
		return year_by_month;
	}

	/**
	 * @param year_by_month the year_by_month to set
	 */
	public void setYear_by_month(List<AdminDashboardItemModel> year_by_month) {
		this.year_by_month = year_by_month;
	}

	/**
	 * @return the db_total
	 */
	public AdminDashboardItemModel getDb_total() {
		return db_total;
	}
	/**
	 * @param db_total the db_total to set
	 */
	public void setDb_total(AdminDashboardItemModel db_total) {
		this.db_total = db_total;
	}
	/**
	 * @return the year
	 */
	public Integer getYear() {
		return year;
	}

	/**
	 * @param year the year to set
	 */
	public void setYear(Integer year) {
		this.year = year;
	}

	/**
	 * @return the fromDate
	 */
	public String getFromDate() {
		return fromDate;
	}

	/**
	 * @param fromDate the fromDate to set
	 */
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	/**
	 * @return the toDate
	 */
	public String getToDate() {
		return toDate;
	}

	/**
	 * @param toDate the toDate to set
	 */
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
}
