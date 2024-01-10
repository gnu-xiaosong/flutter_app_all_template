/*
 * @Author: xskj
 * @Date: 2023-12-29 16:19:41
 * @LastEditors: xskj
 * @LastEditTime: 2023-12-30 14:29:53
 * @Description:app暗夜模式状态  继承基类状态AppState
 */
import 'package:app_template/states/AppState.dart';

class DarkState  extends AppState{

  //是否暗夜模式
   bool _mode = false;
  get mode=>_mode;

  //模式切换
  void changeDarkMode(){
    _mode=!_mode;
    print(_mode);
    notifyListeners();
  }
}