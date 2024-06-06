/*
 * @Author: xskj
 * @Date: 2023-12-29 16:19:41
 * @LastEditors: xskj
 * @LastEditTime: 2023-12-30 14:29:53
 * @Description: 用户共享状态  继承基类状态BasedState
 */

import '../manager/GlobalManager.dart';
import '../models/index.dart';
import 'AppState.dart';

class UserState extends AppState {
  /*
  * desc:包括登录状态等用户属性状态
  */
  //获得用户jsonModel类:来自于集成的basedState中的基类属性
  UserModel get user => GlobalManager.userInfo;

  // APP是否登录(如果有用户信息，则证明登录过)
  bool get isLogin => user != null;

  //用户信息发生变化，更新用户信息并通知依赖它的子孙Widgets更新:应用x.setUser = user;
  set setUser(UserModel user) {
    if (user?.username != GlobalManager.userInfo?.username) {
      GlobalManager.userInfo = user;
      //通知widget更新
      notifyListeners();
    }
  }
}
