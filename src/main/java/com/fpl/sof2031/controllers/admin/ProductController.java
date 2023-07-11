package com.fpl.sof2031.controllers.admin;

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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/admin/product")
public class ProductController {

    @Autowired
    ServletContext context;
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private ProductRepository productRepository;

    @GetMapping("/list")
    public String showButton(Model model,
                             @RequestParam(name = "pageNum", defaultValue = "1") Integer pageNum,
                             @RequestParam(name = "pageSize", defaultValue = "6") Integer pageSize){
//        List<Product> list = this.productRepository.findByDeletedOderByDesc(0);
        Pageable pageable = PageRequest.of(pageNum-1, pageSize);
        Page<Product> page = productRepository.findByDeletedOderByDesc(pageable,0);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("totalPage", page.getTotalPages());
        model.addAttribute("ds", page.getContent());
        return "productList";
    }

    @GetMapping("/create")
    public String showCreatForm(Model model){
        List<Category> list = this.categoryRepository.findByDeleted(0);
        Product product = new Product();
        model.addAttribute("category", new Category());
        model.addAttribute("product", product);
        model.addAttribute("dsdm", list);
        return "productCreate";
    }

    @PostMapping("/create")
    public String saveForm(Model model,
                           @Valid @ModelAttribute("product") Product product,
                           BindingResult result,
                           RedirectAttributes attributes,
                           @RequestParam("imagePro") MultipartFile fileName
    ){

        if(result.hasErrors()){
            System.out.println(result.getAllErrors());
            System.out.println("Lỗi");
            List<Category> list = this.categoryRepository.findByDeleted(0);
            model.addAttribute("dsdm", list);
            return "productCreate";
        }
        Product pro = this.productRepository.findByCodeAndDeleted(product.getCode(), 0);
        if(pro == null){
            String fileOriginal = fileName.getOriginalFilename();
            String fileDest = context.getRealPath("/upload/" +  fileOriginal);
            System.out.println("str"+fileDest);

            try {
                fileName.transferTo(new File(fileDest));
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }

            product.setImage(fileOriginal);

            Integer deleted = 0;
            product.setCreateDate(null);
            product.setDeleted(deleted);
            this.productRepository.save(product);
            attributes.addFlashAttribute("messs", "Add suscess");
            return "redirect:/admin/product/list";
        }else{
            List<Category> list = this.categoryRepository.findByDeleted(0);
            model.addAttribute("dsdm", list);
            model.addAttribute("err_ma", "Mã đã tồn tại");
            return "productCreate";
        }

    }
    @GetMapping("/edit/{id}")
    public String showEditForm(Model model,
                               @PathVariable Integer id){
        List<Category> list = this.categoryRepository.findByDeleted(0);
        Product product = this.productRepository.findByIdAndDeleted(id, 0);
        model.addAttribute("category", new Category());
        model.addAttribute("product", product);
        model.addAttribute("dsdm", list);
        return "productEdit";
    }
    @PostMapping("/edit/{id}")
    public String editForm(Model model,
                           @PathVariable Integer id,
                           @Valid @ModelAttribute("product") Product product,
                           BindingResult result,
                           RedirectAttributes attributes,
                           @RequestParam("imagePro") MultipartFile fileName
    ){
//        String fileName = file.getOriginalFilename();
        if(result.hasErrors()){
            Product productOlder = this.productRepository.findById(id).orElse(null);
            model.addAttribute("product", productOlder);
            return "productList";
        }
        String fileOriginal = fileName.getOriginalFilename();
        String fileDest = context.getRealPath("/upload/" +  fileOriginal);
        System.out.println("str"+fileDest);

        try {
            fileName.transferTo(new File(fileDest));
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        product.setImage(fileOriginal);
        product.setDeleted(0);
//        product.setImage(fileName);
        this.productRepository.save(product);
        attributes.addFlashAttribute("mess", "Cập nhật thành công");
        return "redirect:/admin/product/list";
    }

    @GetMapping("/delete/{id}")
    public String deleteForm(Model model,
                           @PathVariable Integer id,
                           RedirectAttributes attributes
    ){
        Product product = this.productRepository.findById(id).orElse(null);
        product.setDeleted(1);
        this.productRepository.save(product);
        attributes.addFlashAttribute("mess", "Cập nhật thành công");
        return "redirect:/admin/product/list";
    }
}
