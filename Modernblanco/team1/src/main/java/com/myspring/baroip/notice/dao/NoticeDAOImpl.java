// 2021.12.24 임석희

package com.myspring.baroip.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.baroip.notice.vo.NoticeVO;

@Repository("noticeDAO")
public class NoticeDAOImpl implements NoticeDAO {
	@Autowired
	private SqlSession sqlSession;
	
//	공지사항 리스트
	@Override
	public List<NoticeVO> noticeList() throws DataAccessException{
		List<NoticeVO> NTList = sqlSession.selectList("mapper.notice.noticeList");
		return NTList;
	}
	
//	공지사항 상세
	@Override
	public NoticeVO noticeDetail(String notice_id) throws DataAccessException {
		NoticeVO noticeVO = sqlSession.selectOne("mapper.notice.noticeDetail", notice_id);
		return noticeVO;
	}
	
//	상품후기 리스트
	@Override
	public List<Map<String, Object>> selectCommentList(String product_id) throws DataAccessException {
		List<Map<String, Object>> commentList = sqlSession.selectList("mapper.notice.selectProductComment", product_id);
		return commentList;
	}
	
//	상품 문의 리스트
	@Override
	public List<NoticeVO> selectPQAList(String product_id) throws DataAccessException {
		List<NoticeVO> PQAList = sqlSession.selectList("mapper.notice.selectProductQuestion", product_id);
		return PQAList;
	}
	
//	상품 문의 작성
	@Override
	public void insertPQA(NoticeVO noticeVO) throws DataAccessException {
		sqlSession.selectList("mapper.notice.insertPQA", noticeVO);
	}
	
	//	1:1 문의 리스트
	@Override
	public List<Map<String, Object>> UQAList() throws DataAccessException{
		List<Map<String, Object>> noticeList = sqlSession.selectList("mapper.notice.UQAList");
		return noticeList;
	}

}
