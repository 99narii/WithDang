package com.earth.controller;

import com.earth.mapper.MapMapper;
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

    @ResponseBody
    @RequestMapping(value = "/getMapPin" ,method = RequestMethod.POST,consumes = "application/json")
    public List<MapVo> mappinMapping(@RequestBody MapVo mapVo) {
//근처만 불러오기위한 하버사인 공식
        List<MapVo> list = mapper.selectPin(mapVo.getType());

        double distance;
        double radius=6371; //지구 반지름
        double toRadian=Math.PI/180;
        //현재 위치
        double clat = mapVo.getLatitude();
        double clng = mapVo.getLongitude();
        //근처 핀만 저장될 리스트
        List<MapVo> pinList=new ArrayList<>();
        for (int i = 0; i <list.size() ; i++) {
            double locationlat = list.get(i).getLatitude(); //db의 좌표
            double locationlng = list.get(i).getLongitude(); //db좌표
            double deltaLatitude = Math.abs(clat - locationlat) * toRadian;
            double deltaLongitude = Math.abs(clng - locationlng) * toRadian;

            double sinDeltaLat = Math.sin(deltaLatitude / 2);
            double sinDeltaLng = Math.sin(deltaLongitude / 2);
            double squareRoot = Math.sqrt(
                    sinDeltaLat * sinDeltaLat + Math.cos(clat * toRadian) * Math.cos(locationlat * toRadian) * sinDeltaLng * sinDeltaLng
            );
            distance = 2 * radius * Math.asin(squareRoot);
            if (mapVo.getType().equals("beauty")) {
                if (distance < 1) {
                    pinList.add(list.get(i));
                    System.out.println(list.get(i));
                }
            } else if (mapVo.getType().equals("hospital")) {
                if (distance < 1) {
                    pinList.add(list.get(i));
                    System.out.println(list.get(i));
                }
            } else if (mapVo.getType().equals("kinder")) {
                if (distance < 3) {
                    pinList.add(list.get(i));
                    System.out.println(list.get(i));
                }
            }else {
                if (distance < 10) {
                    pinList.add(list.get(i));
                    System.out.println(list.get(i));
                }
            }


        }
        //ground,training,hospital,beauty,trail, kindergarten
        return pinList;

//        return list;
    }
}
