package com.fpl.sof2031.repositories;

import com.fpl.sof2031.dto.ProductDto;
import com.fpl.sof2031.entities.Category;
import com.fpl.sof2031.entities.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {

    List<Product> findByDeleted(int i);

    Product findByCodeAndDeleted(String code, int i);

    Product findByIdAndDeleted(Integer id, int i);

    Page<Product> findAll(Pageable pageable);

    Page<Product> findAllByDeleted(Pageable pageable, int i);

    Page<Product> findByCategoryAndDeleted(Pageable pageable, Category idDM, int i);
    @Query("select p from Product p where p.deleted = ?1 order by p.createDate desc")
    Page<Product> findByDeletedOderByDesc(Pageable pageable, int i);


}
