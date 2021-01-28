package com.it.wanted.resume.controller;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.wanted.career.model.CareerService;
import com.it.wanted.career.model.CareerVO;

@Controller
@RequestMapping("/career")
public class CareerController {
	private static final Logger logger=LoggerFactory.getLogger(CareerController.class);
	@Autowired
	private CareerService careerService;
	
	  @ResponseBody  
	  @RequestMapping(value = "/careerRegister.do",method = RequestMethod.GET) 
	  public CareerVO insertCareer(@RequestParam (defaultValue = "0")int resumeNo) { 
		  //1
		  logger.info("파라미터 resumeNo={}",resumeNo);
		  
		  //2
		  CareerVO careerVo=new CareerVO();
		  careerVo.setResumeNo(resumeNo);
		  
		  int cnt=careerService.insertCareer(careerVo);
		  logger.info("career insert결과 cnt={}",cnt);
		  if(cnt>0) {
			careerVo=careerService.selectCareer(resumeNo);
			logger.info("career select 결과 careerVo={}",careerVo);
		  }
		  //3 
		  //4
		  return careerVo;

	  }
	  
	  @ResponseBody
	  @RequestMapping("/careerDelete.do")
	  public int delete(@RequestParam (defaultValue = "0")int careerNo){
		  //1
		  logger.info("커리어 삭제 파라미터 careerNo={}",careerNo);
		  //2
		  int cnt=careerService.deleteCareer(careerNo);
		  //3
		  //4
		  return cnt;
	  }
	  

	 	 

}
