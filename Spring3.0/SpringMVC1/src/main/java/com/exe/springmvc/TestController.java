package com.exe.springmvc;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("test.controller")
public class TestController {
	
	/*@RequestMapping(value="/test/param.action", method = RequestMethod.GET)
	public String processGetReqest() {
		
		System.out.println("GET ��� Request");
		
		return "paramResult"; //paramResult.jsp
	}
	
	
	@RequestMapping(value="/test/param.action", method = RequestMethod.POST)
	public String processPostRequest() {
		
		System.out.println("POST ��� Request");
		
		return "paramResult";
	}
	*/
	
	//���� 2���� ��ġ��
	@RequestMapping(value="/test/param.action", 
			method = {RequestMethod.POST,RequestMethod.GET})
	public String processRequest(PersonDTO dto, String name, HttpServletRequest request) {
		
		System.out.println("GET/POST��� Request"); 
		
		System.out.println(name);
		System.out.println(request.getParameter("phone"));
		
		System.out.println(dto);
		System.out.println("dto.getName(): " + dto.getName());
		System.out.println("dto.getPhone(): " + dto.getPhone());
		System.out.println("dto.getEmail(): " + dto.getEmail());
		
		return "paramResult";
	}
	
	@RequestMapping(value="/test/mav.action", 
			method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView mavRequest(PersonDTO dto) {
		
		//ModelAndViewŬ������ ����ϸ� �ڵ����� ������ �����´�,
		//dto�� �޾ƿ� �����͸� ModelAndView ������� �Ѹ���.
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto",dto);
		mav.setViewName("paramResult");
			
		return mav;
	}
	
	@RequestMapping(value="/test/redirect.action", 
			method = {RequestMethod.GET,RequestMethod.POST})
	public String mavRedirectRequest() {
		
		
		//return "redirect:/";//home���� �����̷�Ʈ
		return "redirect:/hello.action";
	}
	
	
}