package com.earth.withdang;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
    @RequestMapping("/dangguen")
    public String test() {
        return "dangguen";
    }

    @RequestMapping("/dangcare")
    public String test2() {
        return "dangcare";
    }

}
