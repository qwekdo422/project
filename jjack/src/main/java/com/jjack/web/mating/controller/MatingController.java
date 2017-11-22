package com.jjack.web.mating.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import com.jjack.web.common.vo.MatingVO;
import com.jjack.web.mating.service.MatingService;
import java.util.*;
import javax.servlet.http.HttpSession;
/**
 * 
 * @author 최정규
 * @since : 2017. 11. 10.	
 */
@Controller
@RequestMapping("/mating")
public class MatingController {
	@Autowired
	public MatingService ms;
	
	@RequestMapping("/forLunch")
	public void forLunch() {
		
	}
	@RequestMapping("/Arrows")
	public void Arrows() {
		// choice가 다 채워졌는가
		
		
		
		
		// 뷰에 필요한 것 : 내 gno, choice, 전체 사람수
		
		
		
		
		
		
		
		
		
		
	}
	@RequestMapping("/myLove")
	public ModelAndView myLove(HttpSession session) {
		int mno = (Integer)session.getAttribute("MNO");
		MatingVO mvo = ms.getInfo(mno);
		int myGno = mvo.getGno();
		// 이미 선택했으면 loved로 리다이렉트
		ModelAndView mv = new ModelAndView();
		if(mvo.getMyLove() != -1) {
			RedirectView rv = new RedirectView("./Loved.do");
			rv.addStaticAttribute("redir", "re");
			rv.addStaticAttribute("myGno", myGno);
			rv.addStaticAttribute("myLove", mvo.getMyLove());
			mv.setView(rv);
			return mv;
		}
		
		List<MatingVO> myLoves = ms.getLoves(mvo);
		mv.addObject("myLoves", myLoves);
		mv.addObject("myGno", myGno);
		return mv;
	}
	
	@RequestMapping("/Loved")
	public ModelAndView Loved(int myGno, int myLove, @RequestParam (value="redir", defaultValue="no") String redir) {
		if(redir.equals("no")) {	// 선택하고 온 경우
			ms.chooseOne(myGno, myLove);
		}
		MatingVO loveVO = ms.whoIsMyChoice(myGno);
		ModelAndView mv = new ModelAndView();
		mv.addObject("myLove", loveVO);
		return mv;
	}
}
