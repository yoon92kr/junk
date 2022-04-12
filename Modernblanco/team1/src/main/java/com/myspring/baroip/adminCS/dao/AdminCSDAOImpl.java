// 2022.02.10 윤상현

package com.myspring.baroip.adminCS.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.baroip.notice.vo.NoticeVO;

@Repository("adminCSDAO")
public class AdminCSDAOImpl implements AdminCSDAO {
	@Autowired
	private SqlSession sqlSession;

	// 옵션에 따른 CS select DAO
	@Override
	public List<Map<String, Object>> CSListToOption(Map<String, String> option) throws DataAccessException {
		
		List<Map<String, Object>> noticeList = sqlSession.selectList("mapper.adminCS.CSList", option);

		return noticeList;
	}

	// CS 삭제 DAO
	@Override
	public int deleteCS(String notice_id) throws DataAccessException {
		int result = sqlSession.delete("mapper.adminCS.deleteCS", notice_id);
		return result;
	}

	// CS 상세정보 DAO
	@Override
	public Map<String, Object> CSDetail(Map<String, String> option) throws DataAccessException {

		Map<String, Object> result = sqlSession.selectOne("mapper.adminCS.CSDetail", option);
		return result;
	}

	// cs 답글 등록 DAO
	@Override
	public int addCS(NoticeVO noticeVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.adminCS.addCS", noticeVO);
		return result;
	}
}
