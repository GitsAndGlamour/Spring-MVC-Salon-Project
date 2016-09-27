package com.salon.domain;

import java.util.UUID;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.cloud.cloudfoundry.com.fasterxml.jackson.annotation.JsonProperty;

@Entity
public final class Customer {

	@Id
	private volatile String customer_id = UUID.randomUUID().toString();
	private volatile String first;
	private volatile String last;
	private volatile String email;
	private volatile String address;
	private volatile String city;
	private volatile String state;
	private volatile String postal;
	private volatile String phone;
	private volatile String alt_phone;
	private volatile String notes;
	private volatile String preferred_staff;
	private volatile String discount_type;
	private volatile String referral_source;
	private volatile String create_admin;
	private volatile String update_admin;
	private volatile String create_ts;
	private volatile String update_ts;
	private volatile String is_active;

	Customer() {
	}
	
	public Customer(@JsonProperty("customer_id") String customer_id,
			@JsonProperty("first") String first,
			@JsonProperty("last") String last,
			@JsonProperty("email") String email,
			@JsonProperty("address") String address,
			@JsonProperty("city") String city,
			@JsonProperty("state") String state,
			@JsonProperty("postal") String postal,
			@JsonProperty("phone") String phone,
			@JsonProperty("alt_phone") String alt_phone,
			@JsonProperty("notes") String notes,
			@JsonProperty("preferred_staff") String preferred_staff,
			@JsonProperty("discount_type") String discount_type,
			@JsonProperty("referral_source") String referral_source,
			@JsonProperty("create_admin") String create_admin,
			@JsonProperty("update_admin") String update_admin,
			@JsonProperty("create_ts") String create_ts,
			@JsonProperty("update_ts") String update_ts,
			@JsonProperty("is_admin") String is_active) {
		this.customer_id = customer_id;
		this.first = first;
		this.last = last;
		this.email = email;
		this.address = address;
		this.city = city;
		this.state = state;
		this.postal = postal;
		this.phone = phone;
		this.alt_phone = alt_phone;
		this.notes = notes;
		this.preferred_staff = preferred_staff;
		this.discount_type = discount_type;
		this.referral_source = referral_source;
		this.create_admin = create_admin;
		this.update_admin = update_admin;
		this.create_ts = create_ts;
		this.update_ts = update_ts;
		
	}
	
	@JsonProperty("customer_id") 
	public String getCustomer_id() {
		return customer_id;
	}

	@JsonProperty("first")  
	public String getFirst() {
		return first;
	}

	@JsonProperty("last") 
	public String getLast() {
		return last;
	}

	@JsonProperty("email") 
	public String getEmail() {
		return email;
	}

	@JsonProperty("address") 
	public String getAddress() {
		return address;
	}

	@JsonProperty("city") 
	public String getCity() {
		return city;
	}

	@JsonProperty("state") 
	public String getState() {
		return state;
	}

	@JsonProperty("postal") 
	public String getPostal() {
		return postal;
	}
	
	@JsonProperty("phone") 
	public String getPhone() {
		return phone;
	}

	@JsonProperty("alt_phone") 
	public String getAlt_phone() {
		return alt_phone;
	}

	@JsonProperty("notes") 
	public String getNotes() {
		return notes;
	}

	@JsonProperty("preferred_staff") 
	public String getPreferred_staff() {
		return preferred_staff;
	}

	@JsonProperty("discount_type") 
	public String getDiscount_type() {
		return discount_type;
	}

	@JsonProperty("referral_source") 
	public String getReferral_source() {
		return referral_source;
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

	@JsonProperty("is_active") 
	public String getIs_active() {
		return is_active;
	}
}
