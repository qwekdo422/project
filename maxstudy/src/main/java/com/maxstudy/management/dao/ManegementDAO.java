package com.maxstudy.management.dao;

import java.util.List;

import com.maxstudy.management.service.ManageDetailVO;
import com.maxstudy.management.service.ManagementVO;

/**
 * 직원교육관리 DAO
 * @author	: 김대오
 * @date	: 2017. 12. 27.
 */
public interface ManegementDAO {
	
	/**
	 * 직원교육목록
	 * @author	: 김대오
	 * @param	: 
	 * @retrun	: List<ManagementVO>
	 */
	public List<ManagementVO> manegementList(ManagementVO vo) throws Exception;
	
	/**
	 * 직원교육목록 전체 개수
	 * @author	: 김대오
	 * @date	: 2017. 12. 28.
	 * @return
	 */
	public int manegementTotalCnt() throws Exception;
	
	/**
	 * 직원교육 삭제
	 * @author	: 김대오
	 * @date	: 2017. 12. 28.
	 * @param i
	 */
	public void manegementDelete(int no) throws Exception;
	/**
	 * 직원상세관리 삭제
	 * @author	: 김대오
	 * @date	: 2018. 1. 4.
	 * @param no
	 */
	public void manegeDetailDelete(ManageDetailVO vo) throws Exception;
	/**
	 * 직원교육 등록
	 * @author	: 김대오
	 * @date	: 2017. 12. 29.
	 * @param vo
	 */
	public void manegementWrite(ManagementVO vo) throws Exception;
	
	/**
	 * 직원교육 상세목록
	 * @author	: 김대오
	 * @date	: 2018. 1. 2.
	 * @param no
	 * @return
	 */
	public List<ManageDetailVO> detailList(int no) throws Exception;
	
	/**
	 * 상세등록
	 * @author	: 김대오
	 * @date	: 2018. 1. 2.
	 * @param manageDedailVO
	 */
	public void detailInsert(ManageDetailVO manageDedailVO) throws Exception;
	
	/**
	 * 직원교육관리 조회
	 * @author	: 김대오
	 * @date	: 2018. 1. 2.
	 * @param no
	 * @return
	 */
	public ManagementVO managementSelect(int no) throws Exception;
	
	/**
	 * 직원교육상세등록 (정상 등록 및 엑셀 임포트)
	 * @author	: 김대오
	 * @date	: 2018. 1. 4.
	 * @param vo
	 */
	public void manageInsert(ManageDetailVO vo) throws Exception;

	/**
	 * 검색 전체 개수
	 * @author	: 김대오
	 * @date	: 2018. 1. 5.
	 * @return
	 */
	public int manegementTotalSearchCnt(ManagementVO vo) throws Exception;
	
	/**
	 * 상세정보 업데이트
	 * @author	: 김대오
	 * @date	: 2018. 1. 8.
	 * @param vo
	 */
	public void manegeDetailUpdate(ManageDetailVO vo) throws Exception;
	
	/**
	 * 상세정보 등록
	 * @author	: 김대오
	 * @date	: 2018. 1. 9.
	 * @param dVO
	 * @throws Exception
	 */
	public void manageDetailInsert(ManageDetailVO dVO) throws Exception;

}
