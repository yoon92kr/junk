// 2021.12.24 임석희

package com.myspring.baroip.notice.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.notice.vo.NoticeVO;

public interface NoticeDAO {
	
//	공지사항 리스트페이지
	public List<NoticeVO> noticeList() throws DataAccessException;
	
//	공지사항 상세
	public NoticeVO noticeDetail(String notice_id) throws DataAccessException;

//	상품후기
	public List<Map<String, Object>> selectCommentList(String product_id) throws DataAccessException;
	
//	상품 문의 리스트
	public List<NoticeVO> selectPQAList(String product_id) throws DataAccessException;
	
//	상품 문의 작성 페이지
	public void insertPQA(NoticeVO noticeVO) throws DataAccessException;
	
//	1:1 문의 리스트
	public List<Map<String, Object>> UQAList() throws DataAccessException;

}
