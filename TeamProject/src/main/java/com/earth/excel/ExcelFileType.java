package com.earth.excel;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class ExcelFileType {
    public static Workbook getWorkbook(String filepath) {
        FileInputStream fis = null;
        try {
            fis = new FileInputStream(filepath);
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }
        Workbook wb = null;

        if (filepath.toUpperCase().endsWith(".XLS")) {
            try {
                wb = new HSSFWorkbook(fis);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else if (filepath.toUpperCase().endsWith(".XLSX")) {
            try {
                wb = new XSSFWorkbook(fis);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        return wb;
    }
}
