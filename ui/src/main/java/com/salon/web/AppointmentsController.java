package com.salon.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.salon.domain.Appointment;
import com.salon.repositories.AppointmentRepository;

public class AppointmentsController {

	private final AppointmentRepository appointmentRepository;
	
	@Autowired
    AppointmentsController(AppointmentRepository appointmentRepository) {
        this.appointmentRepository = appointmentRepository;
    }
	
	 @RequestMapping(method = RequestMethod.GET, value = "/appointment/{appointment_id}")
	    ResponseEntity<Appointment> findByAppointmentId(@PathVariable String appointment_id) {
	        Appointment appointment = appointmentRepository.findByAppointment_id(appointment_id);

	        if (appointment == null) {
	            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	        } else {
	            return new ResponseEntity<>(appointment, HttpStatus.OK);
	        }
	    }
	 
	 @RequestMapping(method = RequestMethod.GET, value = "/appointment/service/{service_id}")
	    ResponseEntity<List<Appointment>> findByServiceId(@PathVariable String service_id) {
	        List<Appointment> appointments = appointmentRepository.findByService_id(service_id);

	        if (appointments == null) {
	            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	        } else {
	            return new ResponseEntity<>(appointments, HttpStatus.OK);
	        }
	    }

	 @RequestMapping(method = RequestMethod.GET, value = "/appointment/staff/{staff_id}")
	    ResponseEntity<List<Appointment>> findByStaffId(@PathVariable String staff_id) {
	        List<Appointment> appointments = appointmentRepository.findByStaff_id(staff_id);

	        if (appointments == null) {
	            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	        } else {
	            return new ResponseEntity<>(appointments, HttpStatus.OK);
	        }
	    }
	 
	 @RequestMapping(method = RequestMethod.GET, value = "/appointment/schedule/{scheduled_at}")
	    ResponseEntity<List<Appointment>> findByScheduledAt(@PathVariable String scheduled_at) {
	        List<Appointment> appointments = appointmentRepository.findByScheduled_at(scheduled_at);

	        if (appointments == null) {
	            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	        } else {
	            return new ResponseEntity<>(appointments, HttpStatus.OK);
	        }
	    }
	 
	 @RequestMapping(method = RequestMethod.GET, value = "/appointment/customer/{customer_id}")
	    ResponseEntity<List<Appointment>> findByCustomerId(@PathVariable String customer_id) {
	        List<Appointment> appointments = appointmentRepository.findByCustomer_id(customer_id);

	        if (appointments == null) {
	            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	        } else {
	            return new ResponseEntity<>(appointments, HttpStatus.OK);
	        }
	    }
	 
	 @RequestMapping(method = RequestMethod.GET, value = "/appointment/promotion/{promotion_id}")
	    ResponseEntity<List<Appointment>> findByCustomerId(@PathVariable String customer_id) {
	        List<Appointment> appointments = appointmentRepository.findByCustomer_id(customer_id);

	        if (appointments == null) {
	            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	        } else {
	            return new ResponseEntity<>(appointments, HttpStatus.OK);
	        }
	    }
}
