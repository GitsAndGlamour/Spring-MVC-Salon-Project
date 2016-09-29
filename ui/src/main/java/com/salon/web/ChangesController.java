package com.salon.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.salon.domain.Change;
import com.salon.repositories.ChangeRepository;

public class ChangesController {

  private final ChangeRepository changeRepository;

  @Autowired
  ChangesController(ChangeRepository changeRepository) {
    this.changeRepository = changeRepository;
  }

  @RequestMapping(method = RequestMethod.GET, value = "/change/{change_id}")
  ResponseEntity<Change> findByChangeId(@PathVariable String change_id) {
      Change change = changeRepository.findByChange_id(change_id);

      if (change == null) {
          return new ResponseEntity<>(HttpStatus.NOT_FOUND);
      } else {
          return new ResponseEntity<>(change, HttpStatus.OK);
      }
  }
  
  @RequestMapping(method = RequestMethod.GET, value = "/change/name/{name}")
  ResponseEntity<Change> findByName(@PathVariable String name) {
      Change change = changeRepository.findByName(name);

      if (change == null) {
          return new ResponseEntity<>(HttpStatus.NOT_FOUND);
      } else {
          return new ResponseEntity<>(change, HttpStatus.OK);
      }
  }
  
  @RequestMapping(method = RequestMethod.GET, value = "/change/table/{table_name}")
  ResponseEntity<List<Change>> findByTableName(@PathVariable String table_name) {
      List<Change> changes = changeRepository.findByTable_name(table_name);

      if (changes == null) {
          return new ResponseEntity<>(HttpStatus.NOT_FOUND);
      } else {
          return new ResponseEntity<>(changes, HttpStatus.OK);
      }
  }
  
  @RequestMapping(method = RequestMethod.GET, value = "/change/value/{value}")
  ResponseEntity<List<Change>> findByValue(@PathVariable String value) {
      List<Change> changes = changeRepository.findByValue(value);

      if (changes == null) {
          return new ResponseEntity<>(HttpStatus.NOT_FOUND);
      } else {
          return new ResponseEntity<>(changes, HttpStatus.OK);
      }
  }


}
