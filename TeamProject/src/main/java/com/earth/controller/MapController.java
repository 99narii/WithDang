package com.earth.controller;

import com.earth.mapper.MapMapper;
import com.earth.model.Coordinate;
import com.earth.model.MapVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class MapController {
    @Autowired
    MapMapper mapper;
//js 에서 받은 형식에 따라 다른 list 반환?
    @ResponseBody
    @RequestMapping(value = "/getMapPin" ,method = RequestMethod.POST,consumes = "application/json")
    public List<MapVo> mappinMapping(@RequestBody Coordinate coor) {
        System.out.println(coor.getLatitude());
        System.out.println(coor.getPin());

//근처만 불러오기위한 공식
        List<MapVo> list = mapper.selectPin("'"+coor.getPin()+"'");
//string엔 0~48
        double distance;
        double radius=6371; //지구 반지름
        double toRadian=Math.PI/180;
        double clat = coor.getLatitude();
        double clng = coor.getLongitude();
        List<MapVo> pinList=new ArrayList<>();
        for (int i = 0; i <list.size() ; i++) {
            double locationlat = list.get(i).getLatitude(); //db의 좌표
            double locationlng = list.get(i).getLongitude(); //db좌표
            double deltaLatitude = Math.abs(clat - locationlat) * toRadian;
            double deltaLongitude = Math.abs(clng - locationlng) * toRadian;

            double sinDeltaLat = Math.sin(deltaLatitude / 2);
            double sinDeltaLng = Math.sin(deltaLongitude / 2);
            double squareRoot = Math.sqrt(
                    sinDeltaLat * sinDeltaLng + Math.cos(clat * toRadian) * Math.cos(locationlat * toRadian) * sinDeltaLng * sinDeltaLng
            );
            distance = 2 * radius * Math.asin(squareRoot);
            if (distance < 10) {
                pinList.add(list.get(i));
                System.out.println(list.get(i));
            }
        }
        //ground,training,hospital,beauty,trail, kindergarten
        return pinList;

    }
}
