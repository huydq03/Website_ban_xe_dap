package com.fpl.sof2031.controllers.user;

import com.fpl.sof2031.entities.Category;
import com.fpl.sof2031.entities.Product;
import com.fpl.sof2031.repositories.CategoryRepository;
import com.fpl.sof2031.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class HomeController {
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private ProductRepository productRepository;

    @GetMapping("/home")
    public String showHome(){
        return "home";
    }

    @GetMapping("/product/list")
    public String showProduct(Model model,
                              @RequestParam(name = "pageNum", defaultValue = "1") Integer pageNum,
                              @RequestParam(name = "pageSize", defaultValue = "6") Integer pageSize
    ){
//        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize);
        Pageable pageable = PageRequest.of(pageNum-1, pageSize);
        Page<Product> page = productRepository.findAllByDeleted(pageable,0);
        List<Category> list = this.categoryRepository.findByDeleted(0);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("totalPage", page.getTotalPages());
        model.addAttribute("listPro", page.getContent());
        model.addAttribute("list", list);
        return "product";
    }

    @GetMapping("/category/{id}")
    public String showProductByCategory(Model model,
                              @RequestParam(name = "pageNum", defaultValue = "1") Integer pageNum,
                              @RequestParam(name = "pageSize", defaultValue = "6") Integer pageSize,
                                        @PathVariable("id") Category cate
    ){


//        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize);
        Pageable pageable = PageRequest.of(pageNum-1, pageSize);
        Page<Product> page = this.productRepository.findByCategoryAndDeleted(pageable, cate, 0);
        List<Category> list = this.categoryRepository.findByDeleted(0);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("id", cate.getId());
        model.addAttribute("totalPage", page.getTotalPages());
        model.addAttribute("listPro", page.getContent());
        model.addAttribute("list", list);
        return "productByCategory";
    }

    @GetMapping("/product/detail/{id}")
    public String showDetai(Model model,
                            @PathVariable("id") Integer id
    ){
        Product product = this.productRepository.findByIdAndDeleted(id, 0);
        model.addAttribute("product", product);
        Pageable pageable = PageRequest.of(0, 3);
        Page<Product> page = productRepository.findAllByDeleted(pageable,0);
        List<Category> list = this.categoryRepository.findByDeleted(0);
        model.addAttribute("listPro", page.getContent());
        return "detailProduct";
    }
}
