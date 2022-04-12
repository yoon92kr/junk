// 2022.01.24 윤상현

package com.myspring.baroip.myPage.service;

import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.baroip.myPage.dao.MyPageDAO;
import com.myspring.baroip.notice.vo.NoticeVO;
import com.myspring.baroip.user.vo.UserVO;

@Service("myPageService")
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageDAO myPageDAO;
	
	// user_id 에 해당하는 cart의 전체 수량 select Service
	@Override
	public int myPageCartCount(UserVO userVO) throws Exception {
		int cartCount = myPageDAO.myPageCartCount(userVO);
				
		return cartCount;
	}
	
	// user_id 에 해당하는 order의 배송완료 상품의 전체 수량 select Service
	@Override
	public int myPageOrderCount(UserVO userVO) throws Exception {
		int orderCount = myPageDAO.myPageOrderCount(userVO);
				
		return orderCount;
	}
	
	// 회원정보 수정 서비스
	@Override
	public int updateMyInfo(UserVO userVO) throws Exception {
		
		int flag = myPageDAO.updateMyInfo(userVO);
		
		return flag;
	}
	
	// 조회 조건에 따른 주문 리스트 조회 서비스
	@Override
	public List<Map<String, Object>> myOrder( Map<String, String> option) throws Exception {
		
		
		
		if(option.get("search_option") != null && option.get("search_option").equals("orderDate")) {
			String[] date = option.get("search_value").split(",");
		
			option.remove("search_value");
			option.put("begin", date[0]);
			option.put("end", date[1]);
 
		}

		List<Map<String, Object>> orderList = myPageDAO.myOrder(option);
		
		return orderList;
	}

	// 주문상태 변경 서비스
	@Override
	public void updateOrder(Map<String, String> option) throws Exception {
		
		myPageDAO.updateOrder(option);
		
	}
	
	//	회원 탈퇴
	@Override
	public String dropOut(String user_id) throws Exception {
		
		int result = myPageDAO.dropOut(user_id);
		
		String message = "baroip : 게시글 수정에 문제가 생겼습니다.";
		
		if(result == 1) {
			message = "baroip : " + user_id + " 회원이 탈퇴하였습니다.";
		}
		
		return message;
	}
	
	// 반품 등록 서비스
	@Override
	public String askRefund(NoticeVO noticeVO) throws Exception {
		
		String product_id = myPageDAO.askRefund(noticeVO);
		
		return product_id;
	}
	
	// 주문 정보 호출 DAO
	@Override
	public List<Map<String, Object>> orderDetail(String order_id) throws Exception {
		
		List<Map<String, Object>> orderList = myPageDAO.orderDetail(order_id);
		
		for(int i=0 ; i<orderList.size() ; i++) {
			String encodeImage = Base64.getEncoder().encodeToString((byte[]) orderList.get(i).get("image_file"));
			orderList.get(i).remove("image_file");
			orderList.get(i).put("image_file", encodeImage);
		}
		
		return orderList;
	}
	
//	2022.02.08 한건희
	
//	문의 리스트
	@Override
	public List<NoticeVO> questionList(String user_id) throws Exception {
		List<NoticeVO> questionAnswerAll = myPageDAO.questionList(user_id);
		List<NoticeVO> questionAll = new ArrayList<NoticeVO>();
		List<NoticeVO> answer = new ArrayList<NoticeVO>();
		
		for(int i=0; questionAnswerAll.size()>i; i++) {
			if(questionAnswerAll.get(i).getUser_id().equals(user_id)) {
				questionAll.add(questionAnswerAll.get(i));
			} else{
				answer.add(questionAnswerAll.get(i));
			}
		}
		
		for(int i=0; answer.size()>i; i++) {
			for(int j=0; questionAll.size()>j; j++) {
				if(answer.get(i).getNotice_match_no().equals(questionAll.get(j).getNotice_id())) {
					questionAll.get(j).setNotice_parent_no("1");
				}
			}
		}
		
		return questionAll;
	}
	
//	문의 내역 페이지
	public  Map<String, Object> questionDetail(String notice_id) throws Exception {
		List<Map<String, Object>> result = myPageDAO.questionDetail(notice_id);
		Map<String, Object> detail = new HashMap<String, Object>();
		
		for(int i=0; result.size() > i; i++) {
			if(result.get(i).get("user_rank").equals("1") || result.get(i).get("user_rank").equals("0")) {
				if(result.get(i).get("product_id") != null) {
					String product_title = myPageDAO.productQuestion((String) result.get(i).get("product_id"));
					detail.put("product_title", product_title);
					detail.put("question", result.get(i));
					
				} else if(result.get(i).get("product_id") == null) {
					detail.put("question", result.get(i));					
				}
			} else {
//				답변
				detail.put("answer", result.get(i));
			}
		}
		return detail;
	}
	
//	문의 삭제
	@Override
	public int deleteQuestion(String notice_id) throws Exception {
		int result = myPageDAO.questionDelete(notice_id);
		
		return result;
	}
	
//	문의 수정
	@Override
	public String updateQuestion(NoticeVO noticeVO) throws Exception {
		int result = myPageDAO.questionUpdate(noticeVO);
		String notice_title = noticeVO.getNotice_title();
		String message = "";
		
		if(result == 1) {
			message = "baroip : " + notice_title + " 게시글이 수정되었습니다.";
		} else if(result == 0) {
			message = "baroip : 게시글 수정에 문제가 생겼습니다.";
		}
		
		return message;
	}
	
//	상품 후기 리스트
	@Override
	public List<Map<String, Object>> commentList(String user_id) throws Exception {
		List<Map<String, Object>> myCommentList = myPageDAO.commentList(user_id);
	
		return myCommentList;
	}
	
//	상품 후기 작성
	@Override
	public String addComment(NoticeVO noticeVO) throws Exception {
		String notice_id = myPageDAO.insertComment(noticeVO);
		
		return notice_id;
	}
	
//	상품 후기 삭제
	@Override
	public int commentDelete(String notice_id) throws Exception {
		int result = myPageDAO.deleteComment(notice_id);
		return result;
	}
	
//	상품 후기 수정
	public Map<String, Object> commentUpdatePage(String notice_id) throws Exception {
		Map<String, Object> result = myPageDAO.updateCommentPage(notice_id);
		
		return result;
	}
	
//	상품 후기 수정
	public String commentUpdate(NoticeVO noticeVO) throws Exception {
		int result = myPageDAO.updateMyComment(noticeVO);
		String message = "";
		
		if(result == 1) {
			message = "후기 수정이 완료되었습니다.";
		} else {
			message = "후기 수정 실패";
		}
		
		return message;
	}

}
