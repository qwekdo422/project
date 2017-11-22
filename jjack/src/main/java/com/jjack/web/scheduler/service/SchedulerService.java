package com.jjack.web.scheduler.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjack.web.common.vo.GuestApplyVO;
import com.jjack.web.common.vo.SchedulerVO;
import com.jjack.web.scheduler.dao.SchedulerDAO;
import com.jjack.web.util.FileUtil;

/**
 * 행사일정관리 서비스
 * @author : daeo
 * @since : 2017. 11. 16.	
 */
@Service
public class SchedulerService {
	
	@Autowired private SchedulerDAO scDAO;
	
	/**
	 * 행사일정 조회
	 * @author : daeo
	 * @since : 2017. 11. 16.
	 * @param : 
	 * @return : JSONArray	/	List<SchedulerVO> 를 JSON형태로 변환
	 */
	@SuppressWarnings("unchecked")
	public JSONArray getSchedule() {
		List<SchedulerVO> list = scDAO.selectSchedule();
		JSONArray jArr = new JSONArray();
		for (int i = 0; i < list.size(); i++) {
			JSONObject jObj = new JSONObject();
			SchedulerVO schedule = list.get(i);
			jObj.put("start", schedule.getEventdate());
			jObj.put("end", schedule.getEventend());
			jObj.put("title", schedule.getTitle());
			jObj.put("gisoo", schedule.getGisoo());
			jObj.put("loc", schedule.getLoc());
			jObj.put("age", schedule.getAge());
			jObj.put("contents", schedule.getContents());
			jArr.add(jObj);
		}
		return jArr;
	}
	
	/**
	 * 일정등록
	 * @author : daeo
	 * @since : 2017. 11. 16.
	 * @param : SchedulerVO
	 * @return : void
	 */
	public void writeSchedule(SchedulerVO vo) {
		scDAO.insertSchedule(vo);
	}

	/**
	 * 일정수정
	 * @author : daeo
	 * @since : 2017. 11. 17.
	 * @param : SchedulerVO
	 * @return : void
	 */
	public void modifySchedule(SchedulerVO vo) {
		scDAO.updateSchedule(vo);
	}
	
	/**
	 * 일정삭제
	 * @author : daeo
	 * @since : 2017. 11. 20.
	 * @param :	eventdate	/	이벤트 시작일 
	 * @return : void
	 */
	public void deleteSchedule(String eventdate) {
		scDAO.deleteSchdule(eventdate);
	}
	
	/**
	 * 기수 체크
	 * @author : daeo
	 * @since : 2017. 11. 17.
	 * @param : gisoo
	 * @return : int
	 */
	public int gisooCheck(int gisoo) {
		return scDAO.selectGisoo(gisoo);
	}
	
	/**
	 * 입소신청
	 * @author : daeo
	 * @since : 2017. 11. 20.
	 * @param : SchedulerVO, session (이미지 저장경로을 위한 세션)
	 * @param : imageUpload(파일)
	 * @return : void
	 */
	public void ghApply(GuestApplyVO vo, HttpSession session) {
		//	사진업로드
		GuestApplyVO avo = imgUpload(vo, session);
		scDAO.insertApply(avo);
	}
	
	/**
	 * 사진업로드 처리 및 회원번호 얻기 처리 함수
	 * @author : daeo
	 * @since : 2017. 11. 22.
	 * @param : GuestApplyVO(입소신청서 정보), session
	 * @return : void
	 */
	public GuestApplyVO imgUpload(GuestApplyVO vo, HttpSession session) {
		//	파일저장 경로
		String path = session.getServletContext().getRealPath("file");
		//	사진원래 이름 추출
		String fileName = vo.getImageUpload().getOriginalFilename();
		//	사진을 서버에 저장하고 사진의 저장한 이름을 얻어온다.
		String saveName = FileUtil.upload(vo.getImageUpload(), fileName, path);
		//	사진 저장이름 저장
		vo.setPic(saveName);
		//	회원번호저장
		vo.setmNo((Integer)session.getAttribute("MNO"));
		return vo;
	}
	
	/**
	 * 입소신청서 정보 조회
	 * @author : daeo
	 * @since : 2017. 11. 21.
	 * @param : eventdate(이벤트 시작일), session(회원번호를 얻을 세션)
	 * @return : GuestApplyVO
	 */
	public GuestApplyVO getApplyInfo(String eventdate, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("eventdate", eventdate);
		map.put("mNo", (Integer) session.getAttribute("MNO"));
		return scDAO.selectApplyInfo(map);
	}
	
	/**
	 * 입소신청서 정보 수정
	 * @author : daeo
	 * @since : 2017. 11. 22.
	 * @param : GuestApplyVO(수정할 정보), session
	 * @return : void
	 */
	public void applyModify(GuestApplyVO vo, HttpSession session) {
		//	입소신청서 수정시 사진을 변경했을 때
		if(!vo.getImageUpload().isEmpty()) {
			//	사진업로드
			vo = imgUpload(vo, session);
		}
		scDAO.updateApply(vo);
	}
	
	/**
	 * 입소취소
	 * @author : daeo
	 * @since : 2017. 11. 22.
	 * @param : aNo	/ 입소신청 번호
	 * @return : void
	 */
	public void condModify(int aNo) {
		scDAO.updateCond(aNo);
	}

	
}
