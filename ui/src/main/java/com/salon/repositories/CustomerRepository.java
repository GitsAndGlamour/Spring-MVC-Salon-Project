package com.salon.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.salon.domain.Customer;

public interface CustomerRepository extends JpaRepository<Customer, String>{
	Customer findByCustomer_idOrEmailOrPhone(String customer_id, String email, String phone);
	List<Customer> findByFirstOrLast(String first, String last);
	List<Customer> findByCity(String city);
	List<Customer> findByPreferredStaff(String staff_id);
	List<Customer> findAll();
	
}
