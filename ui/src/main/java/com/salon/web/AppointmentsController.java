package com.salon.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.salon.domain.Appointment;
import com.salon.repositories.AppointmentRepository;
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

}
