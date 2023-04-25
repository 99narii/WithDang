package com.earth.excel;


import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.util.CellReference;

//cell 추출
public class ExcelCellRef {
    /*
    cell에 해당하는 column name 을 가져온다
    cell이 null이라면 int cellindex의 값으로 column name을 가져온다

     */
    public static String getName(Cell cell, int cellIndex) {
        int cellNum = 0;
        if (cell != null) {
            cellNum = cell.getColumnIndex();
        } else {
            cellNum = cellIndex;
        }
        return CellReference.convertNumToColString(cellNum);
    }

    @SuppressWarnings("deprecation")//경고 제외용
    public static String getValue(Cell cell) {
        String value = "";
        if (cell != null) {
            if (cell.getCellType() == Cell.CELL_TYPE_FORMULA) {
                value = cell.getCellFormula();
            } else if (cell.getCellType() == Cell.CELL_TYPE_BLANK) {
                value = "";
            } else if (cell.getCellType() == Cell.CELL_TYPE_BOOLEAN) {
                value = cell.getBooleanCellValue()+"";
            } else if (cell.getCellType() == Cell.CELL_TYPE_ERROR) {
                value = cell.getErrorCellValue()+"";
            } else if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
                value = cell.getStringCellValue();
            } else if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                value = cell.getNumericCellValue()+"";
            }else {
                value = cell.getStringCellValue();
            }
        }


        return value;
    }
}
