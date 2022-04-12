// 2022.01.24 윤상현

package com.myspring.baroip.myPage.service;

import java.util.List;
import java.util.Map;

import com.myspring.baroip.notice.vo.NoticeVO;
import com.myspring.baroip.user.vo.UserVO;

public interface MyPageService {

	// user_id 에 해당하는 cart의 전체 수량 select Service
	public int myPageCartCount(UserVO userVO) throws Exception;

	// user_id 에 해당하는 order의 배송완료 상품의 전체 수량 select Service
	public int myPageOrderCount(UserVO userVO) throws Exception;
	
	// 회원 탈퇴
	public String dropOut(String user_id) throws Exception;
	
	// 회원정보 수정 서비스
	public int updateMyInfo(UserVO userVO) throws Exception;

	// 조회 조건에 따른 주문 리스트 조회 서비스
	public List<Map<String, Object>> myOrder( Map<String, String> option) throws Exception;
	
	// 주문 상태 변경 서비스
	public void updateOrder(Map<String, String> option) throws Exception;
	
	// 반품 등록 서비스
	public String askRefund(NoticeVO noticeVO) throws Exception;
	
	// 주문 정보 호출 DAO
	public List<Map<String, Object>> orderDetail(String order_id) throws Exception;
	
//	문의 리스트
	public List<NoticeVO> questionList(String user_id) throws Exception;
	
//	문의 내역 페이지
	public Map<String, Object> questionDetail(String notice_id) throws Exception;
	
//	문의 삭제
	public int deleteQuestion(String notice_id) throws Exception;
	
//	문의 수정
	public String updateQuestion(NoticeVO noticeVO) throws Exception;
	
//	상품 후기 리스트
	public List<Map<String, Object>> commentList(String user_id) throws Exception;
	
//	상품 후기 작성
	public String addComment(NoticeVO noticeVO) throws Exception;
	
//	상품 후기 삭제
	public int commentDelete(String notice_id) throws Exception;
	
//	상품 후기 수정 페이지
	public Map<String, Object> commentUpdatePage(String notice_id) throws Exception;
	
//	상품 후기 수정
	public String commentUpdate(NoticeVO noticeVO) throws Exception;

}
