// 2022.01.10 윤상현

package com.myspring.baroip.adminNotice.service;

import java.util.Map;

import com.myspring.baroip.notice.vo.NoticeVO;

public interface AdminNoticeService {
	
	//	옵션에 따른 notice 리스트 조회 Service
	public Map<String, Map<String, Object>> noticeListToOption( Map<String, String> option) throws Exception;
	
	//	notice 삭제 Service
	public String deleteNotice(String notice_id) throws Exception;
	
	// notice 등록 Service
	public String addNotice(NoticeVO noticeVO) throws Exception;
	
	// notice 수정 Service
	public String updateNotice(NoticeVO noticeVO) throws Exception;
}
