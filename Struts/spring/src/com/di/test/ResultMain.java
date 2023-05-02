package com.di.test;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class ResultMain {

	public static void main(String[] args) {
		
		
		// XML 파일을 객체화 하기
		String path = "com/di/test/applicationContext.xml"; // 단순 경로가 들어감 -문자를 path 넣어주고
		
		//위의 경로를 찾아가간다. res에 xml 내용이 들어감
		Resource res = new ClassPathResource(path); //xml의 실제 내용이 들어감
		
		
		//객체화 - 위의 내용들을 실행시켜서 객체화 완료 (TestService가 완성된다.)
		BeanFactory factory = new XmlBeanFactory(res); // 여기까지 3가지 작업을 해서 객체화 완료
		
		//메모리할당된 객체 불러오기 - (객체생성되면 메모리 할당된다)
		TestService ob = (TestService)factory.getBean("testService"); //팩토리가 객체화시켰으니 다운캐스팅
		System.out.println(ob.getValue());
		
		//스프링은 의존성을 줄이기 위해서 중간에 매개체(TestService)를 달아서 TestService를 가지고 간접적 접근을 하게 됨
		
		
		/*//TestImpl1 ob1 = new TestImpl1();//기본생성자 객체생성
		Test ob1 = new TestImpl1();
		System.out.println(ob1.result());
		
		TestImpl2 ob2 = new TestImpl2();
		System.out.println(ob2.result());*/
//---------------------------------------------------	
		//위에를 아래로 바꿀 수 있다.
		/*Test ob;
		
		ob = new TestImpl1();
		System.out.println(ob.result());
		
		ob = new TestImpl2();
		System.out.println(ob.result());
		여기까진 java 방법 */
		
		
		//스프링의 객체로 만들려면 applicationContext.xml이 필요하다
		//다이렉트로 접근하지 않고 중간에 완충장치가 서비스라고 얘기한다.

	}

}
