package com.earth.controller;

import com.earth.upload.S3Upload;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequiredArgsConstructor
public class FileUploadController {
    @Autowired
    private S3Upload s3Upload;

    @ResponseBody
    @PostMapping("/upload")
    public String uploadFile(@RequestParam("images") MultipartFile multipartFile, HttpServletRequest request) {

        return
    }

}
