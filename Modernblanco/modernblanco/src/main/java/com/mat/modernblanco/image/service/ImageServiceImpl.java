// 2021.12.09 ������

package com.mat.modernblanco.image.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mat.modernblanco.image.dao.ImageDAO;
import com.mat.modernblanco.image.vo.ImageVO;

@Service("imageService")
@Transactional(propagation = Propagation.REQUIRED)
public class ImageServiceImpl implements ImageService {

	@Autowired
	private ImageDAO imageDAO;

	@Override
	public String addImageFile(ImageVO imageVO) throws Exception {

		String imageName = imageDAO.insertImageFile(imageVO);

		return imageName;
	}

	// option�� �Ķ���ʹ� match_id/�� , image_category/���� �ΰ��� Map�� �����Ѵ�..
	@Override
	public ImageVO selectProductImage(Map<String, String> option) throws Exception {
		ImageVO image = imageDAO.selectProductImages(option);

		return image;

	}

	@Override
	public List<String> selectImageCategory(String match_id) throws Exception {

		List<String> categoryList = imageDAO.selectImageCategory(match_id);

		return categoryList;
	}
	
	@Override
	public String updateImageFile(ImageVO imageVO) throws Exception {

		String imageName = imageDAO.updateImageFile(imageVO);

		return imageName;
	}
	
	@Override
	public void clearBodyImage(String match_id) throws Exception {
		imageDAO.clearBodyImage(match_id);
		System.out.printf("baroip : [%s] ��ǰ�� [body] �̹����� ���� �Ǿ����ϴ�.%n", match_id);
	}
	
	@Override
	public List<ImageVO> selectAllImage(Map<String, String> option) throws Exception {

		List<ImageVO> imageList = imageDAO.selectAllImage(option);

		return imageList;
	}
	
	@Override
	public List<ImageVO> selectImgOne (String product_id) throws DataAccessException {
		
		List<ImageVO> imageList = imageDAO.selectImgOne(product_id);

		return imageList;
	}
	
}
