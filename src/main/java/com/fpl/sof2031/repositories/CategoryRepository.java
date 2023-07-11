package com.fpl.sof2031.repositories;

import com.fpl.sof2031.entities.Category;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {
    List<Category> findByDeleted(int i);

    Category findByMa(String ma);

    Category findByMaAndDeleted(String ma, int i);
    @Query("select c from Category c where c.deleted = ?1 order by c.createDate desc")
    Page<Category> findByDeletedOrderByDesc(Pageable pageable, int i);
}
