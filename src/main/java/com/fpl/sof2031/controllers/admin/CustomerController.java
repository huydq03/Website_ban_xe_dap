package com.fpl.sof2031.controllers.admin;

import com.fpl.sof2031.entities.Users;
import com.fpl.sof2031.repositories.UsersRepository;
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
@RequestMapping("/admin/customer")
public class CustomerController {
    @Autowired
    private UsersRepository usersRepository;
    @GetMapping("/list")
    public String showCards(Model  model,
                            @RequestParam(name = "pageNum", defaultValue = "1") Integer pageNum,
                            @RequestParam(name = "pageSize", defaultValue = "6") Integer pageSize
                            ){
        Pageable pageable = PageRequest.of(pageNum-1, pageSize);
        model.addAttribute("pageNum", pageNum);
        Page<Users> list2 = this.usersRepository.findByRoleOrRoleAndOrderByPage(pageable, 2,2, 0);
        model.addAttribute("totalPage", list2.getTotalPages());
        model.addAttribute("listnvien", list2.getContent());
        return "userList";
    }
    @GetMapping("/create")
    public String showCreateForm(Model model){
        model.addAttribute("users", new Users());
        return "userCreate";
    }
    @PostMapping("/create")
    public String saveForm(Model model,
                           @Valid @ModelAttribute("users") Users users,
                           BindingResult result,
                           RedirectAttributes attributes){
        if(result.hasErrors()){
            return "userCreate";
        }
        Users user = this.usersRepository.findByUsernameAndDeleted(users.getUsername(), 0);
        if(user == null){
            Integer deleted = 0;
            users.setDeleted(deleted);
            users.setRole(2);
            this.usersRepository.save(users);
            attributes.addFlashAttribute("messs", "Add suscess");
            return "redirect:/admin/customer/list";
        }else{
            model.addAttribute("err_ma", "Mã đã tồn tại");
            return "userCreate";
        }
    }
    @GetMapping("/delete/{id}")
    public String deleteForm(Model model,
                             @PathVariable Integer id,
                             RedirectAttributes attributes
    ){
        Users users = this.usersRepository.findById(id).orElse(null);
        users.setDeleted(1);
        this.usersRepository.delete(users);
        attributes.addFlashAttribute("mess", "Xóa thành công");
        return "redirect:/admin/customer/list";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(Model model,
                               @PathVariable Integer id
    ){
        Users users = this.usersRepository.findById(id).orElse(null);
        model.addAttribute("users", users);
        return "userEdit";
    }

    @PostMapping("/edit/{id}")
    public String editForm(Model model,
                           @PathVariable Integer id,
                           @Valid @ModelAttribute("users") Users users,
                           BindingResult result,
                           RedirectAttributes attributes
    ){

        if(result.hasErrors()){
            return "userList";
        }
        users.setDeleted(0);
        users.setRole(2);
        this.usersRepository.save(users);
        attributes.addFlashAttribute("mess", "Cập nhật thành công");
        return "redirect:/admin/customer/list";
    }
}
