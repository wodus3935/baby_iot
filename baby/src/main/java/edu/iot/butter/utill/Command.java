package edu.iot.butter.utill;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class Command {
	
	static class Model {
		
		Map<String, Constructor> converter = new HashMap<>();
		
		String getSetterName(String name) {
			String setter = "set" + name.replaceFirst("^.", 
					String.valueOf(
							Character.toUpperCase(name.charAt(0))));
			return setter;
		}
		
		Date convertDate(String value) throws ParseException {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			return sdf.parse(value);
		}
		
		Map<String, Method> makeMethodMap(Class cls) {
			Method[] methods = cls.getDeclaredMethods();
			Map<String, Method> map = new HashMap<>();
					
			for(Method m : methods) {
				map.put(m.getName(), m);
			}
			return map;
		}

		void setProperty(Object obj, Method setter, String value) throws Exception{
			String argType = setter.getParameterTypes()[0].getSimpleName();
			Object arg = null;
		
			switch(argType) {
			case "int" : arg = new Integer(value); break;
			case "double" : arg = new Double(value); break;
			case "String" : arg = value; break;
			case "Date" :  arg = convertDate(value); break;
			}
			if(arg != null)
				//호출한다.
				setter.invoke(obj, arg);
		}
	
	}
	
	//request와 변환하고자 하는 클래스의 정보
	public static Object parse(HttpServletRequest request, Class cls) {
		Model model = new Model();
		Object obj;
		
		Map<String, Method> setterMap = model.makeMethodMap(cls);
		//request에 담겨있는 name에 대한 정보를 어자
		Enumeration<String> keys = request.getParameterNames();
		
		try {
			//디폴트 생성자로 뉴 인스턴스하겠다!
			obj = cls.newInstance();
			//
			while(keys.hasMoreElements()) {
				String propName = keys.nextElement();
				String value = request.getParameter(propName);
				String setterName = model.getSetterName(propName);
				//실제 메서드를 얻는다?
				Method setter = setterMap.get(setterName);
				if(setter!=null)
					model.setProperty(obj, setter, value);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return obj;
	}
	
}
