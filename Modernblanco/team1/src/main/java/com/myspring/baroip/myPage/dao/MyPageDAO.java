// 2022.01.24 윤상현

package com.myspring.baroip.myPage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.notice.vo.NoticeVO;
import com.myspring.baroip.user.vo.UserVO;

public interface MyPageDAO {

	// user_id 에 해당하는 cart의 전체 수량 select DAO
	public int myPageCartCount(UserVO userVO) throws DataAccessException;

	// user_id 에 해당하는 order의 배송완료 상품의 전체 수량 select DAO

	public int myPageOrderCount(UserVO userVO) throws DataAccessException;
	
	// 회원정보 수정 DAO
	public int updateMyInfo(UserVO userVO) throws DataAccessException;
	
	// 회원 탈퇴
	public int dropOut(String user_id) throws DataAccessException;
	
	// 조회 조건에 따른 주문 리스트 조회 DAO
	public List<Map<String, Object>> myOrder( Map<String, String> option) throws DataAccessException;
	
	// 주문상태 변경 DAO
	public void updateOrder(Map<String, String> option) throws DataAccessException;
	
	
	// 반품 등록 DAO
	public String askRefund(NoticeVO noticeVO) throws DataAccessException;
	
	// 주문 정보 호출 DAO
	public List<Map<String, Object>> orderDetail(String order_id) throws DataAccessException;
	
//	문의 페이지
	public List<NoticeVO> questionList(String user_id) throws DataAccessException;
	
//	문의 내역 페이지
	public List<Map<String, Object>> questionDetail(String notice_id) throws DataAccessException;
	
//	상품 문의 시 title 불러오기
	public String productQuestion(String product_id) throws DataAccessException;
	
//	문의 삭제
	public int questionDelete(String notice_id) throws DataAccessException;
	
//	문의 수정
	public int questionUpdate(NoticeVO noticeVO) throws DataAccessException;
	
//	상품 후기 리스트
	public List<Map<String, Object>> commentList(String user_id) throws DataAccessException;
	
//	상품 후기 작성
	public String insertComment(NoticeVO noticeVO) throws DataAccessException;
	
//	상품 후기 삭제
	public int deleteComment(String notice_id) throws DataAccessException;
	
//	상품후기 수정 페이지
	public Map<String, Object> updateCommentPage(String notice_id) throws DataAccessException;
	
//	상품후기 수정
	public int updateMyComment(NoticeVO noticeVO) throws DataAccessException;
	
}
