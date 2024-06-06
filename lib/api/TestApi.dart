/*
 * @Author: xskj
 * @Date: 2023-12-30 18:54:06
 * @LastEditors: xskj
 * @LastEditTime: 2023-12-30 21:52:07
 * @Description: test请求类
 */
import '../config/ConstConfig.dart';
import '../manager/GlobalManager.dart';
import '../manager/HttpManager.dart';

class TestApi extends GlobalManager {
  static Future<void> testApi() async {
    //获取dio实例化对象-单例模式
    HttpManager appHttp = GlobalManager().GlobalHttp;
    //发起请求
    String url = "/api/wenan-fkxqs/index.php";
    Map<String, dynamic> params = {"type": "json"};

    var res = await appHttp.api(url, parameters: params, method: METHODS.GET);

    print("---------------------获取消息-----------------");
    print(res.toString());
  }
}
