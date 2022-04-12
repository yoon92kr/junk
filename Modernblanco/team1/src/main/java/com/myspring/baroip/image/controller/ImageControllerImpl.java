// 2021.12.09 윤상현

package com.myspring.baroip.image.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mortennobel.imagescaling.AdvancedResizeOp;
import com.mortennobel.imagescaling.MultiStepRescaleOp;
import com.myspring.baroip.image.service.ImageService;
import com.myspring.baroip.image.vo.ImageVO;

@Controller("imageController")
public class ImageControllerImpl implements ImageController {

	@Autowired
	private ImageService imageService;

	@Autowired
	private ImageVO imageVO;

	@Override
	public void ImageSetImageVO(MultipartHttpServletRequest multipartRequest, String match_id) throws Exception {

		// 파라미터로 들어오는 match_id는 notice_id / product_id가 되어야함.

		// multipart로 전달된 첨부파일의 name 속성값 전체 대입
		Iterator<String> imageFileNames = multipartRequest.getFileNames();

		// 값이 있는지 확인 후 while 조건문 반복
		while (imageFileNames.hasNext()) {
			// 해당 반복문의 name(product의 경우 body, main, sub) 대입
			String imageCategory = imageFileNames.next();
			// category가 body의 경우 multiple의 형태이기때문에 getFiles를 통해 리스트화 한다.
			if (imageCategory.equals("body")) {

				List<MultipartFile> imageFiles = multipartRequest.getFiles(imageCategory);

				if (!imageFiles.isEmpty()) {

					for (int i = 0; i < imageFiles.size(); i++) {

						if (imageFiles.get(i).getOriginalFilename() != null
								&& imageFiles.get(i).getOriginalFilename() != "") {
							imageVO.setImage_match_id(match_id);
							imageVO.setImage_category(imageCategory + (i + 1));
							imageVO.setImage_file_name(imageFiles.get(i).getOriginalFilename());			
							imageVO.setImage_file(resizing(imageFiles.get(i).getBytes(), 600));

							// 대입된 자료를 mapper.image.insertImage 로 전송
							String imageName = imageService.addImageFile(imageVO);

							System.out.printf("baroip : [%s] 이미지 파일이 DataBase에 저장되었습니다.%n", imageName);

						}
					}
				}

			} else {

				// imageFile 객체에 file객체의 전체 정보를 대입
				MultipartFile imageFile = multipartRequest.getFile(imageCategory);
				if (imageFile != null) {
					if (imageFile.getOriginalFilename() != null && imageFile.getOriginalFilename() != "") {
						imageVO.setImage_match_id(match_id);
						imageVO.setImage_category(imageCategory);
						imageVO.setImage_file_name(imageFile.getOriginalFilename());
						imageVO.setImage_file(resizing(imageFile.getBytes(), 600));

						// 대입된 자료를 mapper.image.insertImage 로 전송
						String imageName = imageService.addImageFile(imageVO);

						System.out.printf("baroip : [%s] 이미지 파일이 DataBase에 저장되었습니다.%n", imageName);
					}
				}
			}
		}

	}

	// 해당 이미지 카테고리에 입력값이 없을경우, 기존값 유지.. 있을경우 업데이트!
	@Override
	public void updateImage(MultipartHttpServletRequest multipartRequest, String match_id) throws Exception {

		// multipart로 전달된 첨부파일의 name 속성값 전체 대입. 업로드된 파일이 없어도 할당됨
		Iterator<String> imageFileNames = multipartRequest.getFileNames();
		// 값 name을 순차적으로 while 조건문 반복(body, main, ...)
		while (imageFileNames.hasNext()) {
			// 해당 반복문의 name(product의 경우 body, main, sub) 대입
			String imageCategory = imageFileNames.next();

			if (imageCategory.equals("body")) {

				List<MultipartFile> imageFiles = multipartRequest.getFiles(imageCategory);
				// body 이미지가 비어있지 않을 경우
				if (!imageFiles.isEmpty()) {

					if (imageFiles.get(0).getOriginalFilename() != null
							&& imageFiles.get(0).getOriginalFilename() != "") {
						// body에 업로드된 이미지파일이 비어있지 않을경우, 기존의 body 1~ 이미지 파일을 제거한다.
						imageService.clearBodyImage(match_id);
					}

					for (int i = 0; i < imageFiles.size(); i++) {

						if (imageFiles.get(i).getOriginalFilename() != null
								&& imageFiles.get(i).getOriginalFilename() != "") {
							imageVO.setImage_match_id(match_id);
							imageVO.setImage_category(imageCategory + (i + 1));
							imageVO.setImage_file_name(imageFiles.get(i).getOriginalFilename());
							imageVO.setImage_file(resizing(imageFiles.get(i).getBytes(), 600));

							// 대입된 자료를 mapper.image.insertImage 로 전송
							String imageName = imageService.addImageFile(imageVO);

							System.out.printf("baroip : [%s] 상품의 [%s] 이미지 파일이 [%s] 이미지로 수정되었습니다.%n", match_id,
									imageCategory + (i + 1), imageName);

						}
						// body 이미지가 비어있을 경우 출력
						else {
							System.out.printf("baroip : [%s] 상품 [%s] 카테고리에 수정 등록한 이미지가 없습니다.%n", match_id,
									imageCategory);
						}
					}
				}

			}
			// 다른 카테고리 notice, cs, main, sub 1~3의 경우 업데이트 진행
			else {

				// imageFile 객체에 file객체의 전체 정보를 대입
				MultipartFile imageFile = multipartRequest.getFile(imageCategory);
				if (imageFile != null) {
					if (imageFile.getOriginalFilename() != null && imageFile.getOriginalFilename() != "") {
						imageVO.setImage_match_id(match_id);
						imageVO.setImage_category(imageCategory);
						imageVO.setImage_file_name(imageFile.getOriginalFilename());
						imageVO.setImage_file(resizing(imageFile.getBytes(), 600));
						String imageName = imageService.updateImageFile(imageVO);

						System.out.printf("baroip : [%s] 상품의 [%s] 이미지 파일이 [%s] 이미지로 수정되었습니다.%n", match_id,
								imageCategory, imageName);
					}
					// 해당 카테고리가 비어있을경우 출력
					else {
						System.out.printf("baroip : [%s] 상품 [%s] 카테고리에 수정 등록한 이미지가 없습니다.%n", match_id, imageCategory);
					}
				}

			}

		}
	}

	

    public static byte[] resizing(byte[] bytes, int width) throws IOException {
    	
    	
    	BufferedImage bi = toBufferedImage(bytes);
    	int height = width * bi.getHeight() / bi.getWidth();
    	MultiStepRescaleOp rescale = new MultiStepRescaleOp(width, height);
    	rescale.setUnsharpenMask(AdvancedResizeOp.UnsharpenMask.Soft);
    	
    	bi = rescale.filter(bi, null);
    	byte[] blob = toByteArray(bi, "jpg");
    
    	return blob;
    	
    }
    
    // convert BufferedImage to byte[]
    public static byte[] toByteArray(BufferedImage bi, String format)
        throws IOException {

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(bi, format, baos);
        byte[] bytes = baos.toByteArray();
        baos.close();
        return bytes;

    }

    // convert byte[] to BufferedImage
    public static BufferedImage toBufferedImage(byte[] bytes)
        throws IOException {

        InputStream is = new ByteArrayInputStream(bytes);
        BufferedImage bi = ImageIO.read(is);
        is.close();
        return bi;

    }
}
