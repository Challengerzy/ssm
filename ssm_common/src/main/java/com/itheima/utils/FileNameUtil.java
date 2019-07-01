package com.itheima.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author Challenger
 * @date 2019/7/1 10:50
 * projectName ssm
 * description
 */
public class FileNameUtil {

    public static String getFileName(String fileName) {
        // 文件名前缀
        String format = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
        // 文件名后缀
        String substring = fileName.substring(fileName.lastIndexOf("."));
        return format + substring;
    }
}
