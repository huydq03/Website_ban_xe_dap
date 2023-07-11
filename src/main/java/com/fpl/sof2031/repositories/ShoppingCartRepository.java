package com.fpl.sof2031.repositories;

import com.fpl.sof2031.entities.ShoppingCart;
import com.fpl.sof2031.entities.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ShoppingCartRepository extends JpaRepository<ShoppingCart, Long> {
    ShoppingCart findByCustomer(Users customer);
}
