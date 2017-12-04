package com.jjack.web.datecourse.dao;
import java.util.*;
import com.jjack.web.common.vo.DateCourseVO;


public interface DateCourseDAO {

	//남자와 여자 정보 가져오기
	public String getGuestInfo(int mno);
}
