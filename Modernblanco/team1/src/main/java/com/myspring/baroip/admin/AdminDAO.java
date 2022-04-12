package com.myspring.baroip.admin;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("adminDAO")
public class AdminDAO{
	@Autowired
	private SqlSession sqlSession;

	// 옵션에 따른 CS select DAO
	public Map<String, Object> mainState() throws DataAccessException {
		
		Map<String, Object> mainInfo = sqlSession.selectOne("mapper.admin.main");

		return mainInfo;
	}

}
