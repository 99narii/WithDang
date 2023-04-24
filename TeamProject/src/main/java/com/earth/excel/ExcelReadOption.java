package com.earth.excel;

import java.util.ArrayList;
import java.util.List;

public class ExcelReadOption {
    private String filePath;
    private List<String> outputColumns;
    //추출할 컬럼명
    private int startRow;
    //추출 시작할 행번호


    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public List<String> getOutputColumns() {
        List<String > temp =new ArrayList<String>();
        temp.addAll(outputColumns);
        return temp;
    }

    public void setOutputColumns(List<String> outputColumns) {
        this.outputColumns = outputColumns;
    }

    public int getStartRow() {
        return startRow;
    }

    public void setStartRow(int startRow) {
        this.startRow = startRow;
    }
}
