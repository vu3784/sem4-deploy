/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.sem4.controller;

import com.example.sem4.exception.ResourceNotFoundException;
import com.example.sem4.model.Role;
import com.example.sem4.model.User;
import com.example.sem4.repository.RoleRepository;
import com.example.sem4.repository.UserRepository;
import com.example.sem4.util.JwtUtil;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RoleController {

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private JwtUtil jwtUtil;

    @GetMapping("admin/roles")
    public String getAllRoles(ModelMap model, HttpServletRequest request) throws URISyntaxException {
        model.addAttribute("list", roleRepository.findAll());
        URI uri = new URI(request.getRequestURL().toString());
        String domain = uri.getAuthority();
        model.addAttribute("link", domain.startsWith("") ? "http://" + domain.substring(0) : domain);
        return "listusers";
    }

    @GetMapping("admin/roles/{id}")
    public ResponseEntity<Role> getRoleById(@PathVariable(name = "id") Long roleId) throws ResourceNotFoundException {
        Role role = roleRepository.findById(roleId).orElseThrow(() -> new ResourceNotFoundException("Can not found Role with a given id: " + roleId));
        return ResponseEntity.ok(role);
    }

    @PostMapping(value = "admin/roles/")
    public String addUser(ModelMap model, HttpServletRequest request, Role role) throws ResourceNotFoundException {

        try {
            roleRepository.save(role);
            model.addAttribute("list", roleRepository.findAll());
            URI uri = new URI(request.getRequestURL().toString());
            String domain = uri.getAuthority();
            model.addAttribute("link", domain.startsWith("") ? "http://" + domain.substring(0) : domain);
            model.addAttribute("msg", "add success");
            return "listusers";

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("msg", "add failed");
        return "listusers";
    }

    @PostMapping("admin/roles/update")
    public String updateRoleById(ModelMap model,@Valid Role role) throws ResourceNotFoundException {
        Role currentRole = roleRepository.findAll().contains(role);
        if (currentRole != null) {
            currentRole.setName(role.getName());
            model.addAttribute("msg", "update success");
            return "listusers";
        } else {
            model.addAttribute("msg", "update failed");
            return "listusers";
        }
    }

    @DeleteMapping("admin/roles/{id}")
    public Map<String, Boolean> deleteRole(@PathVariable(name = "id") Long roleId) throws ResourceNotFoundException {
        Role currentRole = roleRepository.findById(roleId).orElseThrow(() -> new ResourceNotFoundException("Can not found Role with a given id: " + roleId));
        Map<String, Boolean> response = new HashMap<>();
        for (User user : userRepository.findAll()) {
            if (user.getRoleId() == currentRole) {
                response.put("deleted", Boolean.FALSE);
                return response;
            }
        }
        roleRepository.delete(currentRole);
        response.put("deleted", Boolean.TRUE);
        return response;
    }
}
