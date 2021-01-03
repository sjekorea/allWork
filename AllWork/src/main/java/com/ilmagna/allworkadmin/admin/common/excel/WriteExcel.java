package com.ilmagna.allworkadmin.admin.common.excel;

import java.awt.Color;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xssf.usermodel.extensions.XSSFCellBorder.BorderSide;
import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;

/**
 * 데이터 목록 Excel 파일 다운로드
 */
@Service
public abstract class WriteExcel {
	
	protected Log logger = LogFactory.getLog(WriteExcel.class);
	
	protected static XSSFColor cellGreenColor = new XSSFColor(new java.awt.Color(204, 255, 204));
	protected static XSSFColor cellWhiteColor = new XSSFColor(new java.awt.Color(255, 255, 255));

	protected static XSSFColor cellBlueColor = new XSSFColor(new java.awt.Color(204, 255, 255));
	protected static XSSFColor cellYellowColor = new XSSFColor(new java.awt.Color(255, 255, 153));
	protected static XSSFColor cellOrangeColor = new XSSFColor(new java.awt.Color(255, 204, 153));
	
	protected static int dateStartCell = 0;
 
	
	/**
	 * Data 생성
	 * @param row
	 * @param columnIndex
	 * @param value
	 * @param workbook
	 */
	protected void addDataText(XSSFRow row, int columnIndex, String value, XSSFWorkbook workbook, XSSFColor cellColor) {
		XSSFCellStyle style = workbook.createCellStyle();
		Font font = workbook.createFont(); 
		font.setFontName("굴림");
		font.setFontHeight((short)200);
		
		style.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER); 
		style.setAlignment(XSSFCellStyle.ALIGN_LEFT); 
		
		style.setFillBackgroundColor(cellWhiteColor);
		style.setFillForegroundColor(cellColor); 
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND); 
		
		addBorder(style);
	
		XSSFCell cell1 = row.createCell(columnIndex);
		cell1.setCellValue(value);
		cell1.setCellStyle(style);
	}
	
	/**
	 * 데이터 Formula 추가
	 * @param row
	 * @param columnIndex
	 * @param value
	 * @param workbook
	 */
	protected void addDataTextFormula(XSSFRow row, int columnIndex, String value, XSSFWorkbook workbook, XSSFColor cellColor) {
		XSSFCellStyle style = workbook.createCellStyle();
		Font font = workbook.createFont(); 
		font.setFontName("굴림");
		font.setFontHeight((short)200);
		
		style.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER); 
		style.setAlignment(XSSFCellStyle.ALIGN_LEFT); 
		
		style.setFillBackgroundColor(cellWhiteColor);
		style.setFillForegroundColor(cellColor);
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		
		addBorder(style);
	
		XSSFCell cell1 = row.createCell(columnIndex);
		cell1.setCellType(XSSFCell.CELL_TYPE_FORMULA);
		cell1.setCellStyle(style);
		cell1.setCellFormula(value);
	}
	
	/**
	 * 타이틀 헤더 생성
	 * @param row
	 * @param columnIndex
	 * @param value
	 * @param workbook
	 */
	protected void addTitleHeader(XSSFRow row, int columnIndex, String value, XSSFWorkbook workbook, XSSFColor cellColor) {

		XSSFCellStyle style = workbook.createCellStyle();
		Font font = workbook.createFont();
		font.setFontName("굴림");
		font.setBoldweight(Font.BOLDWEIGHT_BOLD);
		font.setFontHeight((short)320);
		style.setFont(font);
		style.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
		style.setAlignment(XSSFCellStyle.ALIGN_CENTER);
		
		style.setFillBackgroundColor(cellWhiteColor);
		style.setFillForegroundColor(cellColor);
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		
		addBorder(style);
	
		Cell cell1 = row.createCell(columnIndex);
		cell1.setCellValue(value);
		cell1.setCellStyle(style);
	}
	
	/**
	 * 테이블 헤더 생성
	 * @param row
	 * @param columnIndex
	 * @param value
	 * @param workbook
	 */
	protected void addTableHeader(XSSFRow row, int columnIndex, String value, XSSFWorkbook workbook, short fontSize, short fontBold, XSSFColor cellColor) {

		XSSFCellStyle style = workbook.createCellStyle();
		Font font = workbook.createFont();
		font.setFontName("굴림");
		font.setFontHeight(fontSize);
		font.setBoldweight(fontBold);
		style.setFont(font);
		style.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
		style.setAlignment(XSSFCellStyle.ALIGN_CENTER);
	
		style.setFillBackgroundColor(cellWhiteColor);
		style.setFillForegroundColor(cellColor);
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		
		addBorder(style);
	
		Cell cell1 = row.createCell(columnIndex);
		cell1.setCellValue(value);
		cell1.setCellStyle(style);
		
	}

	/**
	 * cell 테두리 설정
	 * @param cellStyle
	 */
	public static void addBorder(CellStyle cellStyle) {
		if (cellStyle != null) {
			XSSFColor borderColor = new XSSFColor(Color.black);
			cellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
			((XSSFCellStyle) cellStyle).setBorderColor(BorderSide.RIGHT, borderColor);
			cellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			((XSSFCellStyle) cellStyle).setBorderColor(BorderSide.LEFT, borderColor);
			cellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
			((XSSFCellStyle) cellStyle).setBorderColor(BorderSide.TOP, borderColor);
			cellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			((XSSFCellStyle) cellStyle).setBorderColor(BorderSide.BOTTOM, borderColor);
		}
	}

	protected XSSFSheet createSheet(XSSFWorkbook workbook, String type) {
		String sheetName = type;
		XSSFSheet sheet = workbook.createSheet(sheetName);
		return sheet;
	}

	protected XSSFWorkbook createWorkBook() {
		XSSFWorkbook workbook = new XSSFWorkbook();
		return workbook;
	}

	/**
	 * Excel 생성 함수
	 * @param out
	 * @param list
	 * @param fromDate
	 * @throws IOException
	 */
	public abstract void writeReport(ServletOutputStream out, List<ApiJqGridParams> list) throws IOException;

	/**
	 * Header 영역과 Data 영역 생성
	 * @param workbook
	 * @param list
	 * @param feeSheet
	 */
	protected void createListInfo(XSSFWorkbook workbook, List<ApiJqGridParams> list, XSSFSheet feeSheet) {
		createListHeader(feeSheet, workbook, list);
		createListData(feeSheet, workbook, list);
		logger.debug("Create Excel FeeInfo Header & Data.");
	}
	
	/**
	 * Header 영역 생성
	 * @param sheet
	 * @param workbook
	 */
	protected abstract void createListHeader(XSSFSheet sheet, XSSFWorkbook workbook, List<ApiJqGridParams> list);
 
	/**
	 * Data 영역 생성
	 * @param sheet
	 * @param workbook
	 * @param list
	 */
	protected abstract void createListData(XSSFSheet sheet, XSSFWorkbook workbook, List<ApiJqGridParams> list);
}
