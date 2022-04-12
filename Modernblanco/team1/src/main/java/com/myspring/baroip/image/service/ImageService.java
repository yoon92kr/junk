// 2021.12.09 윤상현

package com.myspring.baroip.image.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.image.vo.ImageVO;

public interface ImageService {
	
	public String addImageFile(ImageVO imageVO) throws Exception;
	public ImageVO selectProductImage(Map<String, String> option) throws Exception;
	public List<String> selectImageCategory(String match_id) throws Exception;
	
	// 이미지 수정 서비스
	public String updateImageFile(ImageVO imageVO) throws Exception;
	
	// 상품 수정시, body에 입력되어 있던 이미지 삭제 서비스
	public void clearBodyImage(String match_id) throws Exception;
	
	
	public List<ImageVO> selectAllImage(Map<String, String> option) throws Exception;
	
	public List<ImageVO> selectImgOne (String product_id) throws DataAccessException;
	
}
