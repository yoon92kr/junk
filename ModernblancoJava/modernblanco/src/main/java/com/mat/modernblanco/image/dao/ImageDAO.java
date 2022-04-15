//2021.12.13 ������

package com.mat.modernblanco.image.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mat.modernblanco.image.vo.ImageVO;

public interface ImageDAO {
	
	// �̹��� ��� DAO
	public String insertImageFile(ImageVO imageVO) throws DataAccessException;
	
	// ��ǰ�� ����� imageVO ȣ�� DAO, �Ķ���� key ���� "match_id" , "image_category" �� �ԷµǾ�� �Ѵ�.
	public ImageVO selectProductImages(Map<String, String> option) throws DataAccessException;
	
	// ��Ī���̵� ����� ī�װ� ���� DAO
	public List<String> selectImageCategory(String match_id) throws DataAccessException;
	
	// �̹��� ���� DAO
	public String updateImageFile(ImageVO imageVO) throws DataAccessException;
	
	// body �̹��� ����
	public void clearBodyImage(String match_id) throws DataAccessException;
	
	public List<ImageVO> selectAllImage(Map<String, String> option) throws DataAccessException;
	
	public List<ImageVO> selectImgOne (String product_id) throws DataAccessException;
	
}
