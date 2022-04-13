// 2022.01.24 ������

package com.mat.modernblanco.myPage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mat.modernblanco.notice.vo.NoticeVO;
import com.mat.modernblanco.user.vo.UserVO;

public interface MyPageDAO {

	// user_id �� �ش��ϴ� cart�� ��ü ���� select DAO
	public int myPageCartCount(UserVO userVO) throws DataAccessException;

	// user_id �� �ش��ϴ� order�� ��ۿϷ� ��ǰ�� ��ü ���� select DAO

	public int myPageOrderCount(UserVO userVO) throws DataAccessException;
	
	// ȸ������ ���� DAO
	public int updateMyInfo(UserVO userVO) throws DataAccessException;
	
	// ȸ�� Ż��
	public int dropOut(String user_id) throws DataAccessException;
	
	// ��ȸ ���ǿ� ���� �ֹ� ����Ʈ ��ȸ DAO
	public List<Map<String, Object>> myOrder( Map<String, String> option) throws DataAccessException;
	
	// �ֹ����� ���� DAO
	public void updateOrder(Map<String, String> option) throws DataAccessException;
	
	
	// ��ǰ ��� DAO
	public String askRefund(NoticeVO noticeVO) throws DataAccessException;
	
	// �ֹ� ���� ȣ�� DAO
	public List<Map<String, Object>> orderDetail(String order_id) throws DataAccessException;
	
//	���� ������
	public List<NoticeVO> questionList(String user_id) throws DataAccessException;
	
//	���� ���� ������
	public List<Map<String, Object>> questionDetail(String notice_id) throws DataAccessException;
	
//	��ǰ ���� �� title �ҷ�����
	public String productQuestion(String product_id) throws DataAccessException;
	
//	���� ����
	public int questionDelete(String notice_id) throws DataAccessException;
	
//	���� ����
	public int questionUpdate(NoticeVO noticeVO) throws DataAccessException;
	
//	��ǰ �ı� ����Ʈ
	public List<Map<String, Object>> commentList(String user_id) throws DataAccessException;
	
//	��ǰ �ı� �ۼ�
	public String insertComment(NoticeVO noticeVO) throws DataAccessException;
	
//	��ǰ �ı� ����
	public int deleteComment(String notice_id) throws DataAccessException;
	
//	��ǰ�ı� ���� ������
	public Map<String, Object> updateCommentPage(String notice_id) throws DataAccessException;
	
//	��ǰ�ı� ����
	public int updateMyComment(NoticeVO noticeVO) throws DataAccessException;
	
}
