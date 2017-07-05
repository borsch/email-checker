package com.borsch.controller;

import com.borsch.utils.EmailChecker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by oleh_kurpiak on 04.06.16.
 */
@Controller
public class IndexController {

    @Autowired
    private EmailChecker emailChecker;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String indexGet(){
        return "main/index";
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    public String indexPost(
            @RequestParam("email") String email,
            Model model
    ){
        model.addAttribute("email", email);
        model.addAttribute("valid", emailChecker.isAddressValid(email));

        return "main/index";
    }
}
