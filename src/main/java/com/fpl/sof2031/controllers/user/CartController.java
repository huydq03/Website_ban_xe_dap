package com.fpl.sof2031.controllers.user;

import com.fpl.sof2031.dto.ProductDto;
import com.fpl.sof2031.entities.Product;
import com.fpl.sof2031.entities.ShoppingCart;
import com.fpl.sof2031.entities.Users;
import com.fpl.sof2031.repositories.ProductRepository;
import com.fpl.sof2031.repositories.ShoppingCartRepository;
import com.fpl.sof2031.repositories.UsersRepository;
import com.fpl.sof2031.services.ShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.Objects;

@Controller
@RequestMapping("/cart")
@Transactional
public class CartController {
    @Autowired
    ProductRepository productRepository;
    @Autowired
    UsersRepository usersRepository;
    @Autowired
    ShoppingCartService shoppingCartService;
    @Autowired
    ShoppingCartRepository shoppingCartRepository;

    @GetMapping("/index")
    public String index(HttpSession session, Model model) {

        if (session.getAttribute("users") == null) {
            return "redirect:/login";
        }
        Users users = (Users) session.getAttribute("users");
        Users customer = usersRepository.findByUsername(users.getUsername());
        ShoppingCart cart = customer.getCart();
        if (cart == null) {
            model.addAttribute("check");
            usersRepository.deleteById(users.getId());
        }
        if (Objects.nonNull(cart)) {
            model.addAttribute("grandTotal", cart.getTotalPrice());
            model.addAttribute("totalItem", cart.getCartItems().size());
        }
        model.addAttribute("shoppingCart", cart);
        return "cart.index";
    }

    @GetMapping("/buy/{id}")
    public String buy(@PathVariable("id") Integer id, HttpSession session, Model model) {
        if (session.getAttribute("users") == null) {
            return "redirect:/login";
        }
//        Product product = this.productRepository.findById(id).orElse(null);
        ProductDto product = this.getById(id);
        Users users = (Users) session.getAttribute("users");

        System.out.println(users.getId());
        ShoppingCart shoppingCart = shoppingCartService.addItemToCart(product, 1, users.getUsername());
        model.addAttribute("shoppingCart", shoppingCart);
        return "redirect:/cart/index";
    }

    public ProductDto getById(Integer id) {
        ProductDto productDto = new ProductDto();
        Product product = productRepository.findById(id).orElse(null);
        productDto.setId(product.getId());
        productDto.setName(product.getName());
        productDto.setQuantity(product.getQuantity());
        productDto.setPriceImport(product.getPriceImport());
        productDto.setPriceSale(product.getPriceSale());
        productDto.setAvaliable(product.getAvaliable());
        productDto.setCategory(product.getCategory());
        productDto.setImage(product.getImage());
        productDto.setDescriptions(product.getDescriptions());
        return productDto;
    }

    @GetMapping("/remove/{id}")
    public String remove(@PathVariable("id") Integer id, HttpSession session, Model model) {
        if (session.getAttribute("users") == null) {
            return "redirect:/login";
        }
        ProductDto productDto = this.getById(id);
        Users customer = (Users) session.getAttribute("users");
        ShoppingCart shoppingCart = shoppingCartService.removeItemFromCart(productDto, customer.getUsername());
        model.addAttribute("shoppingCart", shoppingCart);
        return "redirect:/cart/index";
    }

    @PostMapping("/update/{id}")
    public String update(@RequestParam("quantities") int quantities, HttpSession session, @PathVariable("id") int id, Model model) {
        if (session.getAttribute("users") == null) {
            return "redirect:/login";
        }
        ProductDto productDto = this.getById(id);
        Users customer = (Users) session.getAttribute("users");
        ShoppingCart shoppingCart = shoppingCartService.updateCart(productDto, quantities, customer.getUsername());
        model.addAttribute("shoppingCart", shoppingCart);
        return "redirect:/cart/index";
    }


//    @GetMapping("/index")
//    public String index(HttpSession session, Model model){
//        int countItems = 0;
//        double total = 0;
//        if(session.getAttribute("cart") != null){
//            List<Item> cart = (List<Item>) session.getAttribute("cart");
//            countItems = cart.size();
//            for (Item item : cart){
//                total += item.getQuantity() * item.getProduct().getPriceSale();
//            }
//        }
//        model.addAttribute("cọuntItems", countItems);
//        model.addAttribute("total", total);
//        return "cart.index";
//    }
//    @GetMapping("/buy/{id}")
//    public String buy(@PathVariable("id") Integer id, HttpSession session){
//        if(session.getAttribute("cart")  ==null){
//            List<Item> cart = new ArrayList<>();
//            cart.add(new Item(productRepository.findById(id).get(), 1));
//            session.setAttribute("cart", cart);
//        }else{
//            List<Item> cart = (List<Item>) session.getAttribute("cart");
//            int index = exist(id, cart);
//            if(index == -1){
//                cart.add(new Item(productRepository.findById(id).get(), 1));
//            }else{
//                int newQuantity = cart.get(index).getQuantity()+1;
//                cart.get(index).setQuantity(newQuantity);
//            }
//            session.setAttribute("cart", cart);
//        }
//        return "redirect:/cart/index";
//    }
//    @GetMapping("/remove/{index}")
//    public String remove(@PathVariable("index") int index, HttpSession session){
//        List<Item> cart = (List<Item>) session.getAttribute("cart");
//        cart.remove(index-1);
//        return "redirect:/cart/index";
//    }
//    @PostMapping("/update/{index}")
//    public String update(@RequestParam("quantities") int quantities, HttpSession session, @PathVariable("index") int index){
//        if(session.getAttribute("cart")  !=null){
//            List<Item> cart = (List<Item>) session.getAttribute("cart");
//           cart.get(index-1).setQuantity(quantities);
//            session.setAttribute("cart", cart);
//        }
//        return "redirect:/cart/index";
//    }
//
//    private int exist(int id, List<Item> cart){
//        for (int i=0; i<cart.size(); i++){
//            if(cart.get(i).getProduct().getId() == id){
//                return i;
//            }
//        }
//        return -1;
//    }
}
