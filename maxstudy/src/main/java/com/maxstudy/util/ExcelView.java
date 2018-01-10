package com.maxstudy.util;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.maxstudy.management.service.ManageDetailVO;
import com.maxstudy.management.service.ManagementVO;

public class ExcelView extends AbstractExcelView {
	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 직원교육관리 목록
		ManagementVO vo = (ManagementVO)model.get("vo");
		// 직원교육관리 상세목록
		List<ManageDetailVO> list =(List<ManageDetailVO>)model.get("list");
		String excelName = vo.getM_name();
		
		String[] colNameMain = {"이름", "교육기간", "교육과정", "평가", "합격여부"};
		String[] colNameSub = {"이름", "일자", "요일", "교육내용", "평가", "비고"};
		
		Sheet workSheet = null;
		Row row = null;
		
		workSheet = workbook.createSheet(vo.getM_startdate()+" ~ "+vo.getM_enddate());
		excelName = URLEncoder.encode(excelName, "UTF-8");
		int repeatCnt = 2;	// 반복 카운트
		int idx = 0;		// 열 카운트
		int rowIdx = 0;		// 행 카운트
		for (int i = 0; i < repeatCnt; i++) {
			// 행 0
			row = workSheet.createRow(i);
			if(i == 0) {
				for (int j = 0; j < colNameMain.length; j++) {
					row.createCell(j).setCellValue(colNameMain[j]);
				}
			} else {
				// 행 1
				row = workSheet.createRow(i);
				row.createCell(idx++).setCellValue(vo.getM_name());
				row.createCell(idx++).setCellValue(vo.getM_startdate()+" ~ " +vo.getM_enddate());
				row.createCell(idx++).setCellValue(vo.getM_title());
				row.createCell(idx++).setCellValue(vo.getM_evaluation());
				row.createCell(idx++).setCellValue(vo.getM_status());
				rowIdx = i;
			}
		}
		

		
		// 행 2
		row = workSheet.createRow(++rowIdx);
		idx = 0;
		
		// 교육직원관리 상세
		for (int i = 0; i < repeatCnt; i++) {
			// 행 3
			if(i == 0) {
				row = workSheet.createRow(i + (++rowIdx)); //3
				for (int j = 0; j < colNameSub.length; j++) {
					row.createCell(j).setCellValue(colNameSub[j]);
				}
			} else {
				// 행 4
				for (int j = 0; j < list.size(); j++) {
					row = workSheet.createRow(j + (rowIdx + 1)); // 4 ~
					ManageDetailVO dVO = list.get(j);
					row.createCell(idx++).setCellValue(dVO.getS_name());
					row.createCell(idx++).setCellValue(dVO.getS_date().toString());
					row.createCell(idx++).setCellValue(dVO.getS_day());
					row.createCell(idx++).setCellValue(dVO.getS_content());
					row.createCell(idx++).setCellValue(dVO.getS_evaluation());
					row.createCell(idx++).setCellValue(dVO.getS_comment());
					idx = 0;
				}
			}
		}
		
		response.setContentType("Application/Msexcel");
        response.setHeader("Content-Disposition", "ATTachment; Filename="+excelName+"-excel.xls");
	}
}
