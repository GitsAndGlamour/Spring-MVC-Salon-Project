package com.salon.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.salon.domain.Addon;

public interface AddonRepository extends JpaRepository<Addon, String>{
	Addon findByAddon_id(String addon_id);
	Addon findByName(String name);
	List<Addon> findAll();
	}
