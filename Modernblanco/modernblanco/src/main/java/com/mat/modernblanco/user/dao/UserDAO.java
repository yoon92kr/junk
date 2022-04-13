package com.mat.modernblanco.user.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mat.modernblanco.user.vo.UserVO;

public interface UserDAO {
	public UserVO login(Map loginMap) throws DataAccessException;
	
	public String insertNewUser(UserVO userVO) throws DataAccessException;
	
	public String selectIdOverlap(String id) throws DataAccessException;
	
//	��ȸ�� �ֹ��� ���̵� ����
	public String insertGuestId(UserVO userVO) throws DataAccessException;

//	naver�α��� ���̵� ����
	public void addNaverUser(UserVO userVO) throws DataAccessException;
	
//	���̵� ã��
	public String userIdFind(UserVO userVO) throws DataAccessException;
	
//	��й�ȣ ã�� �� ȸ�� ���� ��ġ Ȯ��
	public UserVO inputUserCheck(UserVO userVO) throws DataAccessException;
	
//	��й�ȣ ã�� �� ��й�ȣ ����
	public void updateFindUserPwd(UserVO userVO) throws DataAccessException;
	
	public void updateLastDate(String user_id) throws DataAccessException;
	
}
