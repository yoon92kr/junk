// 2022.02.10 ������

package com.mat.modernblanco.adminCS.service;

import java.util.List;
import java.util.Map;

import com.mat.modernblanco.notice.vo.NoticeVO;

public interface AdminCSService {
	
	//	�ɼǿ� ���� notice ����Ʈ ��ȸ Service
	public List<Map<String, Object>> CSListToOption(Map<String, String> option) throws Exception;
	
	//	CS ���� Service
	public String deleteCS(String notice_id) throws Exception;
	
	// CS ������ Service
	public Map<String, Object> CSDetail(Map<String, String> option) throws Exception;
	
	// cs ��� ��� Service
	public String addCS(NoticeVO noticeVO) throws Exception;
}
