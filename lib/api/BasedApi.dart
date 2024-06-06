/*
 * @Author: xskj
 * @Date: 2023-12-30 18:54:06
 * @LastEditors: xskj
 * @LastEditTime: 2023-12-30 21:52:07
 * @Description: api请求基类
 */

import '../manager/GlobalManager.dart';
import '../manager/HttpManager.dart';

class BasedApi extends GlobalManager {
  //全局方法http
  HttpManager get appHttp => GlobalManager().GlobalHttp;
}
