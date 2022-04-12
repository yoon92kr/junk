// 2022.02.10 윤상현

package com.myspring.baroip.adminCS.service;

import java.util.List;
import java.util.Map;

import com.myspring.baroip.notice.vo.NoticeVO;

public interface AdminCSService {
	
	//	옵션에 따른 notice 리스트 조회 Service
	public List<Map<String, Object>> CSListToOption(Map<String, String> option) throws Exception;
	
	//	CS 삭제 Service
	public String deleteCS(String notice_id) throws Exception;
	
	// CS 상세정보 Service
	public Map<String, Object> CSDetail(Map<String, String> option) throws Exception;
	
	// cs 답글 등록 Service
	public String addCS(NoticeVO noticeVO) throws Exception;
}
