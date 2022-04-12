// 2022.02.10 윤상현

package com.myspring.baroip.adminCS.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.notice.vo.NoticeVO;

public interface AdminCSDAO {
	
	// 옵션에 따른 CS select DAO
	public List<Map<String, Object>> CSListToOption(Map<String, String> option) throws DataAccessException;
	
	// CS 삭제 DAO
	public int deleteCS(String notice_id) throws DataAccessException;

	// CS 상세정보 DAO
	public Map<String, Object> CSDetail(Map<String, String> option) throws DataAccessException;
	
	// cs 답글 등록 DAO
	public int addCS(NoticeVO noticeVO) throws DataAccessException;
}
