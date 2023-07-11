package com.fpl.sof2031.controllers;

import com.fpl.sof2031.entities.Users;
import com.fpl.sof2031.repositories.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class AuthController {
    @Autowired
    private UsersRepository usersRepository;
    @GetMapping("/login")
    public String showLoginForm(Model model){
        model.addAttribute("users", new Users());
        return "login";
    }
    @PostMapping("/login")
    public String loginForm(Model model,
                            @Valid @ModelAttribute("users") Users user,
                            BindingResult result,
                            HttpSession session
                            ){
        if(result.hasErrors()){
            System.out.println(result.getAllErrors());
            return "login";
        }
        Users users = this.usersRepository.findByUsernameAndPassword(user.getUsername(), user.getPassword());
        if(users==null){
            model.addAttribute("mess", "Sai tài khoản hoặc mật khẩu");
            return "login";
        }
        if(users.getRole()==2){
            session.setAttribute("users", users);
            return "redirect:/home";
        }else{
            if(users.getAvailable()==0){
                model.addAttribute("mess", "Tài khoản không còn hoạt động");
                return "login";
            }
            session.setAttribute("users", users);
            return "redirect:/admin/dashboard";
        }

    }

    @GetMapping("/sign-up")
    public String showSignUpForm(Model model){
        model.addAttribute("users", new Users());
        return "signup";
    }

    @PostMapping("/sign-up")
    public String saveForm(Model model,
                           @Valid @ModelAttribute("users") Users users,
                           BindingResult result,
                           RedirectAttributes attributes
                           ){
        if(result.hasErrors()){
            return "signup";
        }
        Users user = this.usersRepository.findByUsernameAndDeleted(users.getUsername(), 0);
        if(user == null){
            Integer deleted = 0;
            users.setDeleted(deleted);
            users.setRole(2);
            users.setAvailable(1);
            this.usersRepository.save(users);
            attributes.addFlashAttribute("mess", "Create successfully! Sign in to continue");
            return "redirect:/login";
        }else{
            model.addAttribute("err_ma", "Mã đã tồn tại");
            return "signup";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/login";
    }
}
