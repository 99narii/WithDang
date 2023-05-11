package com.earth.upload;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@RequiredArgsConstructor
@Service
public class S3UploadService {
//    @Value("${cloud.aws.s3.bucket}")
//    private String bucket;
//    @Autowired
//    private AmazonS3 amazonS3;
//
//
//
//
//
//    public List<String> upload(String category,List<MultipartFile> multipartFiles) throws IOException {
//        List<String> fileNameList = new ArrayList<>();
//        multipartFiles.forEach(file->{
//
//            String s3FileName = createFileName(file.getOriginalFilename(), category);
//
//            ObjectMetadata objectMetadata = new ObjectMetadata();
//            objectMetadata.setContentLength(file.getSize());
//            objectMetadata.setContentType(file.getContentType());
//
//            try (InputStream inputStream =file.getInputStream()){
//                amazonS3.putObject(new PutObjectRequest(bucket, s3FileName, inputStream, objectMetadata).withCannedAcl(CannedAccessControlList.PublicRead));
//            } catch (IOException e) {
//                throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR,"업로드 실패");
//            }
//            fileNameList.add(s3FileName);
//        });
//        return fileNameList;
//    }
//
//    public String createFileName(String fileName, String category){
//        return category + "/" + UUID.randomUUID().toString().concat(getFileExtension(fileName));
//    }
//
//
////여기서 업로드 되는 파일 종류 제한
//    public String getFileExtension(String fileName) {
//        return fileName.substring(fileName.lastIndexOf("."));
//    }
//
//    public void deleteFile(String fileName) {
//        amazonS3.deleteObject(new DeleteObjectRequest(bucket, fileName));
//    }


}
