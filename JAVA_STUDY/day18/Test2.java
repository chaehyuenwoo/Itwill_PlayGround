package com.day18;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

public class Test2 {

	public static void main(String[] args) throws Exception {
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("클래스명[java.lang.String]?");
		String str = br.readLine();
		
		Class cls = Class.forName(str);
		
		//String의 생성자 정보
		System.out.println("생성자 정보...");
		Constructor<?>[] c = cls.getConstructors();
		for(int i=0; i<c.length; i++) {
			System.out.println(c[i]);
		}
		
		System.out.println("필드 정보...");
		Field[] f = cls.getFields();
		for(int i=0; i<f.length; i++) {
			System.out.println(f[i]);
		}
		
		System.out.println("메서드 정보...");
		Method [] m = cls.getMethods();
		for(int i=0; i<m.length; i++) {
			System.out.println(m[i]);
		}
		
		
	}

}