package com.anno;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("anno.testController")
public class TestController {
	
	
	//MainController �� @Request�� 2���ִµ� ���⼱ ���ļ�����.
	//����ڰ� /demo/write.action�� ġ�� TestController�޼��尡 ����Ǵµ� Get����̸� write()�޼��� ����
	@RequestMapping(value="/demo/write.action",method= {RequestMethod.GET}) //�迭�� �Ѿ�°ű⶧���� { } ���ش�. /������ ���� ����
	public String write() throws Exception {
		
		return "anno/create";
		
	}
	
	@RequestMapping(value="/demo/write.action",method= {RequestMethod.POST})
	//�� �ּҰ����� post����϶� �� �޼��� write_ok() �� ����
	public String write_ok(TestCommand command, HttpServletRequest request) { //�������� TestCommand��ü�� �����ϰ� command�� �����͸� �־ �����ش�.(�ڵ�)
						
		//�����Ͱ� TestCommand�� ��ܿ´�.
		String message = "���̵�: " + command.getUserId();
		message += ", �̸�: " + command.getUserName();
		
		//�������� request�� �Ἥ �Ѱ����� ���⼭�� ���������� �޶�� �Ѵ�.(�Ű����� ����)
		request.setAttribute("message", message);
		
		
		return "anno/result";
	}
	
	
	
	
	//���⼱ ���� 2������ ���ļ� ����Ѵ�. save.jsp -> result.jsp
	@RequestMapping(value="/demo/save.action",
			method= {RequestMethod.GET, RequestMethod.POST})
	public String save(TestCommand command, HttpServletRequest request) throws Exception {
		
		//get������� ������
		if(command==null||command.getMode()==null||command.getMode().equals("")) {
			
			return "anno/save";
		}
		
		String message = "�̸�: " + command.getUserName();
		message += ", ���̵�: " + command.getUserId();
		
		request.setAttribute("message", message);
		
		return "anno/result";
		
	}
	
	
	//���⼱ ���� 2������ ���ļ� ����Ѵ�. insert.jsp -> result.jsp
	//�������� command�� �ѹ��� �޾Ҵµ� �̹����� �ϳ��ϳ� �޾Ƽ� ����Ѵ�. - �̷��� �Ⱦ����� ���÷� �ѹ� �غ���.
	@RequestMapping(value="/demo/insert.action", //method�� �������ָ� Get�̵� Post��
			method= {RequestMethod.GET, RequestMethod.POST})
	public String insert(String userId, String userName, String mode, HttpServletRequest request) throws Exception {
			
		//get������� ������
		if(mode==null||mode.equals("")) {
				
			return "anno/insert";
		}
			
		String message = "�̸�: " + userName;
		message += ", ���̵�: " + userId;
			
		request.setAttribute("message", message);
			
		return "anno/result";
			
	}
	
	

}