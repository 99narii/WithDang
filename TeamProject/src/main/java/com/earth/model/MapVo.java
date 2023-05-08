package com.earth.model;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class MapVo {
    private String name;
    private double latitude;
    private double longitude;
    private String type;

}
