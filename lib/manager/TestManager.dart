/*
 * @Author: xskj
 * @Date: 2023-12-29 13:25:12
 * @LastEditors: xskj
 * @LastEditTime: 2023-12-29 13:40:14
 * @Description: 测试工具类
 */
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../database/daos/UserDao.dart';

class TestManager {
  // 公共调试函数
  static void debug() {
    // 调试ADO
    testADO();
  }

  //http返回数据打印输出
  static void textPrint(Response response) {
    print("----------------------测试调试-----------------");
    print("请求状态: ${response?.statusCode}");
    print("请求头: ${response?.headers}");
    print("请求参数: ${response?.requestOptions.toString()}");
    print("返回数据: ${response?.data}");
  }

  // sqlite数据库调试
  static Future<void> testADO() async {
    print("---------------ADO handler-----------");
    UserDao userDao = UserDao();
    // 插入数据
    userDao.insertTest().then((value) {
      print("insert data count: $value");
    });

    // 查询操作测试
    final queryData = await userDao.selectTest("小明");
    for (var element in queryData) {
      if (kDebugMode) {
        print(element);
      }
    }
    print(queryData);
  }
}
