// 2022.01.10 ������

package com.myspring.baroip.adminNotice.service;

import java.util.Map;

import com.myspring.baroip.notice.vo.NoticeVO;

public interface AdminNoticeService {
	
	//	�ɼǿ� ���� notice ����Ʈ ��ȸ Service
	public Map<String, Map<String, Object>> noticeListToOption( Map<String, String> option) throws Exception;
	
	//	notice ���� Service
	public String deleteNotice(String notice_id) throws Exception;
	
	// notice ��� Service
	public String addNotice(NoticeVO noticeVO) throws Exception;
	
	// notice ���� Service
	public String updateNotice(NoticeVO noticeVO) throws Exception;
}
