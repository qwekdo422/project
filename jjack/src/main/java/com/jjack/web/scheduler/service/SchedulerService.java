package com.jjack.web.scheduler.service;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjack.web.common.vo.SchedulerVO;
import com.jjack.web.scheduler.dao.SchedulerDAO;

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
	 * 기수 체크
	 * @author : daeo
	 * @since : 2017. 11. 17.
	 * @param : 
	 * @return : int
	 */
	public int gisooCheck(int gisoo) {
		return scDAO.selectGisoo(gisoo);
	}
}
