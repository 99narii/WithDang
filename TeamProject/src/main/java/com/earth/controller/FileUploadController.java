package com.earth.controller;

import com.earth.upload.S3UploadService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class FileUploadController {
//    @Autowired
//    private S3UploadService s3UploadService;
//
//    @ResponseBody
//    @PostMapping("/upload")
//    public ResponseEntity<List<String>> uploadFile(@RequestParam("images") List<MultipartFile> multipartFile, @RequestParam(name = "category") String category) throws IOException {
//        List<String> upload = s3UploadService.upload(category, multipartFile);
//        System.out.println("uploaded");
//        return ResponseEntity.ok(upload);
//    }
//
//    @DeleteMapping("/deleteFile")
//    @ResponseBody
//    public ResponseEntity<String> deleteFile(@RequestParam String fileName) {
//        s3UploadService.deleteFile(fileName);
//        System.out.println("deleted: "+fileName);
//        return ResponseEntity.ok(fileName);
//    }
}
