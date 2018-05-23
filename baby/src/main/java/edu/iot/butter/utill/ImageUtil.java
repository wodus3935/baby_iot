package edu.iot.butter.utill;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;

import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Position;
import net.coobird.thumbnailator.geometry.Positions;

public class ImageUtil {
	//디폴트 100x100크기로 만들기
	public static byte[] makeThumb(byte [] data) throws Exception {
		return makeThumb(data, 100, 100);
	}
	//width갑과 hight값을 추기
	public static byte[] makeThumb(byte [] data, int width, int height) throws Exception {
		try(
			ByteArrayInputStream in = new ByteArrayInputStream(data);
			ByteArrayOutputStream out = new ByteArrayOutputStream();
		){	
			//thumnails 만들어서 byte형식의 thumbnail이미지를 아웃으로  전달
			Thumbnails.of(in)
				.size(width, height)
				.crop(Positions.CENTER)
				.toOutputStream(out);
			
			//byte단위로 출력
			return out.toByteArray();
		}
	}
}
