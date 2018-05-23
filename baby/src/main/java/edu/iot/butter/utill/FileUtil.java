package edu.iot.butter.utill;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

public class FileUtil {
	public static void copy(String path, HttpServletResponse response) {
		try(
				//파일 읽어오기
				InputStream in = new BufferedInputStream(new FileInputStream(path));
				//
				OutputStream out = new BufferedOutputStream(response.getOutputStream());
			){
				int data;
				//inputstream에서 읽어서 outputstream으로 출력
				while((data = in.read())!=-1) {
					out.write(data);
				}
				out.flush();
			}catch(Exception e){
				e.printStackTrace();
			}
	}
}
