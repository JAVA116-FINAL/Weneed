package com.it.wanted.resume.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.wanted.achievement.model.AchievementService;
import com.it.wanted.achievement.model.AchievementVO;

@Controller
@RequestMapping("/achievement")
public class AchievementController {
	@Autowired
	private AchievementService achievementService;
	private static final Logger logger= LoggerFactory.getLogger(AchievementController.class);

	@ResponseBody
	@RequestMapping(value="/achievementRegister.do",method = RequestMethod.GET)
	public AchievementVO achRegister(@RequestParam(defaultValue = "0") int careerNo) {
		//1
		logger.info("archievement insert 파라미터 careerNo={}",careerNo);
		AchievementVO aVo= new AchievementVO();
		aVo.setCareerNo(careerNo);
		//2
		int cnt=achievementService.insertAch(aVo);
		logger.info("achievement insert결과 cnt={}", cnt);
		if(cnt>0) {
			aVo=achievementService.selectAch(careerNo);
		}
		//3
		//4
		return aVo;
	}
	@ResponseBody
	@RequestMapping("/achievementDelete.do")
	public int achDelete(@RequestParam (defaultValue = "0") int achNo) {
		//1
		logger.info("achievement delete 파라미터achNo={}", achNo);
		
		//2
		int cnt=achievementService.deleteAch(achNo);
		logger.info("성과 삭제 결과 cnt={}", cnt);
		//3
		//4
		return cnt;
	}
	
	
}
