package com.earth.excel.service;

import java.io.File;

public interface ExcelUpload {
    void excelUpload(File destfile);

    public void insertDB(File destFile);

    public void truncate();
}
