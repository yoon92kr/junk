// 2022.01.10 ������

package com.mat.modernblanco.adminNotice.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mat.modernblanco.notice.vo.NoticeVO;

public interface AdminNoticeDAO {
	
	// �ɼǿ� ���� notice select DAO
	public List<NoticeVO> noticeListToOption( Map<String, String> option) throws DataAccessException;
	
	// notice ���� DAO
	public int deleteNotice(String notice_id) throws DataAccessException;

	// notice ��� DAO
	public int addNotice(NoticeVO noticeVO) throws DataAccessException;
	
	// notice ���� DAO
	public int updateNotice(NoticeVO noticeVO) throws DataAccessException;
}
