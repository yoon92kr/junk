// 2022.01.24 ������

package com.mat.modernblanco.myPage.service;

import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mat.modernblanco.myPage.dao.MyPageDAO;
import com.mat.modernblanco.notice.vo.NoticeVO;
import com.mat.modernblanco.user.vo.UserVO;

@Service("myPageService")
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageDAO myPageDAO;
	
	// user_id �� �ش��ϴ� cart�� ��ü ���� select Service
	@Override
	public int myPageCartCount(UserVO userVO) throws Exception {
		int cartCount = myPageDAO.myPageCartCount(userVO);
				
		return cartCount;
	}
	
	// user_id �� �ش��ϴ� order�� ��ۿϷ� ��ǰ�� ��ü ���� select Service
	@Override
	public int myPageOrderCount(UserVO userVO) throws Exception {
		int orderCount = myPageDAO.myPageOrderCount(userVO);
				
		return orderCount;
	}
	
	// ȸ������ ���� ����
	@Override
	public int updateMyInfo(UserVO userVO) throws Exception {
		
		int flag = myPageDAO.updateMyInfo(userVO);
		
		return flag;
	}
	
	// ��ȸ ���ǿ� ���� �ֹ� ����Ʈ ��ȸ ����
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

	// �ֹ����� ���� ����
	@Override
	public void updateOrder(Map<String, String> option) throws Exception {
		
		myPageDAO.updateOrder(option);
		
	}
	
	//	ȸ�� Ż��
	@Override
	public String dropOut(String user_id) throws Exception {
		
		int result = myPageDAO.dropOut(user_id);
		
		String message = "baroip : �Խñ� ������ ������ ������ϴ�.";
		
		if(result == 1) {
			message = "baroip : " + user_id + " ȸ���� Ż���Ͽ����ϴ�.";
		}
		
		return message;
	}
	
	// ��ǰ ��� ����
	@Override
	public String askRefund(NoticeVO noticeVO) throws Exception {
		
		String product_id = myPageDAO.askRefund(noticeVO);
		
		return product_id;
	}
	
	// �ֹ� ���� ȣ�� DAO
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
	
//	2022.02.08 �Ѱ���
	
//	���� ����Ʈ
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
	
//	���� ���� ������
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
//				�亯
				detail.put("answer", result.get(i));
			}
		}
		return detail;
	}
	
//	���� ����
	@Override
	public int deleteQuestion(String notice_id) throws Exception {
		int result = myPageDAO.questionDelete(notice_id);
		
		return result;
	}
	
//	���� ����
	@Override
	public String updateQuestion(NoticeVO noticeVO) throws Exception {
		int result = myPageDAO.questionUpdate(noticeVO);
		String notice_title = noticeVO.getNotice_title();
		String message = "";
		
		if(result == 1) {
			message = "baroip : " + notice_title + " �Խñ��� �����Ǿ����ϴ�.";
		} else if(result == 0) {
			message = "baroip : �Խñ� ������ ������ ������ϴ�.";
		}
		
		return message;
	}
	
//	��ǰ �ı� ����Ʈ
	@Override
	public List<Map<String, Object>> commentList(String user_id) throws Exception {
		List<Map<String, Object>> myCommentList = myPageDAO.commentList(user_id);
	
		return myCommentList;
	}
	
//	��ǰ �ı� �ۼ�
	@Override
	public String addComment(NoticeVO noticeVO) throws Exception {
		String notice_id = myPageDAO.insertComment(noticeVO);
		
		return notice_id;
	}
	
//	��ǰ �ı� ����
	@Override
	public int commentDelete(String notice_id) throws Exception {
		int result = myPageDAO.deleteComment(notice_id);
		return result;
	}
	
//	��ǰ �ı� ����
	public Map<String, Object> commentUpdatePage(String notice_id) throws Exception {
		Map<String, Object> result = myPageDAO.updateCommentPage(notice_id);
		
		return result;
	}
	
//	��ǰ �ı� ����
	public String commentUpdate(NoticeVO noticeVO) throws Exception {
		int result = myPageDAO.updateMyComment(noticeVO);
		String message = "";
		
		if(result == 1) {
			message = "�ı� ������ �Ϸ�Ǿ����ϴ�.";
		} else {
			message = "�ı� ���� ����";
		}
		
		return message;
	}

}
