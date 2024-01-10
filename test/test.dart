//请求测试
import 'package:app_template/api/TestApi.dart';
import 'package:app_template/common/ToolsManager.dart';
import 'package:app_template/models/AppModel.dart';

//测试api
Future<void> getApiTest() async {
  print("发起请求.........");
  TestApi.testApi();
  //AppModel appModel = ;
  //print(appModel);
}

//通知调试函数
void test1(){

}