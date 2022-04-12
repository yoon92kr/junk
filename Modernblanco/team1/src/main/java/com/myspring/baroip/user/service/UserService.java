package com.myspring.baroip.user.service;

import java.util.Map;

import com.myspring.baroip.user.vo.UserVO;

public interface UserService {
	public UserVO login(Map loginMap) throws Exception;
	
	public String addUser(UserVO _userVO) throws Exception;
	
	public String userIdOverlap(String id) throws Exception;

//	비회원 주문시 아이디 생성
	public String guestJoin() throws Exception;
	
//	naver로그인 시 아이디 생성
	public void naverLogin(UserVO userVO) throws Exception;
	
//	핸드폰 인증
	public void userPhoneCheck(String mobile, int randomNumber);
	
//	아이디 찾기
	public String userIdFind(UserVO userVO) throws Exception;
	
//	비밀번호 찾기 전 회원 정보 일치 확인
	public UserVO inputUserCheck(UserVO userVO) throws Exception;
	
//	비밀번호 찾기 후 비밀번호 변경
	public void updateUserPwd(UserVO userVO) throws Exception;
	
	public void updateLastDate(String user_id) throws Exception;
}
