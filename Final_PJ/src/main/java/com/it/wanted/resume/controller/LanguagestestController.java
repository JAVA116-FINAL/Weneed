package com.it.wanted.resume.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.wanted.languagestest.model.LanguagestestService;
import com.it.wanted.languagestest.model.LanguagestestVO;

@Controller
@RequestMapping("/languagestest")
public class LanguagestestController {
   private static final Logger logger=LoggerFactory.getLogger(LanguagestestController.class);
   @Autowired
   private LanguagestestService languagestestService;
   
   @ResponseBody
   @RequestMapping("/languagestestRegister.do")
   public LanguagestestVO languagestestRegister(@RequestParam (defaultValue = "0") int langNo) {
      //1
      logger.info("어학시험점수, 파라미터 langNo={}",langNo);
      //2
      LanguagestestVO ltVo=new LanguagestestVO();
      ltVo.setLangNo(langNo);
      int cnt=languagestestService.insertLangtest(ltVo);
      if(cnt>0) {
         ltVo=languagestestService.selectLangtest(langNo);
      }
      //3
      //4
      return ltVo;
   }
   
   @ResponseBody
   @RequestMapping("/languagestestDelete.do")
   public int languagetestDelete(@RequestParam(defaultValue = "0")int langtestNo) {
	   //1
	   logger.info("어학점수 삭제하기 파라미터 langtestNo={}",langtestNo);
	   //2
	   int cnt=languagestestService.deleteLangtest(langtestNo);
	   //3
	   //4
	   return cnt;
   }
   
}