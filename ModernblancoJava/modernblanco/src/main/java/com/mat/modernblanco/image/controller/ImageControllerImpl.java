// 2021.12.09 ������

package com.mat.modernblanco.image.controller;

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
import com.mat.modernblanco.image.service.ImageService;
import com.mat.modernblanco.image.vo.ImageVO;

@Controller("imageController")
public class ImageControllerImpl implements ImageController {

	@Autowired
	private ImageService imageService;

	@Autowired
	private ImageVO imageVO;

	@Override
	public void ImageSetImageVO(MultipartHttpServletRequest multipartRequest, String match_id) throws Exception {

		// �Ķ���ͷ� ������ match_id�� notice_id / product_id�� �Ǿ����.

		// multipart�� ���޵� ÷�������� name �Ӽ��� ��ü ����
		Iterator<String> imageFileNames = multipartRequest.getFileNames();

		// ���� �ִ��� Ȯ�� �� while ���ǹ� �ݺ�
		while (imageFileNames.hasNext()) {
			// �ش� �ݺ����� name(product�� ��� body, main, sub) ����
			String imageCategory = imageFileNames.next();
			// category�� body�� ��� multiple�� �����̱⶧���� getFiles�� ���� ����Ʈȭ �Ѵ�.
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

							// ���Ե� �ڷḦ mapper.image.insertImage �� ����
							String imageName = imageService.addImageFile(imageVO);

							System.out.printf("baroip : [%s] �̹��� ������ DataBase�� ����Ǿ����ϴ�.%n", imageName);

						}
					}
				}

			} else {

				// imageFile ��ü�� file��ü�� ��ü ������ ����
				MultipartFile imageFile = multipartRequest.getFile(imageCategory);
				if (imageFile != null) {
					if (imageFile.getOriginalFilename() != null && imageFile.getOriginalFilename() != "") {
						imageVO.setImage_match_id(match_id);
						imageVO.setImage_category(imageCategory);
						imageVO.setImage_file_name(imageFile.getOriginalFilename());
						imageVO.setImage_file(resizing(imageFile.getBytes(), 600));

						// ���Ե� �ڷḦ mapper.image.insertImage �� ����
						String imageName = imageService.addImageFile(imageVO);

						System.out.printf("baroip : [%s] �̹��� ������ DataBase�� ����Ǿ����ϴ�.%n", imageName);
					}
				}
			}
		}

	}

	// �ش� �̹��� ī�װ��� �Է°��� �������, ������ ����.. ������� ������Ʈ!
	@Override
	public void updateImage(MultipartHttpServletRequest multipartRequest, String match_id) throws Exception {

		// multipart�� ���޵� ÷�������� name �Ӽ��� ��ü ����. ���ε�� ������ ��� �Ҵ��
		Iterator<String> imageFileNames = multipartRequest.getFileNames();
		// �� name�� ���������� while ���ǹ� �ݺ�(body, main, ...)
		while (imageFileNames.hasNext()) {
			// �ش� �ݺ����� name(product�� ��� body, main, sub) ����
			String imageCategory = imageFileNames.next();

			if (imageCategory.equals("body")) {

				List<MultipartFile> imageFiles = multipartRequest.getFiles(imageCategory);
				// body �̹����� ������� ���� ���
				if (!imageFiles.isEmpty()) {

					if (imageFiles.get(0).getOriginalFilename() != null
							&& imageFiles.get(0).getOriginalFilename() != "") {
						// body�� ���ε�� �̹��������� ������� �������, ������ body 1~ �̹��� ������ �����Ѵ�.
						imageService.clearBodyImage(match_id);
					}

					for (int i = 0; i < imageFiles.size(); i++) {

						if (imageFiles.get(i).getOriginalFilename() != null
								&& imageFiles.get(i).getOriginalFilename() != "") {
							imageVO.setImage_match_id(match_id);
							imageVO.setImage_category(imageCategory + (i + 1));
							imageVO.setImage_file_name(imageFiles.get(i).getOriginalFilename());
							imageVO.setImage_file(resizing(imageFiles.get(i).getBytes(), 600));

							// ���Ե� �ڷḦ mapper.image.insertImage �� ����
							String imageName = imageService.addImageFile(imageVO);

							System.out.printf("baroip : [%s] ��ǰ�� [%s] �̹��� ������ [%s] �̹����� �����Ǿ����ϴ�.%n", match_id,
									imageCategory + (i + 1), imageName);

						}
						// body �̹����� ������� ��� ���
						else {
							System.out.printf("baroip : [%s] ��ǰ [%s] ī�װ��� ���� ����� �̹����� �����ϴ�.%n", match_id,
									imageCategory);
						}
					}
				}

			}
			// �ٸ� ī�װ� notice, cs, main, sub 1~3�� ��� ������Ʈ ����
			else {

				// imageFile ��ü�� file��ü�� ��ü ������ ����
				MultipartFile imageFile = multipartRequest.getFile(imageCategory);
				if (imageFile != null) {
					if (imageFile.getOriginalFilename() != null && imageFile.getOriginalFilename() != "") {
						imageVO.setImage_match_id(match_id);
						imageVO.setImage_category(imageCategory);
						imageVO.setImage_file_name(imageFile.getOriginalFilename());
						imageVO.setImage_file(resizing(imageFile.getBytes(), 600));
						String imageName = imageService.updateImageFile(imageVO);

						System.out.printf("baroip : [%s] ��ǰ�� [%s] �̹��� ������ [%s] �̹����� �����Ǿ����ϴ�.%n", match_id,
								imageCategory, imageName);
					}
					// �ش� ī�װ��� ���������� ���
					else {
						System.out.printf("baroip : [%s] ��ǰ [%s] ī�װ��� ���� ����� �̹����� �����ϴ�.%n", match_id, imageCategory);
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
