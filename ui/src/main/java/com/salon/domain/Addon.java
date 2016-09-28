package com.salon.domain;

import java.util.UUID;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.cloud.cloudfoundry.com.fasterxml.jackson.annotation.JsonProperty;

@Entity
public class Addon {

	@Id
	private volatile String addon_id = UUID.randomUUID().toString();
	private volatile String name;
	private volatile String timeblock;
	private volatile String create_admin;
	private volatile String update_admin;
	private volatile String create_ts;
	private volatile String update_ts;

	Addon() {
	}
	public Addon(
			@JsonProperty("addon_id")     String addon_id,
			@JsonProperty("name") 		  String name,
			@JsonProperty("timeblock")    String timeblock,
			@JsonProperty("create_admin") String create_admin,
			@JsonProperty("update_admin") String update_admin,
			@JsonProperty("create_ts") 	  String create_ts,
			@JsonProperty("update_ts")    String update_ts) {
		this.addon_id 	  = addon_id;
		this.name 		  = name;
		this.timeblock 	  = timeblock;
		this.create_admin = create_admin;
		this.update_admin = update_admin;
		this.create_ts    = create_ts;
		this.update_ts    = update_ts;
	}

	@JsonProperty("addon_id")
	public String getAddon_id() {
		return addon_id;
	}

	@JsonProperty("name")
	public String getName() {
		return name;
	}

	@JsonProperty("timeblock")
	public String getTimeblock() {
		return timeblock;
	}

	@JsonProperty("create_admin")
	public String getCreate_admin() {
		return create_admin;
	}

	@JsonProperty("update_admin")
	public String getUpdate_admin() {
		return update_admin;
	}

	@JsonProperty("create_ts")
	public String getCreate_ts() {
		return create_ts;
	}

	@JsonProperty("update_ts")
	public String getUpdate_ts() {
		return update_ts;
	}

	@JsonProperty("addon_id")
	public void setAddon_id(String addon_id) {
		this.addon_id = addon_id;
	}

	@JsonProperty("name")
	public void setName(String name) {
		this.name = name;
	}

	@JsonProperty("timeblock")
	public void setTimeblock(String timeblock) {
		this.timeblock = timeblock;
	}

	@JsonProperty("create_admin")
	public void setCreate_admin(String create_admin) {
		this.create_admin = create_admin;
	}

	@JsonProperty("update_admin")
	public void setUpdate_admin(String update_admin) {
		this.update_admin = update_admin;
	}

	@JsonProperty("create_ts")
	public void setCreate_ts(String create_ts) {
		this.create_ts = create_ts;
	}

	@JsonProperty("update_ts")
	public void setUpdate_ts(String update_ts) {
		this.update_ts = update_ts;
	}

}
