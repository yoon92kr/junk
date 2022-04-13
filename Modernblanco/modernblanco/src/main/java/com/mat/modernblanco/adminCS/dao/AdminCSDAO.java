// 2022.02.10 ������

package com.mat.modernblanco.adminCS.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mat.modernblanco.notice.vo.NoticeVO;

public interface AdminCSDAO {
	
	// �ɼǿ� ���� CS select DAO
	public List<Map<String, Object>> CSListToOption(Map<String, String> option) throws DataAccessException;
	
	// CS ���� DAO
	public int deleteCS(String notice_id) throws DataAccessException;

	// CS ������ DAO
	public Map<String, Object> CSDetail(Map<String, String> option) throws DataAccessException;
	
	// cs ��� ��� DAO
	public int addCS(NoticeVO noticeVO) throws DataAccessException;
}
