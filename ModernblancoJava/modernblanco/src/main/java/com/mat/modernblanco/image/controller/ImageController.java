// 2021.12.09 ������

package com.mat.modernblanco.image.controller;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ImageController {
	public void ImageSetImageVO(MultipartHttpServletRequest multipartRequest, String match_id) throws Exception;
	
	public void updateImage(MultipartHttpServletRequest multipartRequest, String match_id) throws Exception;
}
