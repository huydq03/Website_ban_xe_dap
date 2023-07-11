package com.fpl.sof2031.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

@Getter
@Setter
@AllArgsConstructor
@Entity
public class Users implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @NotBlank(message = "Vui lòng nhập username")
    private String username;
    @Column(columnDefinition ="nvarchar(255)")
    private String fullname;
    @NotBlank(message = "Vui lòng nhâp password")
    private String password;
    private Integer gender;
    private String phone;
    private String email;
    @Column(columnDefinition ="nvarchar(255)")
    private String address;
    private Date dob;
    private Integer role;
    private Integer available;
    @Column(nullable = false, updatable = false)
    @CreationTimestamp
    private Timestamp createDate;
    private Integer deleted;
    @OneToOne(mappedBy = "customer", cascade = CascadeType.ALL)
    private ShoppingCart cart;
    public Users() {
        this.cart = new ShoppingCart();
    }

    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", address='" + address + '\'' +
                ", cart=" + cart.getId() +
                '}';
    }

}
