// 2022.01.10 윤상현

package com.myspring.baroip.adminNotice.service;

import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.baroip.adminNotice.dao.AdminNoticeDAO;
import com.myspring.baroip.image.service.ImageService;
import com.myspring.baroip.image.vo.ImageVO;
import com.myspring.baroip.notice.vo.NoticeVO;

@Service("adminNoticeService")
public class AdminNoticeServiceImpl implements AdminNoticeService {
	@Autowired
	private AdminNoticeDAO adminNoticeDAO;
	@Autowired
	private ImageService imageService;
	
	// 조회 조건에 따른 notice 리스트 조회 서비스
		@Override
		public Map<String, Map<String, Object>> noticeListToOption( Map<String, String> option) throws Exception {

			// option이 productCreDate일 경우, value로 전달된 yyyy-mm-dd,yyyy-mm-dd를 begin, end로 변형하여 다시 대입한다.
			if(option.get("search_option") != null && option.get("search_option").equals("notice_cre_date")) {
				String[] date = option.get("search_value").split(",");
			
				option.remove("search_value");
				option.put("begin", date[0]);
				option.put("end", date[1]);

			}
			
			List<NoticeVO> noticeList = adminNoticeDAO.noticeListToOption(option);
			String encodeImageFile = "";
			
			Map<String, Map<String, Object>> fullNoticeList = new HashMap<String, Map<String, Object>>();
			// 이미지 호출을 위한 option Map 객체 생성
			Map<String, String> imageOption = new HashMap<String, String>();
				
			
			if(noticeList != null && !noticeList.isEmpty()) {
				
				// 게시글에 이미지가 포함되어있을 경우
				if(option.get("notice_category").equals("comment") || option.get("notice_category").equals("refund")) {
					
					for (int i = 0; i < noticeList.size(); i++) {

						NoticeVO noticeVO = noticeList.get(i);
						
						if (noticeVO != null) {
														
							imageOption.put("match_id", noticeVO.getNotice_id());
							imageOption.put("image_category", option.get("notice_category"));

							// 해당 게시글과 연관된 이미지 호출
							ImageVO noticeImage = imageService.selectProductImage(imageOption);
							// byte를 img로 변환하기 위한 encode
							
							// 게시글 내용과 이미지를 담을 객체 생성
							Map<String, Object> noticeInfo = new HashMap<String, Object>();
							
							// byte[] 자료를 img 태그에 사용가능하도록 encode
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
														
							// 게시글 내용을 담을 객체 생성
							Map<String, Object> noticeInfo = new HashMap<String, Object>();
							noticeInfo.put("notice", noticeVO);				
							fullNoticeList.put("notice" + (i+1), noticeInfo);
							
						}

					}	
				}

			}
			else {
				System.out.println("baroip : 조회된 게시글이 없습니다.");
			}

			return fullNoticeList;
		}
		
	//	notice 삭제 Service
	@Override
	public String deleteNotice(String notice_id) throws Exception { 
		int result=adminNoticeDAO.deleteNotice(notice_id);
		String message = "baroip : 삭제할 게시물이 존재하지 않습니다.";
		if (result > 0) {
			message = "baroip : "+notice_id+" 게시글이 삭제되었습니다.";
		}
		return message; 
	}
	
	// notice 등록 Service
	@Override
	public String addNotice(NoticeVO noticeVO) throws Exception {
		int result = adminNoticeDAO.addNotice(noticeVO);
		String notice_title = noticeVO.getNotice_title();
		String message = "baroip : 게시글 등록에 문제가 발생하였습니다.";
		
		if(result > 0) {
			message = "baroip : "+notice_title+"게시글이 등록되었습니다.";
		}
		
		return message;
	}
	
	// notice 수정 Service
	@Override
	public String updateNotice(NoticeVO noticeVO) throws Exception {
		int result = adminNoticeDAO.updateNotice(noticeVO);
		String notice_title = noticeVO.getNotice_title();
		String message = "baroip : 게시글 등록에 문제가 발생하였습니다.";
		
		if(result > 0) {
			message = "baroip : "+notice_title+"게시글이 수정되었습니다.";
		}
		
		return message;
	}

}
