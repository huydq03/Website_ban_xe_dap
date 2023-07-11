package com.fpl.sof2031.services.impl;

import com.fpl.sof2031.entities.Users;
import com.fpl.sof2031.repositories.UsersRepository;
import com.fpl.sof2031.services.CustomerService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CustomerServiceImpl implements CustomerService {
    private final UsersRepository customerRepository;
    @Override
    public Users findByUsername(String username) {
        return customerRepository.findByUsername(username);
    }
}
