package com.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractCommandController;

//애는 데이터를 처리해주는 컨트롤러 - 여기로 들어올때 DTO를 가져오는데 DTO를 담을 그릇이 필요한데 그게 ListFormController이다.
//그리고 자동으로 command으로 들어간다.
public class ListController extends AbstractCommandController {
	
	
	public ListController() {
		setCommandClass(ListCommand.class);
		setCommandName("listCommand");
		//ListCommand listCommand = new listCommand(); 와 같은 의미
		
	}
	
	
	//위에서 객체생성할걸 command로 받아준다.
	@Override
	protected ModelAndView handle(HttpServletRequest request, 
			HttpServletResponse response, Object command,  //들어온데이터가 command로 들어간다.
			BindException errors)throws Exception {
		
		ListCommand vo = (ListCommand)command;//command는 Object니까 다운캐스팅
		
		String message = "이름: " + vo.getUserName();
		message += ", 아이디: " + vo.getUserId();
		
		//데이터넘김
		request.setAttribute("message", message);
		
		/*모델엔드뷰가 디스페치한테 test/view라는 주문서,,,? 들고
				가서 요청을 하면*/
		
		return new ModelAndView("test/write_ok"); //여기서 객체생성하는 이유는 메모리에 올려야 하기 때문이다.
		/*dispa 1  controller 2 
		write 3  dsipa 4  listconroller 5 위에서 객체생성 6
		7 command로 너어옴 8 wrtie_ok로 넘어옴*/
	}

}