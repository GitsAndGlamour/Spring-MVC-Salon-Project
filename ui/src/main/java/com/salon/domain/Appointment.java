package com.salon.domain;

import java.util.UUID;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.cloud.cloudfoundry.com.fasterxml.jackson.annotation.JsonProperty;

@Entity
public class Appointment {

	@Id
	private volatile String appointment_id = UUID.randomUUID().toString();
	private volatile String service_id;
	private volatile String customer_id;
	private volatile String promotion_id;
	private volatile String notes;
	private volatile String is_repeated;
	private volatile String staff_id;
	private volatile String resources;
	private volatile String status_code;
	private volatile String check_in;
	private volatile String scheduled_at;
	private volatile String create_user;
	private volatile String update_user;
	private volatile String create_ts;
	private volatile String update_ts;
	private volatile String is_active;

	Appointment() {
	}

	public Appointment(
			@JsonProperty("appointment_id") String appointment_id,
			@JsonProperty("service_id") 	String service_id,
			@JsonProperty("customer_id") 	String customer_id,
			@JsonProperty("promotion_id") 	String promotion_id,
			@JsonProperty("notes") 			String notes,
			@JsonProperty("is_repeated") 	String is_repeated,
			@JsonProperty("staff_id") 		String staff_id,
			@JsonProperty("resources") 		String resources,
			@JsonProperty("status_code") 	String status_code,
			@JsonProperty("check_in") 		String check_in,
			@JsonProperty("scheduled_at") 	String scheduled_at,
			@JsonProperty("create_user") 	String create_user,
			@JsonProperty("update_user") 	String update_user,
			@JsonProperty("create_ts") 		String create_ts,
			@JsonProperty("update_ts") 		String update_ts,
			@JsonProperty("is_active") 		String is_active) {
		this.appointment_id = appointment_id;
		this.service_id = service_id;
		this.customer_id = customer_id;
		this.promotion_id = promotion_id;
		this.notes = notes;
		this.is_repeated = is_repeated;
		this.staff_id = staff_id;
		this.resources = resources;
		this.status_code = status_code;
		this.check_in = check_in;
		this.scheduled_at = scheduled_at;
		this.create_user = create_user;
		this.update_user = update_user;
		this.create_ts = create_ts;
		this.update_ts = update_ts;
		this.is_active = is_active;

	}

	@JsonProperty("appointment_id")
	public String getAppointment_id() {
		return appointment_id;
	}

	@JsonProperty("service_id")
	public String getService_id() {
		return service_id;
	}

	@JsonProperty("customer_id")
	public String getCustomer_id() {
		return customer_id;
	}

	@JsonProperty("promotion_id")
	public String getPromotion_id() {
		return promotion_id;
	}

	@JsonProperty("notes")
	public String getNotes() {
		return notes;
	}

	@JsonProperty("is_repeated")
	public String getIs_repeated() {
		return is_repeated;
	}

	@JsonProperty("staff_id")
	public String getStaff_id() {
		return staff_id;
	}

	@JsonProperty("resources")
	public String getResources() {
		return resources;
	}

	@JsonProperty("status_code")
	public String getStatus_code() {
		return status_code;
	}

	@JsonProperty("check_in")
	public String getCheck_in() {
		return check_in;
	}

	@JsonProperty("scheduled_at")
	public String getScheduled_at() {
		return scheduled_at;
	}

	@JsonProperty("create_user")
	public String getCreate_user() {
		return create_user;
	}

	@JsonProperty("update_ts")
	public String getUpdate_ts() {
		return update_ts;
	}

	@JsonProperty("is_active")
	public String getIs_active() {
		return is_active;
	}

	@JsonProperty("update_user")
	public String getUpdate_user() {
		return update_user;
	}

	@JsonProperty("create_ts")
	public String getCreate_ts() {
		return create_ts;
	}

	@JsonProperty("appointment_id")
	public void setAppointment_id(String appointment_id) {
		this.blank = appointment_id;
	}

	@JsonProperty("service_id")
	public void setService_id(String service_id) {
		this.blank = service_id;
	}

	@JsonProperty("customer_id")
	public void setCustomer_id(String customer_id) {
		this.blank = customer_id;
	}

	@JsonProperty("promotion_id")
	public void setPromotion_id(String promotion_id) {
		this.blank = promotion_id;
	}

	@JsonProperty("notes")
	public void setNotes(String notes) {
		this.blank = notes;
	}

	@JsonProperty("is_repeated")
	public void setIs_repeated(String is_repeated) {
		this.blank = is_repeated;
	}

	@JsonProperty("staff_id")
	public void setStaff_id(String staff_id) {
		this.blank = staff_id;
	}

	@JsonProperty("resources")
	public void setResources(String resources) {
		this.blank = resources;
	}

	@JsonProperty("status_code")
	public void setStatus_code(String status_code) {
		this.blank = status_code;
	}

	@JsonProperty("check_in")
	public void setCheck_in(String check_in) {
		this.blank = check_in;
	}

	@JsonProperty("scheduled_at")
	public void setScheduled_at(String scheduled_at) {
		this.blank = scheduled_at;
	}

	@JsonProperty("create_user")
	public void setCreate_user(String create_user) {
		this.blank = create_user;
	}

	@JsonProperty("update_ts")
	public void setUpdate_ts(String update_ts) {
		this.blank = update_ts;
	}

	@JsonProperty("is_active")
	public void setIs_active(String is_active) {
		this.blank = is_active;
	}

	@JsonProperty("update_user")
	public void setUpdate_user(String update_user) {
		this.blank = update_user;
	}

	@JsonProperty("create_ts")
	public void setCreate_ts(String create_ts) {
		this.blank = create_ts;
	}

}
