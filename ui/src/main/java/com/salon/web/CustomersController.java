package com.salon.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.salon.domain.Customer;
import com.salon.repositories.CustomerRepository;

public class CustomersController {

  final CustomerRepository customerRepository;

  @Autowired
  CustomersController(CustomerRepository customerRepository) {
    this.customerRepository = customerRepository;
  }

  @RequestMapping(method = RequestMethod.GET, value = "/customer/{customer_id}")
     ResponseEntity<Customer> findByCustomerId(@PathVariable String customer_id) {
         Customer customer = customerRepository.findByCustomer_id(customer_id);

         if (customer == null) {
             return new ResponseEntity<>(HttpStatus.NOT_FOUND);
         } else {
             return new ResponseEntity<>(customer, HttpStatus.OK);
         }
     }

  @RequestMapping(method = RequestMethod.GET, value = "/customer/email/{email}")
  ResponseEntity<Customer> findByEmail(@PathVariable String email) {
      Customer customer = customerRepository.findByCustomer_id(email);

      if (customer == null) {
          return new ResponseEntity<>(HttpStatus.NOT_FOUND);
      } else {
          return new ResponseEntity<>(customer, HttpStatus.OK);
      }
  }

  @RequestMapping(method = RequestMethod.GET, value = "/customer/phone/{phone}")
  ResponseEntity<Customer> findByPhone(@PathVariable String phone) {
      Customer customer = customerRepository.findByCustomer_id(phone);

      if (customer == null) {
          return new ResponseEntity<>(HttpStatus.NOT_FOUND);
      } else {
          return new ResponseEntity<>(customer, HttpStatus.OK);
      }
  }

  @RequestMapping(method = RequestMethod.GET, value = "/customer/first/{first}/last/{last}")
  ResponseEntity<List<Customer>> findByFirstOrLast(@PathVariable String first, @PathVariable String last) {
      List<Customer> customers = customerRepository.findByFirstOrLast(first, last);

      if (customers == null) {
          return new ResponseEntity<>(HttpStatus.NOT_FOUND);
      } else {
          return new ResponseEntity<>(customers, HttpStatus.OK);
      }
  }

  @RequestMapping(method = RequestMethod.GET, value = "/customer/city/{city}")
  ResponseEntity<List<Customer>> findByCity(@PathVariable String city) {
      List<Customer> customers = customerRepository.findByCity(city);

      if (customers == null) {
          return new ResponseEntity<>(HttpStatus.NOT_FOUND);
      } else {
          return new ResponseEntity<>(customers, HttpStatus.OK);
      }
  }

  @RequestMapping(method = RequestMethod.GET, value = "/customer/staff/{staff_id}")
  ResponseEntity<List<Customer>> findByPreferredStaff(@PathVariable String preferred_staff) {
      List<Customer> customers = customerRepository.findByPreferred_Staff(preferred_staff);

      if (customers == null) {
          return new ResponseEntity<>(HttpStatus.NOT_FOUND);
      } else {
          return new ResponseEntity<>(customers, HttpStatus.OK);
      }
  }

  @RequestMapping(method = RequestMethod.GET, value = "/customer")
  ResponseEntity<List<Customer>> findAll() {
      List<Customer> customers = customerRepository.findAll();

      if (customers == null) {
          return new ResponseEntity<>(HttpStatus.NOT_FOUND);
      } else {
          return new ResponseEntity<>(customers, HttpStatus.OK);
      }
  }
}
