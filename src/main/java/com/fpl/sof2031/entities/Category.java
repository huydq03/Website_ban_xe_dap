package com.fpl.sof2031.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Category implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @NotBlank(message = "Vui lòng nhập mã danh mục")
    private String ma;
    @NotBlank(message = "Vui lòng nhập tên danh mục")
    @Column(columnDefinition ="nvarchar(255)")
    private String name;
    @Column(columnDefinition ="nvarchar(255)")
    private String descriptions;
    private Integer deleted;
    @Column(nullable = false, updatable = false)
    @CreationTimestamp
    private Timestamp createDate;
    @OneToMany(mappedBy = "category")
    private List<Product> list = new ArrayList<>();
}
