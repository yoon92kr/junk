// 2022.01.10 ������

package com.mat.modernblanco.adminNotice.service;

import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mat.modernblanco.adminNotice.dao.AdminNoticeDAO;
import com.mat.modernblanco.image.service.ImageService;
import com.mat.modernblanco.image.vo.ImageVO;
import com.mat.modernblanco.notice.vo.NoticeVO;

@Service("adminNoticeService")
public class AdminNoticeServiceImpl implements AdminNoticeService {
	@Autowired
	private AdminNoticeDAO adminNoticeDAO;
	@Autowired
	private ImageService imageService;
	
	// ��ȸ ���ǿ� ���� notice ����Ʈ ��ȸ ����
		@Override
		public Map<String, Map<String, Object>> noticeListToOption( Map<String, String> option) throws Exception {

			// option�� productCreDate�� ���, value�� ���޵� yyyy-mm-dd,yyyy-mm-dd�� begin, end�� �����Ͽ� �ٽ� �����Ѵ�.
			if(option.get("search_option") != null && option.get("search_option").equals("notice_cre_date")) {
				String[] date = option.get("search_value").split(",");
			
				option.remove("search_value");
				option.put("begin", date[0]);
				option.put("end", date[1]);

			}
			
			List<NoticeVO> noticeList = adminNoticeDAO.noticeListToOption(option);
			String encodeImageFile = "";
			
			Map<String, Map<String, Object>> fullNoticeList = new HashMap<String, Map<String, Object>>();
			// �̹��� ȣ���� ���� option Map ��ü ����
			Map<String, String> imageOption = new HashMap<String, String>();
				
			
			if(noticeList != null && !noticeList.isEmpty()) {
				
				// �Խñۿ� �̹����� ���ԵǾ����� ���
				if(option.get("notice_category").equals("comment") || option.get("notice_category").equals("refund")) {
					
					for (int i = 0; i < noticeList.size(); i++) {

						NoticeVO noticeVO = noticeList.get(i);
						
						if (noticeVO != null) {
														
							imageOption.put("match_id", noticeVO.getNotice_id());
							imageOption.put("image_category", option.get("notice_category"));

							// �ش� �Խñ۰� ������ �̹��� ȣ��
							ImageVO noticeImage = imageService.selectProductImage(imageOption);
							// byte�� img�� ��ȯ�ϱ� ���� encode
							
							// �Խñ� ����� �̹����� ���� ��ü ����
							Map<String, Object> noticeInfo = new HashMap<String, Object>();
							
							// byte[] �ڷḦ img �±׿� ��밡���ϵ��� encode
							if(noticeImage != null) {
								encodeImageFile = Base64.getEncoder().encodeToString(noticeImage.getImage_file());
							}

							noticeInfo.put("notice", noticeVO);
							noticeInfo.put("image_file", encodeImageFile);
				
							fullNoticeList.put("notice" + (i+1), noticeInfo);
							
						}

					}				
				}
				else {
					for (int i = 0; i < noticeList.size(); i++) {

						NoticeVO noticeVO = noticeList.get(i);
						
						if (noticeVO != null) {
														
							// �Խñ� ������ ���� ��ü ����
							Map<String, Object> noticeInfo = new HashMap<String, Object>();
							noticeInfo.put("notice", noticeVO);				
							fullNoticeList.put("notice" + (i+1), noticeInfo);
							
						}

					}	
				}

			}
			else {
				System.out.println("baroip : ��ȸ�� �Խñ��� �����ϴ�.");
			}

			return fullNoticeList;
		}
		
	//	notice ���� Service
	@Override
	public String deleteNotice(String notice_id) throws Exception { 
		int result=adminNoticeDAO.deleteNotice(notice_id);
		String message = "baroip : ������ �Խù��� �������� �ʽ��ϴ�.";
		if (result > 0) {
			message = "baroip : "+notice_id+" �Խñ��� �����Ǿ����ϴ�.";
		}
		return message; 
	}
	
	// notice ��� Service
	@Override
	public String addNotice(NoticeVO noticeVO) throws Exception {
		int result = adminNoticeDAO.addNotice(noticeVO);
		String notice_title = noticeVO.getNotice_title();
		String message = "baroip : �Խñ� ��Ͽ� ������ �߻��Ͽ����ϴ�.";
		
		if(result > 0) {
			message = "baroip : "+notice_title+"�Խñ��� ��ϵǾ����ϴ�.";
		}
		
		return message;
	}
	
	// notice ���� Service
	@Override
	public String updateNotice(NoticeVO noticeVO) throws Exception {
		int result = adminNoticeDAO.updateNotice(noticeVO);
		String notice_title = noticeVO.getNotice_title();
		String message = "baroip : �Խñ� ��Ͽ� ������ �߻��Ͽ����ϴ�.";
		
		if(result > 0) {
			message = "baroip : "+notice_title+"�Խñ��� �����Ǿ����ϴ�.";
		}
		
		return message;
	}

}
