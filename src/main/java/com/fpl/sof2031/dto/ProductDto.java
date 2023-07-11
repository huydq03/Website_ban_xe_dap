package com.fpl.sof2031.dto;

import com.fpl.sof2031.entities.Category;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDto {
    private Integer id;
    private String code;
    private String name;
    private Integer quantity;
    private Double priceSale;
    private Double priceImport;
    private Integer avaliable;
    private String image;
    private String descriptions;
    private Timestamp createDate;
    private Integer deleted;
    private Category category;
}
