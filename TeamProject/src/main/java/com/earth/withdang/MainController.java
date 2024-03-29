package com.earth.withdang;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

    @RequestMapping(value = {"/main", "/"}, method = RequestMethod.GET)
    public String mainPageGET() {
        return "main";
    }


    @GetMapping("/check")
    public String healthCheck() {
        return "check";
    }
}
