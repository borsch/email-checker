package com.borsch.controller.rest;

import com.borsch.utils.EmailChecker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Oleh on 05.07.2017.
 */
@Controller
@RequestMapping("/api/email_check")
public class EmailCheckerApi {

    @Autowired
    private EmailChecker emailChecker;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public @ResponseBody boolean checkEmail(
            @RequestParam("email") String email
    ) {
        return emailChecker.isAddressValid(email);
    }

}
