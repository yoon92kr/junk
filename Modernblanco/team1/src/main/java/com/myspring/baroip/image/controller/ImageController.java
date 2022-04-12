// 2021.12.09 À±»óÇö

package com.myspring.baroip.image.controller;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ImageController {
	public void ImageSetImageVO(MultipartHttpServletRequest multipartRequest, String match_id) throws Exception;
	
	public void updateImage(MultipartHttpServletRequest multipartRequest, String match_id) throws Exception;
}
