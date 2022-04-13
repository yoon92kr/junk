package com.mat.modernblanco.user.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mat.modernblanco.user.vo.UserVO;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public UserVO login(Map loginMap) throws DataAccessException {
		UserVO user=(UserVO)sqlSession.selectOne("mapper.user.login",loginMap);
	   return user;
	}
	
	@Override
	public String insertNewUser(UserVO userVO) throws DataAccessException {
		sqlSession.insert("mapper.user.insertNewUser",userVO);
		String user_name = userVO.getUser_name();
		return user_name;
	}
	
	@Override
	public String selectIdOverlap(String id) throws DataAccessException {
		String result = sqlSession.selectOne("mapper.user.selectIdOverlap",id);
		return result;
	}
	
//	naver�α��� ���̵� ����
	@Override
	public void addNaverUser(UserVO userVO) throws DataAccessException {
		sqlSession.insert("mapper.user.insertNaverUser", userVO);
	}
	
//	��ȸ�� �ֹ��� ���̵� ����
	@Override
	public String insertGuestId(UserVO userVO) throws DataAccessException {
		sqlSession.insert("mapper.user.guestUser", userVO);
		String result = userVO.getUser_id();
		return result;
	}
	
//	���̵� ã��
	@Override
	public String userIdFind(UserVO userVO) throws DataAccessException {
		String result = sqlSession.selectOne("mapper.user.selectUserIdFind", userVO);
		return result;
	}
	
//	��й�ȣ ã�� �� ȸ�� ���� ��ġ Ȯ��
	@Override
	public UserVO inputUserCheck(UserVO userVO) throws DataAccessException {
		UserVO result = sqlSession.selectOne("mapper.user.selectUserPwdFind", userVO);
		return result;
	}
	
//	��й�ȣ ã�� �� ��й�ȣ ����UserVO
	@Override
	public void updateFindUserPwd(UserVO userVO) throws DataAccessException {
		sqlSession.update("mapper.user.updateUserPwd", userVO);
	}
	
	@Override
	public void updateLastDate(String user_id) throws DataAccessException {
		sqlSession.update("mapper.user.updateLastDate", user_id);
	}

}
