package com.day18;

// Class 클래스
// 특정 클래스나 인터페이스의 정보를 검색할 수있는 메서드를 가지고 있다.

class Test {
	
	public void write() {
		
		System.out.println("테스트...");
		
	}
}


public class Test1 {

	public static void main(String[] args) throws Exception {
		
		// 특정 메서드 정보를 불러옴.패키지 이름까지 꼭 적어야함
		// 또한 지정한 클래스가 없을 수 있기에 예외처리 해줘야함 (throws Exception)!!!
		Class c = Class.forName("com.day18.Test");
		
		
		// o의 데이터 타입을 모르기 때문에 일단 Object로 받아서 담아버린다.
		Object o = c.newInstance(); // 객체 생성
		
		Test t = (Test)o;
		
		t.write();

	}
}