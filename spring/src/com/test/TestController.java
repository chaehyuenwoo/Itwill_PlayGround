package com.test;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

// mvc의 controller 이다. 
// AbstractController  를 상속받고 메소드를 추가함 
// handleRequestInternal : execute처럼 알아서 실행됨 
// ModelAndView : mvc에서 c는분배기 이 주소를 가진것은 일로가~
//  view는 jsp파일  medel은 데이터  modelAndView 은 view + model 이다.

public class TestController extends AbstractController { //분배기(Controller)

	
	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		int hour = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);//HOUR_OF_DAY:시간
		String msg = "";
		
		if(hour>=6&&hour<=8) {
			msg = "아침입니다";
		} else if(hour>=8&&hour<=13) {
			msg = "지각입니다";
		} else if(hour>=13&&hour<=14) {
			msg = "점심시간입니다";
		} else if(hour>=14&&hour<=18) {
			msg = "오후입니다";
		} else {
			msg = "저녁 입니다";
		}
		
		request.setAttribute("msg", msg); // msg를 누구한테 전달?
		
		// 분배기 역할을 여기서 해버림
		// test/view로 가 ~ view.jsp (dispatcher.servlet에서 suffix value=".jsp"를 써놔서 안써도됨)
		return new ModelAndView("test/view");
	}
	
	
	
}