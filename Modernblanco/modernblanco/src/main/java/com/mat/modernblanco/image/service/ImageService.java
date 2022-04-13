// 2021.12.09 ������

package com.mat.modernblanco.image.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mat.modernblanco.image.vo.ImageVO;

public interface ImageService {
	
	public String addImageFile(ImageVO imageVO) throws Exception;
	public ImageVO selectProductImage(Map<String, String> option) throws Exception;
	public List<String> selectImageCategory(String match_id) throws Exception;
	
	// �̹��� ���� ����
	public String updateImageFile(ImageVO imageVO) throws Exception;
	
	// ��ǰ ������, body�� �ԷµǾ� �ִ� �̹��� ���� ����
	public void clearBodyImage(String match_id) throws Exception;
	
	
	public List<ImageVO> selectAllImage(Map<String, String> option) throws Exception;
	
	public List<ImageVO> selectImgOne (String product_id) throws DataAccessException;
	
}
