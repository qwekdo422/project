package com.maxstudy.management.service;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.xml.crypto.dsig.spec.XSLTTransformParameterSpec;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.maxstudy.management.dao.ManegementDAO;
import com.maxstudy.util.PageUtil;

/**
 * 직원교육관리 서비스
 * @author	: 김대오
 * @date	: 2017. 12. 27.
 */
@Service
public class ManagementService {
	
	@Autowired private ManegementDAO mDAO;
	
	/**
	 * 직원교육관리 목록
	 * @author	: 김대오
	 * @param	: 
	 * @retrun	:
	 */
	public HashMap<String, Object> manegementList(ManagementVO vo) throws Exception{
		int total = 0;
		// 검색으로 진입했을 경우
		if(vo.getSearchIN() != null && vo.getSearchIN().equals("Y")) {
			total = mDAO.manegementTotalSearchCnt(vo);
		} else { // 일반 진입
			total = mDAO.manegementTotalCnt();
		}
		PageUtil pInfo = new PageUtil(vo.getNowPage(), total);
		int start = (vo.getNowPage()-1) * (pInfo.getListCount())+1;
		int end = start+(pInfo.getListCount() - 1);
		vo.setStart(start);
		vo.setEnd(end);
		HashMap<String, Object> rMap = new HashMap<String, Object>();
		List<ManagementVO> list = mDAO.manegementList(vo); 
		rMap.put("list", list);
		rMap.put("pInfo", pInfo);
		return rMap;
	}
	
	/**
	 * 직원 교육관리 삭제
	 * @author	: 김대오
	 * @date	: 2017. 12. 28.
	 * @param vo(삭제할 배열 인덱스)
	 */
	public void manegementDelete(ManagementVO vo) throws Exception{
		ManageDetailVO dVO = new ManageDetailVO();
		if(vo.getCh_box().length != 0) {
			for (int i = 0; i < vo.getCh_box().length; i++) {
				dVO.setM_no(vo.getCh_box()[i]);
				mDAO.manegeDetailDelete(dVO);
				mDAO.manegementDelete(vo.getCh_box()[i]);
			}
		}
	}

	/**
	 * 직원교육관리 다중등록
	 * @author	: 김대오
	 * @date	: 2017. 12. 29.
	 * @param aVO
	 */
	public void manegementWrite(ManagementArrayVO aVO) throws Exception{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		for (int i = 0; i < aVO.getM_name().length; i++) {
			ManagementVO vo = new ManagementVO();
			vo.setM_name(aVO.getM_name()[i]);
			java.util.Date start = null;
			java.util.Date end = null;
			try {
				start =  sdf.parse(aVO.getM_sumdate()[i].split("~")[0].trim());
				end =  sdf.parse(aVO.getM_sumdate()[i].split("~")[1].trim());
			} catch (Exception e) {
				e.printStackTrace();
			}
			vo.setM_startdate(new java.sql.Date(start.getTime()));
			vo.setM_enddate(new java.sql.Date(end.getTime()));
			vo.setM_title(aVO.getM_title()[i]);
			vo.setM_evaluation(aVO.getM_evaluation()[i]);
			vo.setM_status(aVO.getM_status()[i]);
			// 복사한 테이블 번호
			vo.setM_no(aVO.getM_no()[i]);
			// 메인 직원관리 등록
			mDAO.manegementWrite(vo);
			// 매인직원관리 테이블의 상세테이블 조회
			List<ManageDetailVO> rList = mDAO.detailList(aVO.getM_no()[i]);
			// 상세테이블 복사한거 등록
			for (int j = 0; j < rList.size(); j++) {
				mDAO.detailInsert(rList.get(j));
			}
		}
		
	}
	
	/**
	 * 직원교육 상세목록
	 * @author	: 김대오
	 * @date	: 2018. 1. 2.
	 * @param m_no
	 * @return
	 */
	public List<ManageDetailVO> manageDetail(int no) throws Exception{
		return mDAO.detailList(no);
	}
	
	/**
	 * 직원교육관리 조회
	 * @author	: 김대오
	 * @date	: 2018. 1. 2.
	 * @param no
	 * @return
	 */
	public ManagementVO managementSelect(int no) throws Exception{
		return mDAO.managementSelect(no);
	}
	
	/**
	 * 엑실 임포트
	 * @author	: 김대오
	 * @date	: 2018. 1. 4.
	 * @param vo
	 */
	public void excelInsert(ManagementVO vo) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// 상세티이블에 들어갈 데이터
		ArrayList<ManageDetailVO> list = new ArrayList<ManageDetailVO>();
		HSSFWorkbook workbook = null;
		Sheet workSheet = null;
		Row row = null;
		Cell cell = null;
		try {
			File file = new File(vo.getExcelFile().getOriginalFilename());
			vo.getExcelFile().transferTo(file);
			workbook = new HSSFWorkbook(new FileInputStream(file));
			workSheet = workbook.getSheetAt(0);
			// 전체 행
			int rows = workSheet.getPhysicalNumberOfRows();
			// 마지막열
			int lastCol = workSheet.getRow(rows-1).getLastCellNum();
			for (int i = 0; i < rows; i++) {
				row = workSheet.getRow(i); // 행
				if(i == 1) { // 메인테이블에 들어갈 데이터 
					for (int j = 0; j < lastCol; j++) {
						cell = row.getCell(j);
						String strVal = cell.getStringCellValue();
						switch (j) {
							case 0: vo.setM_name(strVal); break; // 이름
							case 1: 
								java.util.Date sDate = sdf.parse(strVal.split("~")[0].trim());	
								java.util.Date eDate = sdf.parse(strVal.split("~")[1].trim());
								vo.setM_startdate(new java.sql.Date(sDate.getTime())); // 교육시잘일
								vo.setM_enddate(new java.sql.Date(eDate.getTime())); // 교육종료일
								break;
							case 3: vo.setM_title(strVal); break; // 교육과정명
							case 4: vo.setM_evaluation(strVal); break; // 평가
							case 5: vo.setM_status(strVal);; break; // 합격여부
						}
					}
				}
				
				if(i > 3) { // 상세테이블에 들어갈 데이터
					ManageDetailVO dVO = new ManageDetailVO();
					for (int j = 0; j < lastCol; j++) {
						cell = row.getCell(j);
						String strVal = "";
						switch (cell.getCellType()) { // 타입 확인
						case Cell.CELL_TYPE_NUMERIC: // NUMERIC 타입일 경우
							if(HSSFDateUtil.isCellDateFormatted(cell)) { // 날짜 형태
					           SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
					           strVal = formatter.format(cell.getDateCellValue());
							}
							break;
						case Cell.CELL_TYPE_STRING: // 문자타입
							strVal = cell.toString();
						}
						switch (j) {
							case 0: dVO.setS_name(strVal); break; // 이름
							case 1:
								dVO.setS_date(strVal);
								/*
								java.util.Date wday = sdf.parse(strVal);
								dVO.setS_date(new java.sql.Date(wday.getTime()));
								*/
								break;
							case 2: dVO.setS_day(strVal); break; // 요일
							case 3: dVO.setS_content(strVal); break; // 교육내용
							case 4: dVO.setS_evaluation(strVal); break; // 평가 
							case 5: dVO.setS_comment(strVal);; break; // 비고
						} // switch 종료
					} // inner 반복 종료
					list.add(dVO);
				} // 조건종료
			} // outer 반복 종료
		} catch (Exception e) {e.printStackTrace();}
		
		// 직원교육관리 등록(메인테이블)
		mDAO.manegementWrite(vo);
		// 직원교욱관리상시 등록(서브테이블)
		for (int i = 0; i < list.size(); i++) {
			mDAO.manageInsert(list.get(i));
		}
	}
	
	/**
	 * 상세정보 업데이트
	 * @author	: 김대오
	 * @date	: 2018. 1. 8.
	 * @param vo
	 */
	public void manageDetailUpdate(ManageDetailVO vo) throws Exception{
		mDAO.manegeDetailUpdate(vo);
	}
	
	/**
	 * 상세정보 등록
	 * @author	: 김대오
	 * @date	: 2018. 1. 9.
	 * @param dVO
	 */
	public void manageDetailInsert(ManageDetailVO dVO) throws Exception {
		mDAO.manageDetailInsert(dVO);
	}

	/**
	 * 상세정보 삭제
	 * @author	: 김대오
	 * @date	: 2018. 1. 9.
	 * @param dVO
	 */
	public void manageDetailDelete(ManageDetailVO dVO) throws Exception{
		mDAO.manegeDetailDelete(dVO);
	}
	
	/**
	 * 직원교육 등록 단일등록
	 * @author	: 김대오
	 * @date	: 2018. 1. 10.
	 * @param vo
	 */
	public void writeProc(ManagementVO vo) throws Exception{
		mDAO.manegementWrite(vo);
	}

}
