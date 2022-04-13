// 2022.02.10 ������

package com.mat.modernblanco.adminCS.service;

import java.util.Base64;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mat.modernblanco.adminCS.dao.AdminCSDAO;
import com.mat.modernblanco.notice.vo.NoticeVO;

@Service("adminCSService")
public class AdminCSServiceImpl implements AdminCSService {
	@Autowired
	private AdminCSDAO adminCSDAO;
		
	// ��ȸ ���ǿ� ���� CS ����Ʈ ��ȸ ����
		@Override
		public List<Map<String, Object>> CSListToOption(Map<String, String> option) throws Exception {

			// option�� productCreDate�� ���, value�� ���޵� yyyy-mm-dd,yyyy-mm-dd�� begin, end�� �����Ͽ� �ٽ� �����Ѵ�.
			if(option.get("search_option") != null && option.get("search_option").equals("noticeDate")) {
				String[] date = option.get("search_value").split(",");
			
				option.remove("search_value");
				option.put("begin", date[0]);
				option.put("end", date[1]);

			}
			
			List<Map<String, Object>> CSList = adminCSDAO.CSListToOption(option);
			

			return CSList;
		}
		
	//	CS ���� Service
	@Override
	public String deleteCS(String notice_id) throws Exception { 
		int result=adminCSDAO.deleteCS(notice_id);
		String message = "baroip : ������ �Խù��� �������� �ʽ��ϴ�.";
		if (result > 0) {
			message = "baroip : "+notice_id+" �Խñ��� �����Ǿ����ϴ�.";
		}
		return message; 
	}
	
	// CS ������ Service
	@Override
	public Map<String, Object> CSDetail(Map<String, String> option) throws Exception {
		
		Map<String, Object> result = adminCSDAO.CSDetail(option);
		
		if(option.get("option").equals("comment")) {
			
			String encodeImage = Base64.getEncoder().encodeToString((byte[]) result.get("image_file"));
			result.remove("image_file");
			result.put("image_file", encodeImage);
		}
		
		return result;
	}
	
	// cs ��� ��� Service
	@Override
	public String addCS(NoticeVO noticeVO) throws Exception {
		int result = adminCSDAO.addCS(noticeVO);
		String notice_id = noticeVO.getNotice_id();
		String message = "baroip : ��� ��Ͽ� ������ �߻��Ͽ����ϴ�.";
		
		if(result > 0) {
			message = "baroip : "+notice_id+"�Խñۿ� ����� �����Ǿ����ϴ�.";
		}
		
		return message;
	}

}
