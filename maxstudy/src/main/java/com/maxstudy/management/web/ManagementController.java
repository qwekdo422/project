package com.maxstudy.management.web;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.maxstudy.management.service.ManageDetailVO;
import com.maxstudy.management.service.ManagementArrayVO;
import com.maxstudy.management.service.ManagementService;
import com.maxstudy.management.service.ManagementVO;
import com.maxstudy.util.PageUtil;
/**
 * 직원교육관리 컨트롤러
 * @author	: 김대오
 * @date	: 2017. 12. 27.
 */
@Controller
@RequestMapping("/management")
public class ManagementController {
	
	@Autowired private ManagementService mService;
	
	@RequestMapping("test")
	public void test(){}

	/**
	 * 직원교육관리 목록
	 * @author	: 김대오
	 * @param	: nowPage (현재페이지)
	 * @return	: List<ManagementVO> 직원교육관히 목록
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/list.do")
	public String manegementList(@ModelAttribute("searchVO") ManagementVO vo, Model model) throws Exception{
		if(vo.getNowPage() == 0) {
			vo.setNowPage(1);
		}
		HashMap<String, Object> map = mService.manegementList(vo);
		PageUtil pInfo = (PageUtil) map.get("pInfo");
		List<ManagementVO> list = (List<ManagementVO>) map.get("list");
		model.addAttribute("list", list);
		model.addAttribute("startPage", pInfo.getStartPage());
		model.addAttribute("endPage", pInfo.getEndPage());
		model.addAttribute("nowPage", pInfo.getNowPage());
		model.addAttribute("totalPage", pInfo.getTotalPage());
		return "management/list";
	}
	
	/**
	 * 직원교육관리 삭제 
	 * @author	: 김대오
	 * @date	: 2017. 12. 28.
	 * @param 	: vo (삭제할 숫자배열)
	 * @return
	 */
	@RequestMapping("/delete.do")
	public String managementDelete(ManagementVO vo) throws Exception{
		mService.manegementDelete(vo);
		return "redirect:list.do";
	}
	
	/**
	 * 직원교육관리 다중 등록
	 * vo안의 각 필드를 배열로 받는방식(비추)
	 * @author	: 김대오
	 * @date	: 2017. 12. 29.
	 * @param aVO
	 * @return
	 */
	@RequestMapping("/write.do")
	public String managementWrite(ManagementArrayVO aVO) throws Exception{
		mService.manegementWrite(aVO);
		return "redirect:list.do";
	}
	
	/**
	 * 직원교육관리 등록 폼
	 * @author	: 김대오
	 * @date	: 2018. 1. 9.
	 */
	@RequestMapping("writeForm")
	public void writeForm(){}
	
	/**
	 * 직원교육등록 + 직원교육 상세등록
	 * @author	: 김대오
	 * @date	: 2018. 1. 10.
	 * @param vo / 직원교육정보
	 * @param dVO / 직원교육 상세정보
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("writeProc")
	public String writeProc(ManagementVO vo, ManageDetailVO dVO) throws Exception{
		mService.writeProc(vo); // 직원교육등록
		// 직원교육 상세정보 개수만큼 반복하면서 등록
		for (int i = 0; i < dVO.getDetailList().size(); i++) {
			ManageDetailVO rVO = dVO.getDetailList().get(i);
			rVO.setS_name(vo.getM_name());
			mService.manageDetailInsert(rVO);
		}
		return "redirect:list.do";
	}
	
	/**
	 * 직원교육 상세목록
	 * @author	: 김대오
	 * @date	: 2018. 1. 2.
	 * @param m_no
	 * @return
	 */
	@RequestMapping("/detail")
	public String manageDetail(ManagementVO vo, Model model) throws Exception{
		List<ManageDetailVO> list = mService.manageDetail(vo.getM_no());
 		String request = "";
		if(vo.getRequestKey() != null && vo.getRequestKey() != ""){
			request = vo.getRequestKey();
		}
		vo = mService.managementSelect(vo.getM_no());
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		if(request.equals("updateForm")) { // updateForm 으로 파라메터가 올경우 수정화면으로
			return "management/updateForm";
		}
		return "management/detail"; // 상세화면으로
	}
	
	/**
	 * 직원교육정보를 엑셀로 저장
	 * @author	: 김대오
	 * @date	: 2018. 1. 3.
	 * @param model
	 * @return
	 */
	@RequestMapping("/excelOut")
	public ModelAndView excelDown(Map<String,Object> model, int no, ManagementVO vo) throws Exception{
		List<ManageDetailVO> list = null;
		vo = mService.managementSelect(no);
		list = mService.manageDetail(no);
		model.put("vo", vo);
		model.put("list", list);
		return new ModelAndView("excelView", "model", model);
	}
	
	/**
	 * 엑셀양식 다운로드
	 * @author	: 김대오
	 * @date	: 2018. 1. 3.
	 * @param req
	 * @param session
	 * @return
	 */
	@RequestMapping("/fleDownload")
	public ModelAndView fileDownload(HttpServletRequest req, HttpSession session) throws Exception{
		String path = session.getServletContext().getRealPath("file");
		File downFile = new File(path + "\\" + "sample.xls");
		return new ModelAndView("download", "downloadFile", downFile);
	}
	
	/**
	 * 엘셀파일 받아서 파일안의 데이터를 데이터베이스에 저장하는 함수
	 * @author	: 김대오
	 * @date	: 2018. 1. 5.
	 * @param vo
	 * @return
	 */
	@RequestMapping("/excelImport")
	public String excelImport(ManagementVO vo) throws Exception{
		mService.excelInsert(vo);
		return "redirect:list.do";
	}
	
	/**
	 * 상세정보 업데이트 프로세서
	 * @author	: 김대오
	 * @date	: 2018. 1. 5.
	 * @param vo
	 * @return
	 */
	@RequestMapping("/detailUpdate")
	public String updateProc(ManageDetailVO vo) throws Exception{
		int no = vo.getM_no(); // 게시글번호
		ArrayList<ManageDetailVO> list = vo.getDetailList();
		for (int i = 0; i < list.size(); i++) {
			ManageDetailVO dVO = list.get(i);
			dVO.setM_no(no);
 			if(dVO.getS_no() == 0) { // 새로 추가된 행 insert
				mService.manageDetailInsert(dVO);
			} else { // 기존에 있던 행 update
				mService.manageDetailUpdate(dVO);
			}
		}
		return "redirect:detail.do?m_no="+no;
	}
	
	/**
	 * 상세정보 삭제
	 * @author	: 김대오
	 * @date	: 2018. 1. 9.
	 * @return
	 */
	@RequestMapping("/detailDelete")
	public String detailDelete(ManageDetailVO vo) throws Exception{
		int no = vo.getM_no(); // 게시물 번호
		ArrayList<ManageDetailVO> list = vo.getDetailList();
		for (int i = 0; i < list.size(); i++) {
			ManageDetailVO dVO = list.get(i);
			dVO.setM_no(no);
			if(dVO.getS_no() > 0) { // 기존 데이터 삭제
				mService.manageDetailDelete(dVO);
			}
		}
		return "redirect:detail.do?m_no="+no;
	}
	
}
