package com.day18;

// Class Ŭ����
// Ư�� Ŭ������ �������̽��� ������ �˻��� ���ִ� �޼��带 ������ �ִ�.

class Test {
	
	public void write() {
		
		System.out.println("�׽�Ʈ...");
		
	}
}


public class Test1 {

	public static void main(String[] args) throws Exception {
		
		// Ư�� �޼��� ������ �ҷ���.��Ű�� �̸����� �� �������
		// ���� ������ Ŭ������ ���� �� �ֱ⿡ ����ó�� ������� (throws Exception)!!!
		Class c = Class.forName("com.day18.Test");
		
		
		// o�� ������ Ÿ���� �𸣱� ������ �ϴ� Object�� �޾Ƽ� ��ƹ�����.
		Object o = c.newInstance(); // ��ü ����
		
		Test t = (Test)o;
		
		t.write();

	}
}