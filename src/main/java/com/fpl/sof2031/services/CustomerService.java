package com.fpl.sof2031.services;

import com.fpl.sof2031.entities.Users;

public interface CustomerService {
    Users findByUsername(String username);
}
