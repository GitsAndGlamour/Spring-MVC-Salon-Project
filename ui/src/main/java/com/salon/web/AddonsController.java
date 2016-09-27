package com.salon.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.salon.domain.Addon;
import com.salon.repositories.AddonRepository;

@RestController
final class AddonsController {

    private final AddonRepository addonRepository;

    @Autowired
    AddonsController(AddonRepository addonRepository) {
        this.addonRepository = addonRepository;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/addon/{addon_id}")
    ResponseEntity<Addon> findAddonById(@PathVariable String addon_id) {
        Addon addon = addonRepository.findByAddon_id(addon_id);

        if (addon == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        } else {
            return new ResponseEntity<>(addon, HttpStatus.OK);
        }
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/addon/name/{name}")
    ResponseEntity<Addon> findAddonByName(@PathVariable String name) {
        Addon addon = addonRepository.findByName(name);

        if (addon == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        } else {
            return new ResponseEntity<>(addon, HttpStatus.OK);
        }
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/addon")
    ResponseEntity<List<Addon>> findAllAddons() {
        List<Addon> addons = addonRepository.findAll();

        if (addons.size() == 0) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        } else {
            return new ResponseEntity<>(addons, HttpStatus.OK);
        }
    }
    
    
}