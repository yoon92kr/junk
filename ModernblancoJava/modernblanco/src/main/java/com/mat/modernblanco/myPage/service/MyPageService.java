// 2022.01.24 ������

package com.mat.modernblanco.myPage.service;

import java.util.List;
import java.util.Map;

import com.mat.modernblanco.notice.vo.NoticeVO;
import com.mat.modernblanco.user.vo.UserVO;

public interface MyPageService {

	// user_id �� �ش��ϴ� cart�� ��ü ���� select Service
	public int myPageCartCount(UserVO userVO) throws Exception;

	// user_id �� �ش��ϴ� order�� ��ۿϷ� ��ǰ�� ��ü ���� select Service
	public int myPageOrderCount(UserVO userVO) throws Exception;
	
	// ȸ�� Ż��
	public String dropOut(String user_id) throws Exception;
	
	// ȸ������ ���� ����
	public int updateMyInfo(UserVO userVO) throws Exception;

	// ��ȸ ���ǿ� ���� �ֹ� ����Ʈ ��ȸ ����
	public List<Map<String, Object>> myOrder( Map<String, String> option) throws Exception;
	
	// �ֹ� ���� ���� ����
	public void updateOrder(Map<String, String> option) throws Exception;
	
	// ��ǰ ��� ����
	public String askRefund(NoticeVO noticeVO) throws Exception;
	
	// �ֹ� ���� ȣ�� DAO
	public List<Map<String, Object>> orderDetail(String order_id) throws Exception;
	
//	���� ����Ʈ
	public List<NoticeVO> questionList(String user_id) throws Exception;
	
//	���� ���� ������
	public Map<String, Object> questionDetail(String notice_id) throws Exception;
	
//	���� ����
	public int deleteQuestion(String notice_id) throws Exception;
	
//	���� ����
	public String updateQuestion(NoticeVO noticeVO) throws Exception;
	
//	��ǰ �ı� ����Ʈ
	public List<Map<String, Object>> commentList(String user_id) throws Exception;
	
//	��ǰ �ı� �ۼ�
	public String addComment(NoticeVO noticeVO) throws Exception;
	
//	��ǰ �ı� ����
	public int commentDelete(String notice_id) throws Exception;
	
//	��ǰ �ı� ���� ������
	public Map<String, Object> commentUpdatePage(String notice_id) throws Exception;
	
//	��ǰ �ı� ����
	public String commentUpdate(NoticeVO noticeVO) throws Exception;

}
