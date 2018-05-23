package edu.iot.butter.service;

import java.io.File;
import java.util.List;

import org.apache.tika.Tika;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.iot.butter.dao.ImageDao;
import edu.iot.butter.model.Image;
import edu.iot.butter.model.Pagination;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;

@Service
public class ImageServiceImpl implements ImageService {
	
	@Autowired
	ImageDao dao;
	
	@Override
	public Pagination getPagination(int page) throws Exception {
		//이미지 총갯수 가져오기.
		int total = dao.getCount();
		Pagination pagination = new Pagination(page, total, 12);
		return pagination;
	}

	@Override
	public List<Image> getList(Pagination pagination) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectList(pagination);
	}

	@Override
	public Image getImage(int id) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectOne(id);
	}

	@Override
	public boolean upload(Image image, List<MultipartFile> fileList)  {
		try {
		for(MultipartFile file : fileList) {
			if(!file.isEmpty()) {
				//업로드 파일 저장, thumbnail 생성, Image정보 설정
				saveImage(image, file);
				System.out.println(image);
				//데이터 베이스 저장
				dao.insert(image);
			}				
		}
		}catch(Exception e){
			e.printStackTrace();
		}		
		return true;
	}
	
	//
	public void saveImage(Image image, MultipartFile file) throws Exception{
		//원본 파일명
		String fileName = file.getOriginalFilename();
		String newName = saveImage(fileName, file);
		String thumbName = saveThumb(newName);
		
		Tika tika = new Tika();
		String mimeType = tika.detect(fileName);
		
		image.setFileName(fileName);
		image.setMimeType(mimeType);
		image.setFileSize(file.getSize());
		image.setNewName(newName);
		image.setThumbNail(thumbName);
	}
	
	
	public String saveImage(String fname, MultipartFile file) throws Exception{
		//타임스탬프 지정, 이명령이 실행된 시각 (1977년 부터 얼마나 지났는지가 기준)
		long fileNo = System.currentTimeMillis();
		String newName = fileNo + "_" + fname;
		String path = IMAGE_DIR + "/" + newName;
		
		//업로드된 파일명 재지정
		file.transferTo(new File(path));
		return newName;
	}
	
	public String saveThumb(String fname) throws Exception{
		String thumbName = "thumbnail-" + fname;		
		//thumbnail 파일 생성
		Thumbnails
			.of(new File(IMAGE_DIR + "/" + fname))
			.crop(Positions.CENTER) //이미지 crop
			.size(200, 200)
			.toFile(new File(THUMB_DIR + "/" + thumbName));
		return thumbName;
	}	
}
