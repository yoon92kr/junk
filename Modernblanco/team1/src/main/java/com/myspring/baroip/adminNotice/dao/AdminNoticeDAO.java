// 2022.01.10 윤상현

package com.myspring.baroip.adminNotice.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.notice.vo.NoticeVO;

public interface AdminNoticeDAO {
	
	// 옵션에 따른 notice select DAO
	public List<NoticeVO> noticeListToOption( Map<String, String> option) throws DataAccessException;
	
	// notice 삭제 DAO
	public int deleteNotice(String notice_id) throws DataAccessException;

	// notice 등록 DAO
	public int addNotice(NoticeVO noticeVO) throws DataAccessException;
	
	// notice 수정 DAO
	public int updateNotice(NoticeVO noticeVO) throws DataAccessException;
}
