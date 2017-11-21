package com.jjack.web.mating.service;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jjack.web.common.vo.MatingVO;
import com.jjack.web.mating.dao.MatingDAO;

@Service
public class MatingService {
	@Autowired
	public MatingDAO md;
	
	public List getLoves(MatingVO mvo) {
		return md.getLoves(mvo);
	}
	
	
	
	
	
	
	
	
	
}
