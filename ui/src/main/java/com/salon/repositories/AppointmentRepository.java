package com.salon.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.salon.domain.Appointment;

public interface AppointmentRepository extends JpaRepository<Appointment, String> {
	Appointment findByAppointment_id(String appointment_id);
	List<Appointment> findByService_id(String service_id);
	List<Appointment> findByStaff_id(String staff_id);
	List<Appointment> findByScheduled_at(String scheduled_at);
	List<Appointment> findByCustomer_id(String customer_id);
	List<Appointment> findByPromotion_id(String promotion_id);
	List<Appointment> findByIs_repeated(String is_repeated);
	List<Appointment> findAll();
}
