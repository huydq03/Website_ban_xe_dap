package com.fpl.sof2031.repositories;

import com.fpl.sof2031.entities.Users;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UsersRepository extends JpaRepository<Users, Integer> {
    Users findByUsernameAndPassword(String username, String password);

    List<Users> findByRoleOrRole(int i, int i1);

    List<Users> findByRole(int i);

    Users findByUsernameAndDeleted(String username, int i);

    List<Users> findByRoleAndDeleted(int i, int i1);

    @Query("select u from Users u where u.role in (?1, ?2) and u.deleted = ?3 order by u.createDate desc")
    List<Users> findByRoleOrRoleAndOrderBy(int i, int i1, int i3);

    @Query("select u from Users u where u.role in (?1, ?2) and u.deleted = ?3 order by u.createDate desc")
    Page<Users> findByRoleOrRoleAndOrderByPage(Pageable page, int i, int i1, int i3);

    Users findByUsername(String username);
}
