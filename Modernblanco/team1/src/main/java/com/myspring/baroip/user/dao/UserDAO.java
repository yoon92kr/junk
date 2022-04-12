package com.myspring.baroip.user.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.user.vo.UserVO;

public interface UserDAO {
	public UserVO login(Map loginMap) throws DataAccessException;
	
	public String insertNewUser(UserVO userVO) throws DataAccessException;
	
	public String selectIdOverlap(String id) throws DataAccessException;
	
//	비회원 주문시 아이디 생성
	public String insertGuestId(UserVO userVO) throws DataAccessException;

//	naver로그인 아이디 생성
	public void addNaverUser(UserVO userVO) throws DataAccessException;
	
//	아이디 찾기
	public String userIdFind(UserVO userVO) throws DataAccessException;
	
//	비밀번호 찾기 전 회원 정보 일치 확인
	public UserVO inputUserCheck(UserVO userVO) throws DataAccessException;
	
//	비밀번호 찾기 후 비밀번호 변경
	public void updateFindUserPwd(UserVO userVO) throws DataAccessException;
	
	public void updateLastDate(String user_id) throws DataAccessException;
	
}
