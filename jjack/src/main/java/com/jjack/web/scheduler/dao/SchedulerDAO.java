package com.jjack.web.scheduler.dao;

import java.util.List;

import com.jjack.web.common.vo.SchedulerVO;
/**
 * 행사일정 관리 인터페이스
 * 자동맵핑을 시켜줬기 때문에 함수안에 정의할 내용이 없으므로 재정의하지 않는다.
 * @author : daeo
 * @since : 2017. 11. 17.
 */
public interface SchedulerDAO {
	//	행사 일정 조회 (관리자, 사용자)
	public List<SchedulerVO> selectSchedule();
	//	행사 등록 (관리자)
	public void insertSchedule(SchedulerVO vo);
	//	행사 수정 (관리자)
	public void updateSchedule(SchedulerVO vo);
	//	행사 삭제 (관리자)
	public void deleteSchdule(String eventdate);
	//	기수 조회 (관리자)
	public int selectGisoo(int gisoo);
	//	입소신청(사용자)
	public void insertApply(SchedulerVO vo);
}
