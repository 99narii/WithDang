package com.earth.withdang;

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
public class ExcelUpload {
    @ResponseBody
    @RequestMapping(value = "/excelUploadAjax.do", method = RequestMethod.POST)
    public ModelAndView excelUploadAjax(MultipartFile file, MultipartHttpServletRequest request) {
        MultipartFile excelFile = request.getFile("excelFile");
        File destFile = new File("c:\\upload\\" + excelFile.getOriginalFilename());
        try {
            excelFile.transferTo(destFile);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }



    }


}
//https://eugene-kim.tistory.com/46
//https://daydreamer-92.tistory.com/42