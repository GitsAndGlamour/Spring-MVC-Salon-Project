package com.salon.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.salon.domain.Change;

public interface ChangeRepository extends JpaRepository<Change, String> {

  Change findByChange_id(String change_id);
  Change findByName(String name);
  List<Change> findByTable_name(String table_name);
  List<Change> findByValue(String value);
  List<Change> findByAdmin(String staff_id);

}
