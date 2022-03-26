package com.test2;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.validation.Errors;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractWizardFormController;

//컨트롤러 역할을 하기 위해  AbstractWizardFormController상속
public class MemController extends AbstractWizardFormController {
	
	//MemberCommand 객체 생성
	public MemController() {
		setCommandClass(MemCommand.class);
		setCommandName("info"); // ${info. ~ }
		//MemCommand info = new MemCommand();
	}

	@Override //각 페이지(mem1,2,3)에서 submit한 경우 여기와서 postProcessPage메서드 실행
	protected void postProcessPage(HttpServletRequest request,
			Object command, Errors errors, int page)
			throws Exception {
		
		//각 페이지에서 submit한 경우 
		MemCommand mem = (MemCommand)command;
		
		//mem1,2,3 어떤 페이지에서 왔는지 알아야함
		if(page==0) {
			
			if(mem.getSsn().equals("123")) { //mem.getSsn()는 사용자가 입력한 주민번호
				
				String str = mem.getName() + "님 이미 가입 되어있습니다.";
				
				//이미 가입되어있으면 men1.jsp에서 멈춰야한다. -> 다음페이지로 못넘어감
				errors.rejectValue("message", str); //에러 코드를 저장
				
				//에러 코드를 담아서 setMessage에 str을 담는다.
				mem.setMessage(str); //mem에 다시 넣는다
			}
			
		}else if(page==1) {
			
		}
		
		
	}

	@Override
	protected ModelAndView processCancel(HttpServletRequest request, 
			HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		
		//회원가입을 취소한 경우
		
		
		return new ModelAndView("test2/mem_cancel", errors.getModel()); //넘어갈때 errors의 getModel()를 가져간다.
	}

	@Override
	protected ModelAndView processFinish(HttpServletRequest request, 
			HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		
		// 데이터 입력이 정상적일 떄
		//회원가입 처리 - (DB가 있으면 DB에 insert한다)
		
		return new ModelAndView("test2/mem_ok");
	}

	@Override //referenceData는 미리 준비하는 곳
	protected Map<String, List<String>> referenceData(HttpServletRequest request, 
			Object command, Errors errors, int page) throws Exception {
		
		
		//여기서도 page가 넘어온다,
		if(page==1) {
			
			List<String> types = new ArrayList<>();
			types.add("일반회원");
			types.add("기업회원");
			types.add("특별회원");
			
			Map<String, List<String>> map = new HashMap<String, List<String>>();
			map.put("types", types);
			
			return map;
			
		}
		
		return null; //1페이지가 아닌 경우는 null반환 - (일단 지금 2,3페이지를 안쓸거기때문)
		//다 만들었으면 움직이게하기위해 dispatcher-servlet 작성
	}
	
	
	
	
}
