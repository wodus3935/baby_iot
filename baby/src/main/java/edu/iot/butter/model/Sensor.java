package edu.iot.butter.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Sensor {
	//온도센서냐 습도센서냐 등
	private long id;
	private String type;
	private String name;
	private int pinNumber;
	private double value;
	private Date time;
	
	public Sensor(String type, String name, int pinNumber) {
		super();
		this.type = type;
		this.name = name;
		this.pinNumber = pinNumber;
	}

	public Sensor(String type, String name, int pinNumber, double value, Date time) {
		super();
		this.type = type;
		this.name = name;
		this.pinNumber = pinNumber;
		this.value = value;
		this.time = time;
	}

	
}
