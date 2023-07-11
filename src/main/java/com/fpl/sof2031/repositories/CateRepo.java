package com.fpl.sof2031.repositories;

import com.fpl.sof2031.entities.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CateRepo extends JpaRepository<Category, Integer> {
}
