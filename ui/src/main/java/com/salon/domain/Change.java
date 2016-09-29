package com.salon.domain;

import java.util.UUID;

import javax.persistence.Entity;

import org.springframework.cloud.cloudfoundry.com.fasterxml.jackson.annotation.JsonProperty;
import org.springframework.data.annotation.Id;

@Entity
public class Change {
	
	@Id
	private volatile String change_id = UUID.randomUUID().toString();
	private volatile String name;
	private volatile String table_name;
	private volatile String column_name;
	private volatile String previous_value;
	private volatile String current_value;
	private volatile String change_ts;
	private volatile String is_undone;
	private volatile String create_admin;
	private volatile String update_admin;
	private volatile String create_ts;
	private volatile String update_ts;
	private volatile String is_active;
	
	Change(){
	}
	public Change(	@JsonProperty("change_id") String change_id,
					@JsonProperty("name") String name,
					@JsonProperty("table_name") String table_name,
					@JsonProperty("column_name") String column_name,
					@JsonProperty("previous_value") String previous_value,
					@JsonProperty("current_value") String current_value,
					@JsonProperty("change_ts") String change_ts,
					@JsonProperty("is_undone") String is_undone, 
					@JsonProperty("create_admin") String create_admin,
					@JsonProperty("update_admin") String update_admin,
					@JsonProperty("create_ts") String create_ts,
					@JsonProperty("update_ts") String update_ts,
					@JsonProperty("is_active") String is_active) {
		
		this.change_id = change_id;
		this.setName(name);
		this.setTable_name(table_name);
		this.setColumn_name(column_name); 
		this.setPrevious_value(previous_value);
		this.setCurrent_value(current_value);
		this.setChange_ts(change_ts);
		this.setIs_undone(is_undone);
		this.setCreate_admin(create_admin);
		this.setUpdate_admin(update_admin);
		this.setCreate_ts(create_ts);
		this.setUpdate_ts(update_ts);
		this.setIs_active(is_active);
		
	}
	
	@JsonProperty("name")
	public String getName() {
		return name;
	}
	
	@JsonProperty("name")
	public void setName(String name) {
		this.name = name;
	}
	
	@JsonProperty("table_name")
	public String getTable_name() {
		return table_name;
	}
	
	@JsonProperty("table_name")
	public void setTable_name(String table_name) {
		this.table_name = table_name;
	}
	
	@JsonProperty("table_name")
	public String getColumn_name() {
		return column_name;
	}
	
	@JsonProperty("column_name")
	public void setColumn_name(String column_name) {
		this.column_name = column_name;
	}
	
	@JsonProperty("previous_value")
	public String getPrevious_value() {
		return previous_value;
	}
	
	@JsonProperty("previous_value")
	public void setPrevious_value(String previous_value) {
		this.previous_value = previous_value;
	}
	
	@JsonProperty("current_value")
	public String getCurrent_value() {
		return current_value;
	}
	
	@JsonProperty("current_value")
	public void setCurrent_value(String current_value) {
		this.current_value = current_value;
	}
	
	@JsonProperty("change_ts")
	public String getChange_ts() {
		return change_ts;
	}
	
	@JsonProperty("change_ts")
	public void setChange_ts(String change_ts) {
		this.change_ts = change_ts;
	}
	
	@JsonProperty("is_undone")
	public String getIs_undone() {
		return is_undone;
	}
	
	@JsonProperty("is_undone")
	public void setIs_undone(String is_undone) {
		this.is_undone = is_undone;
	}
	
	@JsonProperty("create_admin")
	public String getCreate_admin() {
		return create_admin;
	}
	
	@JsonProperty("create_admin")
	public void setCreate_admin(String create_admin) {
		this.create_admin = create_admin;
	}
	
	@JsonProperty("update_admin")
	public String getUpdate_admin() {
		return update_admin;
	}
	
	@JsonProperty("update_admin")
	public void setUpdate_admin(String update_admin) {
		this.update_admin = update_admin;
	}
	
	@JsonProperty("create_ts")
	public String getCreate_ts() {
		return create_ts;
	}
	
	@JsonProperty("create_ts")
	public void setCreate_ts(String create_ts) {
		this.create_ts = create_ts;
	}
	
	@JsonProperty("update_ts")
	public String getUpdate_ts() {
		return update_ts;
	}
	
	@JsonProperty("update_ts")
	public void setUpdate_ts(String update_ts) {
		this.update_ts = update_ts;
	}
	
	@JsonProperty("is_active")
	public String getIs_active() {
		return is_active;
	}
	
	@JsonProperty("is_active")
	public void setIs_active(String is_active) {
		this.is_active = is_active;
	}
	
	
	
}
