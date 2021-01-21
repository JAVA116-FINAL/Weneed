package com.it.wanted.commemlist.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wanted.comimginfo.model.ComImgInfoDAO;
import com.it.wanted.commeminfo.model.ComMemInfoDAO;

@Service
public class ComMemListServiceImpl implements ComMemListService{
	@Autowired ComMemListDAO comMemListDao;
	@Autowired ComMemInfoDAO comMemInfoDao;
	@Autowired ComImgInfoDAO comImgInfoDao;
	
	@Override
	public int checkComReged(String comMemId) {
		//여기서 멤버아이디로 번호 가져와서 번호로 다시 컴코드 불러와봐 
		int memNo=comMemInfoDao.selectMemNo(comMemId);
		int cnt=comMemListDao.checkComReged(memNo); //멤노에 해당하는 컴코드 개수 확인.. 승인된!!! 기업정보 있는지 없는지 

		int result;
		if(cnt>0) { //등록돼 있다
			String comCode=comMemListDao.selectComCode(memNo); //컴코드 가져와서
			int imgcnt=comImgInfoDao.selectRegedImgCnt(comCode); //승인된 이미지 개수를 확인한다
			if(imgcnt>=2) { //승인된 이미지가 2개 이상이면 등록완료
				result=ComMemListService.REGED_COMPANY;
			}else { //승인된 이미지가 2개 미만이면 이미지 미등록
				result=ComMemListService.IMG_NOT_REGED;
			}
		}else { //등록 안돼있다
			result=ComMemListService.INFO_NOT_REGED;
		}
		return result;
	}
	
}
