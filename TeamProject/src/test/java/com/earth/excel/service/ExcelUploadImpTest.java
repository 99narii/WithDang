package com.earth.excel.service;

import com.earth.mapper.MapMapper;
import com.earth.model.MapVo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ExcelUploadImpTest {
    @Autowired
    MapMapper mapper;
    @Test
    public void insertDB() {
        MapVo pin = new MapVo();
        pin.setName("dddd");
        pin.setLatitude(44.1234);
        pin.setLongitude(55.1234);
        pin.setType("a1");
        mapper.insertPin(pin);

    }
}