package com.project.fruitfruit.alarm;

import java.sql.Date;

public class Alarm {

	private int alarm_num;
	private int alarm_product_num;
	private int alarm_support_num;
	private int alarm_user_id;
	private String alarm_string_type;
	private String alarm_url;
	private int alarm_help_num;
	private int alarm_quntity;
	private Date alram_add_date;
	private boolean alarm_read;
	
	public Alarm() {
		super();
	}

	public Alarm(int alarm_num, int alarm__product_num, int alarm_support_num, int alarm_user_id,
			String alarm_string_type, String alarm_url, int alarm_help_num, int alarm_quntity, Date alram_add_date,
			boolean alarm_read) {
		super();
		this.alarm_num = alarm_num;
		this.alarm_product_num = alarm__product_num;
		this.alarm_support_num = alarm_support_num;
		this.alarm_user_id = alarm_user_id;
		this.alarm_string_type = alarm_string_type;
		this.alarm_url = alarm_url;
		this.alarm_help_num = alarm_help_num;
		this.alarm_quntity = alarm_quntity;
		this.alram_add_date = alram_add_date;
		this.alarm_read = alarm_read;
	}

	public int getAlarm_num() {
		return alarm_num;
	}

	public void setAlarm_num(int alarm_num) {
		this.alarm_num = alarm_num;
	}

	public int getAlarm__product_num() {
		return alarm_product_num;
	}

	public void setAlarm__product_num(int alarm__product_num) {
		this.alarm_product_num = alarm__product_num;
	}

	public int getAlarm_support_num() {
		return alarm_support_num;
	}

	public void setAlarm_support_num(int alarm_support_num) {
		this.alarm_support_num = alarm_support_num;
	}

	public int getAlarm_user_id() {
		return alarm_user_id;
	}

	public void setAlarm_user_id(int alarm_user_id) {
		this.alarm_user_id = alarm_user_id;
	}

	public String getAlarm_string_type() {
		return alarm_string_type;
	}

	public void setAlarm_string_type(String alarm_string_type) {
		this.alarm_string_type = alarm_string_type;
	}

	public String getAlarm_url() {
		return alarm_url;
	}

	public void setAlarm_url(String alarm_url) {
		this.alarm_url = alarm_url;
	}

	public int getAlarm_help_num() {
		return alarm_help_num;
	}

	public void setAlarm_help_num(int alarm_help_num) {
		this.alarm_help_num = alarm_help_num;
	}

	public int getAlarm_quntity() {
		return alarm_quntity;
	}

	public void setAlarm_quntity(int alarm_quntity) {
		this.alarm_quntity = alarm_quntity;
	}

	public Date getAlram_add_date() {
		return alram_add_date;
	}

	public void setAlram_add_date(Date alram_add_date) {
		this.alram_add_date = alram_add_date;
	}

	public boolean isAlarm_read() {
		return alarm_read;
	}

	public void setAlarm_read(boolean alarm_read) {
		this.alarm_read = alarm_read;
	}

	@Override
	public String toString() {
		return "Alarm [alarm_num=" + alarm_num + ", alarm__product_num=" + alarm_product_num + ", alarm_support_num="
				+ alarm_support_num + ", alarm_user_id=" + alarm_user_id + ", alarm_string_type=" + alarm_string_type
				+ ", alarm_url=" + alarm_url + ", alarm_help_num=" + alarm_help_num + ", alarm_quntity=" + alarm_quntity
				+ ", alram_add_date=" + alram_add_date + ", alarm_read=" + alarm_read + "]";
	}

}
