package com.fpl.sof2031.services;

import com.fpl.sof2031.dto.ProductDto;
import com.fpl.sof2031.entities.ShoppingCart;


public interface ShoppingCartService {
    ShoppingCart addItemToCart(ProductDto productDto, int quantity, String username);
    ShoppingCart updateCart(ProductDto productDto, int quantity, String username);

    ShoppingCart removeItemFromCart(ProductDto productDto, String username);

}
