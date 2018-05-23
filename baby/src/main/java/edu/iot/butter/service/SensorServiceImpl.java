package edu.iot.butter.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import edu.iot.butter.model.Sensor;

@Service
public class SensorServiceImpl implements SensorService {
	
	static List<Sensor> testList = new ArrayList<>();
	
	static {
		testList.add(new Sensor(1,"온도","temperature1",0,23.1,new Date()));
		testList.add(new Sensor(2,"온도","temperature1",0,23.2,new Date()));
		testList.add(new Sensor(3,"온도","temperature1",0,23.3,new Date()));
		testList.add(new Sensor(4,"온도","temperature1",0,23.4,new Date()));
		testList.add(new Sensor(5,"온도","temperature1",0,23.5,new Date()));
		testList.add(new Sensor(6,"온도","temperature1",0,23.6,new Date()));
		testList.add(new Sensor(7,"온도","temperature1",0,23.7,new Date()));
	}
	
	@Override
	public List<Sensor> getList() {
		System.out.println("GET : " + testList);
		return testList;
	}

	@Override
	public Sensor get(long id) {
		System.out.println("Get : " + id);
		return new Sensor("온도", "temperature1", 0, 23.1, new Date());
	}

	@Override
	public boolean insert(Sensor sensor) {
		System.out.println("INSERT : " + sensor);
		return true;
	}

	@Override
	public boolean update(Sensor sensor) {
		System.out.println("UPDATE : " + sensor);
		return true;
	}

	@Override
	public boolean delete(long id) {
		System.out.println("DELETE : " + id);
		return true;
	}
	
}
