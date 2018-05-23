package edu.iot.butter.service;

import com.google.gson.Gson;

import edu.iot.butter.model.Member;

public class GsonTest {
	public static void main(String[] args) {
		Member member = new Member();
		member.setUserId("hong");
		member.setPassword("1234");
		member.setName("홍구");
		
		Gson gson = new Gson();
		//제이슨 문자열로 바꿔조~~
		String json = gson.toJson(member);
		System.out.println(json);
	
		Member member2 = gson.fromJson(json, Member.class);
		System.out.println(member2);
	}
}
