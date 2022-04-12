// 2021.12.24 임석희

package com.myspring.baroip.notice.service;

import java.util.List;
import java.util.Map;

import com.myspring.baroip.notice.vo.NoticeVO;

public interface NoticeService {
	
//	공지사항 리스트페이지
	public List<NoticeVO> noticeList() throws Exception;
	
//	공지사항 상세
	public NoticeVO noticeDetail(String notice_id) throws Exception;
	
//	상품후기
	public List<Map<String, Object>> productComment(String product_id) throws Exception;
	
//	상품 문의
	public Map<String, Object> productQuestion(String product_id) throws Exception;
	
//	상품 문의 작성 페이지
	public void addPQA(NoticeVO noticeVO) throws Exception;
	
	//	1:1문의 리스트
	public List<Map<String, Object>> UQAList() throws Exception;
}
