/*
 * @Author: xskj
 * @Date: 2023-12-29 16:19:41
 * @LastEditors: xskj
 * @LastEditTime: 2023-12-30 14:29:53
 * @Description: app描述信息共享状态  继承基类状态AppState
 */

import 'package:app_template/models/AppModel.dart';
import 'package:app_template/states/AppState.dart';

import '../manager/GlobalManager.dart';

class DescState extends AppState {
  /*
  * desc:包括登录状态等用户属性状态
  */
  //获得用户jsonModel类:来自于集成的basedState中的基类属性
  AppModel get app => GlobalManager.appConfigModel;

  //desc信息发生变化，更新用户信息并通知依赖它的子孙Widgets更新:应用x.setDesc = desc;
  set setDesc(AppModel app) {
    if (app != null) {
      //保存全局变量中的内容
      GlobalManager.appConfigModel = app;

      //通知widget更新
      notifyListeners();
    }
  }
}
