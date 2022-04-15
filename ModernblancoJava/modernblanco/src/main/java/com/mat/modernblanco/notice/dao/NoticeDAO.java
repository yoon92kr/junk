// 2021.12.24 �Ӽ���

package com.mat.modernblanco.notice.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mat.modernblanco.notice.vo.NoticeVO;

public interface NoticeDAO {
	
//	�������� ����Ʈ������
	public List<NoticeVO> noticeList() throws DataAccessException;
	
//	�������� ��
	public NoticeVO noticeDetail(String notice_id) throws DataAccessException;

//	��ǰ�ı�
	public List<Map<String, Object>> selectCommentList(String product_id) throws DataAccessException;
	
//	��ǰ ���� ����Ʈ
	public List<NoticeVO> selectPQAList(String product_id) throws DataAccessException;
	
//	��ǰ ���� �ۼ� ������
	public void insertPQA(NoticeVO noticeVO) throws DataAccessException;
	
//	1:1 ���� ����Ʈ
	public List<Map<String, Object>> UQAList() throws DataAccessException;

}
