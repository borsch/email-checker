package com.borsch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by oleh_kurpiak on 04.06.16.
 */
@Controller
public class IndexContoller {

    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String index(){
        return "main/index";
    }

}
