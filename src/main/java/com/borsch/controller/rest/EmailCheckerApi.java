package com.borsch.controller.rest;

import com.borsch.domain.enums.EmailExistsEnum;
import com.borsch.domain.request.EmailRequest;
import com.borsch.domain.views.EmailResult;
import com.borsch.utils.EmailChecker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Oleh on 05.07.2017.
 */
@Controller
@RequestMapping("/api/email_check")
public class EmailCheckerApi {

    @Autowired
    private EmailChecker emailChecker;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public @ResponseBody EmailExistsEnum checkEmail(
            @RequestParam("email") String email
    ) {
        return emailChecker.isAddressValid(email);
    }

    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public @ResponseBody List<EmailResult> checkEmailList(
            @RequestBody EmailRequest request,
            HttpServletResponse response
    ) {
        if (request.getEmails() == null || request.getEmails().isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);

            return null;
        }

        List<EmailResult> result = new ArrayList<>();
        for (String email : request.getEmails()) {
            result.add(new EmailResult(email, emailChecker.isAddressValid(email)));
        }
        return result;
    }

}
