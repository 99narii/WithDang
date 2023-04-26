package com.earth.excel;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ExcelRead {
    public static List<Map<String,String>> read(ExcelReadOption excelReadOption){

        //엑셀 파일을 읽기
        Workbook wb = ExcelFileType.getWorkbook(excelReadOption.getFilePath());

        //첫 시트 가져오기
        Sheet sheet = wb.getSheetAt(0);
        System.out.println("sheet name:"+ wb.getSheetName(0));
        System.out.println("number of sheet:" + wb.getNumberOfSheets());


        int numOfRows = sheet.getPhysicalNumberOfRows();
        int numOfCells = 0;
        Row row = null;
        Cell cell = null;

        String cellName = "";
        //각 row마다 값을 저장할 맵 객체. 저장은 put("a", "name");
        Map<String, String> map = null;
        //각 row를 리스트에 담는다. 하나의 row는 하나의 map
        List<Map<String, String>> result = new ArrayList<>();


        //row만큼 반복
        for (int rowIndex = excelReadOption.getStartRow()-1; rowIndex < numOfRows; rowIndex++) {
            row = sheet.getRow(rowIndex);

            if (row != null) {
                numOfCells = row.getPhysicalNumberOfCells();
                map = new HashMap<>();
                //cell 수 만큼 반복
                for (int cellIndex = 0; cellIndex < numOfCells; cellIndex++) {
                    cell = row.getCell(cellIndex);
                    cellName = ExcelCellRef.getName(cell, cellIndex);
                    //추출대상 컬럼 확인
                    //여기서 다 걸러짐
//                    if (!excelReadOption.getOutputColumns().contains(cellName)) {
//                        continue;
//                    }
                    map.put(cellName, ExcelCellRef.getValue(cell));
                }
                result.add(map);
            }
        }
        return result;
    }
}
