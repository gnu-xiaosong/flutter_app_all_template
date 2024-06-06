/*
 * @Author: xskj
 * @Date: 2023-12-29 13:25:12
 * @LastEditors: xskj
 * @LastEditTime: 2023-12-29 13:40:14
 * @Description: 异常处理工具类
 */

import 'package:dio/dio.dart';

class ExceptionsHandlerManager {

   


    void HttpExceptionErr(DioException e){
    /*
    * http请求异常处理工具
    */

    if (e.type == DioExceptionType.connectionTimeout) {
      // It occurs when url is opened timeout.
      print("连接超时");
    } else if (e.type == DioExceptionType.sendTimeout){
      // It occurs when url is sent timeout.
      print("请求超时");
    } else if (e.type == DioExceptionType.receiveTimeout) {
      //It occurs when receiving timeout
      print("响应超时");
    } else if (e.type == DioExceptionType.badResponse) {
      // When the server response, but with a incorrect status, such as 404, 503...
      print("出现异常");
    } else if (e.type == DioExceptionType.cancel) {
      // When the request is cancelled, dio will throw a error with this type.
      print("请求取消");
    } else {
      print("错误信息:${e.error}");
      print(e.requestOptions.uri);
      //DEFAULT Default error type, Some other Error. In this case, you can read the DioError.error if it is not null.
      print("未知错误");
    }
  }
}