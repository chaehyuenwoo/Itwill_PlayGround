package com.test1;
//Authenticator인터페이스를 구현한 클래스
public class LoginAuthenticatorImpl implements Authenticator {

	@Override
	public void authen(String userId, String userPwd)//애를 호출했을 때
			throws UserException {
		
		if(!userId.equals("suzi") || !userPwd.equals("123")) {
			//suzi, 123이 아니면 예외를 발생시킨다.
			throw new UserException("invalid id: " + userId);
		}
		
	}

}