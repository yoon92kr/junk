//2021.12.13 윤상현

package com.myspring.baroip.image.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.image.vo.ImageVO;

public interface ImageDAO {
	
	// 이미지 등록 DAO
	public String insertImageFile(ImageVO imageVO) throws DataAccessException;
	
	// 상품과 관계된 imageVO 호출 DAO, 파라미터 key 에는 "match_id" , "image_category" 가 입력되어야 한다.
	public ImageVO selectProductImages(Map<String, String> option) throws DataAccessException;
	
	// 매칭아이디에 연계된 카테고리 셀렉 DAO
	public List<String> selectImageCategory(String match_id) throws DataAccessException;
	
	// 이미지 수정 DAO
	public String updateImageFile(ImageVO imageVO) throws DataAccessException;
	
	// body 이미지 삭제
	public void clearBodyImage(String match_id) throws DataAccessException;
	
	public List<ImageVO> selectAllImage(Map<String, String> option) throws DataAccessException;
	
	public List<ImageVO> selectImgOne (String product_id) throws DataAccessException;
	
}
