package com.jjack.web.mating.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jjack.web.mating.service.MatingService;
/**
 * 
 * @author 최정규
 * @since : 2017. 11. 10.	
 */
@Controller
public class MatingController {
	public MatingService ms;
	
	@RequestMapping("/mating/forLunch")
	public void forLunch() {

	}
	@RequestMapping("/mating/Arrows")
	public void Arrows() {
		
	}
	@RequestMapping("/myLove")
	public void myLove() {
		
	}
	@RequestMapping("/Loved")
	public void Loved() {
	}
}
