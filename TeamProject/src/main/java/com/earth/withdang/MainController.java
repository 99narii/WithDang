package com.earth.withdang;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
    @GetMapping("/dangoffice")
    public String dangoffice() {
        return "/dangoffice";
    }

    @GetMapping("/dangcomu")
    public String dangcomu() {
        return "/dangcomu";
    }

    @GetMapping("/dangcare")
    public String dangcare() {
        return "/dangcare";
    }

    @GetMapping("/dangguen")
    public String dangguen() {
        return "/dangguen";
    }


}
