package com.earth.controller;

import com.earth.mapper.MapMapper;
import com.earth.model.MapVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

@Controller
public class MapController {
    @Autowired
    MapMapper mapper;
//js 에서 받은 형식에 따라 다른 list 반환?
    @ResponseBody
    @RequestMapping(value = "/getMapPin" ,method = RequestMethod.POST)
    public List<HashMap<String,Object>> mappinMapping(@RequestParam(name = "name") String pin) {
        System.out.println("ss");
        List<HashMap<String, Object>> hashMaps = mapper.selectPin("'"+pin+"'");


        //ground,training,hospital,beauty,trail, kindergarten
        return hashMaps;
    }
    



    /*
    1. 맵 리스트를 다 불러오기
    2. 맵 핀별로 불러오기
     */
}
