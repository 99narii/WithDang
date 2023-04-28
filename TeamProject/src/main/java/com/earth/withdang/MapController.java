package com.earth.withdang;

import com.earth.mapper.MapMapper;
import com.earth.model.MapVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class MapController {
    @Autowired
    MapMapper mapper;
//js 에서 받은 형식에 따라 다른 list 반환?
    @ResponseBody
    @RequestMapping(value = "/getMapPinA1")
    public String a1() {
        List<MapVo> pinList= mapper.selectPin("'a1'");
        return "ok";
    }
}
