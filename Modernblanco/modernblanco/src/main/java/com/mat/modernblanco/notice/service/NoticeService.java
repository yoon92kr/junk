// 2021.12.24 �Ӽ���

package com.mat.modernblanco.notice.service;

import java.util.List;
import java.util.Map;

import com.mat.modernblanco.notice.vo.NoticeVO;

public interface NoticeService {
	
//	�������� ����Ʈ������
	public List<NoticeVO> noticeList() throws Exception;
	
//	�������� ��
	public NoticeVO noticeDetail(String notice_id) throws Exception;
	
//	��ǰ�ı�
	public List<Map<String, Object>> productComment(String product_id) throws Exception;
	
//	��ǰ ����
	public Map<String, Object> productQuestion(String product_id) throws Exception;
	
//	��ǰ ���� �ۼ� ������
	public void addPQA(NoticeVO noticeVO) throws Exception;
	
	//	1:1���� ����Ʈ
	public List<Map<String, Object>> UQAList() throws Exception;
}
