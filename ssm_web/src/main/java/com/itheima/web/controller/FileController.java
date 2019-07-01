package com.itheima.web.controller;

import com.itheima.utils.FileNameUtil;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Objects;

/**
 * @author Challenger
 * @date 2019/7/1 10:21
 * projectName ssm
 * description
 */
@Controller
@RequestMapping("/file")
public class FileController {


    @RequestMapping("/toUpload")
    public String toUpload() {

        return "uploadFile";
    }

    @RequestMapping("/upload1")
    public String upload1(HttpServletRequest request, MultipartFile upload) {
        // 存放文件的文件夹是否存在
        File file = new File(request.getServletContext().getRealPath("/uploads"));
        if (!file.exists()) {
            file.mkdirs();
        }
        // 新文件名
        String fileName = FileNameUtil.getFileName(Objects.requireNonNull(upload.getOriginalFilename()));
        try {
            // 上传
            upload.transferTo(new File(file, fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "success";
    }

    @RequestMapping("/upload2")
    public String upload2(MultipartFile upload) {
        // 文件服务器地址
        String path = "http://localhost:8088/ssm_file_war_exploded/uploads/";
        // 新文件名
        String fileName = FileNameUtil.getFileName(Objects.requireNonNull(upload.getOriginalFilename()));
        // 客户端
        Client client = Client.create();
        // 资源对象
        WebResource webResource = client.resource(path + fileName);
        try {
            // 上传
            webResource.put(upload.getBytes());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "success";
    }
}
