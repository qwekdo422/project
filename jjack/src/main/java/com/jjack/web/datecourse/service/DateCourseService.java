package com.jjack.web.datecourse.service;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jjack.web.common.vo.DateCourseVO;
import com.jjack.web.datecourse.dao.DateCourseDAO;

@Service
public class DateCourseService {
	@Autowired
	public DateCourseDAO dd;

	//게스트 남녀 정보 가져오기
	public String getGuestInfo(int mno){
		return dd.getGuestInfo(mno);
	}
}
