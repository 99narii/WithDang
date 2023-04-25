package com.earth.excel.service;

import com.earth.excel.ExcelRead;
import com.earth.excel.ExcelReadOption;
import com.earth.mapper.MapMapper;
import com.earth.model.MapVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
@Service
public class ExcelUploadImp implements ExcelUpload {
    @Autowired
    MapMapper mapper;


    @Override
    public void excelUpload(File destfile) {
        ExcelReadOption excelReadOption = new ExcelReadOption();
    }

    public void insertDB(File destFile) {

        ExcelReadOption readOption = new ExcelReadOption();
        readOption.setFilePath(destFile.getAbsolutePath());
        List<String> list = Arrays.asList("name", "latitude","longitude","type");
        readOption.setOutputColumns(list);
        readOption.setStartRow(0);

        List<Map<String, String>> excelContent = ExcelRead.read(readOption);
        List<MapVo> pinList = new ArrayList<>();

        for (Map<String, String> map : excelContent) {
            MapVo pin = new MapVo();
            pin.setName(map.get("name").toString());
            pin.setLatitude(Double.parseDouble(map.get("latitude")));
            pin.setLongitude(Double.parseDouble(map.get("longitude")));
            pin.setType(map.get("type"));
            pinList.add(pin);
        }
        for (MapVo mapVo : pinList) {
            mapper.insertPin(mapVo);
        }
    }
}
