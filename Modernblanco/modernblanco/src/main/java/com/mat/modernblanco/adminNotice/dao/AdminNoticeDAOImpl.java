// 2022.01.10 ������

package com.mat.modernblanco.adminNotice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mat.modernblanco.notice.vo.NoticeVO;

@Repository("adminNoticeDAO")
public class AdminNoticeDAOImpl implements AdminNoticeDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// �ɼǿ� ���� notice select DAO
	@Override
	public List<NoticeVO> noticeListToOption( Map<String, String> option) throws DataAccessException {
		List<NoticeVO> noticeList = sqlSession.selectList("mapper.adminNotice.noticeListToOption", option);

		return noticeList;
	}
	
	// notice ���� DAO
	@Override
	public int deleteNotice(String notice_id) throws DataAccessException {
		int result=sqlSession.delete("mapper.adminNotice.noticeDelete", notice_id);
		return result;
	}
	
	// notice ��� DAO
	@Override
	public int addNotice(NoticeVO noticeVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.adminNotice.addNotice", noticeVO);
		return result;
	}
	
	// notice ���� DAO
	@Override
	public int updateNotice(NoticeVO noticeVO) throws DataAccessException {
		int result = sqlSession.update("mapper.adminNotice.updateNotice", noticeVO);
		return result;
	}
}
