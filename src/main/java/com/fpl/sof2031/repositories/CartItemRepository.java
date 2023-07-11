package com.fpl.sof2031.repositories;

import com.fpl.sof2031.entities.CartItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CartItemRepository extends JpaRepository<CartItem, Long> {
    @Modifying
    @Query("delete from CartItem c where c.product.id = ?1 and c.cart.id = ?2")
    void deleteByProduct(Integer i, Long i1);
}
