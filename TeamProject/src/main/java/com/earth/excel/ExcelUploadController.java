package com.earth.excel;

import com.earth.excel.service.ExcelUpload;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;

@Controller
public class ExcelUploadController {
    @Autowired
    ExcelUpload excelUpload;

    @RequestMapping(value = "/excel/upload")
    public String excelUp() {
        return "upload";
    }


    @ResponseBody
    @RequestMapping(value = "/excelUploadAjax.do", method = RequestMethod.POST)
    public ModelAndView excelUploadAjax(MultipartFile file, MultipartHttpServletRequest request) {
        System.out.println("excelUpload");
        MultipartFile excelFile = request.getFile("excelFile");
        File destFile = new File("c:\\upload\\" + excelFile.getOriginalFilename());
        try {
            excelFile.transferTo(destFile);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        excelUpload.insertDB(destFile);
        destFile.delete();
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/excel/upload");
        return mav;

    }


}
//https://eugene-kim.tistory.com/46
//https://daydreamer-92.tistory.com/42