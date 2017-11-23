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
	public ModelAndView forLunch(ModelAndView mv) {
		// 현재 날짜 확인
		String edate = ms.getEdate();
		// 여자 리스트 가져오기
		List<MatingVO> women = ms.WomenForLunch(edate);
		// 남자 리스트 가져오기
		List<MatingVO> men = ms.MenForLunch(edate);
		// 표시할 사다리 줄수 가져오기
		int ladder = ms.makeLadder(edate);
		
		// 뷰 호출
		mv.addObject("mList", men);
		mv.addObject("fList", women);
		mv.addObject("ladderSize", ladder);
		return mv;
	}
	
	@RequestMapping("/Arrows")
	public ModelAndView Arrows(ModelAndView mv) {
		// 현재 날짜 확인
		String edate = ms.getEdate();
		// 모든 사람이 짝을 선택했는지 확인
		MatingVO noVO = ms.getNumbers(edate);	// 근데 이러면 커플수가 0 나와. 커플수 필요하면 따로 빼자
		if(noVO.gettCount() - noVO.getcCount() == 0) {
			ms.coupling(edate);
		}
		
		// 입소자들 정보 가져오기
		List<MatingVO> men = ms.MenForArrows(edate);
		List<MatingVO> women = ms.WomenForArrows(edate);
		
		// 뷰 호출
		mv.addObject("numbers", noVO);
		mv.addObject("mList", men);
		mv.addObject("fList", women);
		return mv;
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
