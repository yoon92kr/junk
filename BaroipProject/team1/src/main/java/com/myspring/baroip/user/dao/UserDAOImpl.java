package com.myspring.baroip.user.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.baroip.user.vo.UserVO;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public UserVO login(Map loginMap) throws DataAccessException{
		UserVO user=(UserVO)sqlSession.selectOne("mapper.user.login",loginMap);
	   return user;
	}

}
