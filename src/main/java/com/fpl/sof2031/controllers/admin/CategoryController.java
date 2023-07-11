package com.fpl.sof2031.controllers.admin;

import com.fpl.sof2031.entities.Category;
import com.fpl.sof2031.repositories.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;


@Controller
@RequestMapping("/admin/category")
public class CategoryController {
    @Autowired
    private CategoryRepository categoryRepository;


    @GetMapping("/list")
    public String showCards(Model model,
                            @RequestParam(name = "pageNum", defaultValue = "1") Integer pageNum,
                            @RequestParam(name = "pageSize", defaultValue = "6") Integer pageSize){
        Pageable pageable = PageRequest.of(pageNum-1, pageSize);
        model.addAttribute("pageNum", pageNum);
        Page<Category> list = this.categoryRepository.findByDeletedOrderByDesc(pageable,0);
        model.addAttribute("totalPage", list.getTotalPages());
        model.addAttribute("list", list.getContent());
        return "categoryList";
    }
    @GetMapping("/create")
    public String showCreateForm(Model model){
        Category category = new Category();
        model.addAttribute("category", category);
        return "categoryCreate";
    }
    @PostMapping("/create")
    public String saveForm(Model model,
                           @Valid @ModelAttribute("category") Category category,
                           BindingResult result,
                           RedirectAttributes attributes
                           ){
        if(result.hasErrors()){
            return "categoryCreate";
        }
        Category ct = this.categoryRepository.findByMaAndDeleted(category.getMa(), 0);
        if(ct == null){
            Integer deleted = 0;
            category.setDeleted(deleted);
            this.categoryRepository.save(category);
            attributes.addFlashAttribute("messs", "Add suscess");
            return "redirect:/admin/category/list";
        }else{
            model.addAttribute("err_ma", "Mã đã tồn tại");
            return "categoryCreate";
        }

    }
    @GetMapping("/edit/{id}")
    public String showEditForm(Model model,
                @PathVariable Integer id
    ){
        Category category = this.categoryRepository.findById(id).orElse(null);
        model.addAttribute("category", category);
        return "categoryEdit";
    }
//    edit
    @PostMapping("/edit/{id}")
    public String editForm(Model model,
                               @PathVariable Integer id,
                           @Valid @ModelAttribute("category") Category category,
                           BindingResult result,
                           RedirectAttributes attributes
    ){
        System.out.println(id);
        System.out.println(category.getId());
        if(result.hasErrors()){
            Category categoryOlder = this.categoryRepository.findById(id).orElse(null);
            model.addAttribute("category", categoryOlder);
            return "categoryList";
        }
        category.setDeleted(0);
        this.categoryRepository.save(category);
        attributes.addFlashAttribute("mess", "Cập nhật thành công");
        return "redirect:/admin/category/list";
    }
    @GetMapping("/delete/{id}")
    public String deleteForm(Model model,
                           @PathVariable Integer id,
                           RedirectAttributes attributes
    ){
        Category category = this.categoryRepository.findById(id).orElse(null);
        category.setDeleted(1);
        this.categoryRepository.save(category);
        attributes.addFlashAttribute("mess", "Cập nhật thành công");
        return "redirect:/admin/category/list";
    }
}

