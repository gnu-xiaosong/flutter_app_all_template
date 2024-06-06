/*
 * @Author: xskj
 * @Date: 2023-12-29 16:19:41
 * @LastEditors: xskj
 * @LastEditTime: 2023-12-30 14:29:53
 * @Description: 其他额外共享状态  继承基类状态BasedState
 */

import 'package:app_template/models/index.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'AppState.dart';

class OtherState extends AppState {
  //windows侧边栏选择index
  OtherModel otherModel = OtherModel()
    ..topIndex = 0
    ..isMaximized = false;
  //windows缩放窗口图标是否缩放：true or false

  //windows侧边栏选择index
  void setData({num? topIndex}) {
    otherModel.topIndex = topIndex!;
    print("数据: ${topIndex}");
    //通知widget更新
    notifyListeners();
  }

  //保存PanelController _pc = new PanelController()
  void savePanelController(PanelController _pc) {}

//windows缩放窗口图标是否缩放：true or false
  void setIsMaximized() {
    otherModel.isMaximized = !otherModel.isMaximized;
    print("state:${otherModel.isMaximized}");
    //通知widget更新
    notifyListeners();
  }
}
