package com.jjack.web.scheduler.dao;

import java.util.List;

import com.jjack.web.common.vo.SchedulerVO;

public interface SchedulerDAO {
	public List<SchedulerVO> selectSchedule();
	public void insertSchedule(SchedulerVO vo);
}
