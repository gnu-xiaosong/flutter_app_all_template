/*
 * @Author: xskj
 * @Date: 2023-12-30 18:54:06
 * @LastEditors: xskj
 * @LastEditTime: 2023-12-30 21:52:07
 * @Description: 单例模式封装网络工具类
 */
import "dart:io";
import 'package:dio/dio.dart';
import "package:dio/io.dart";
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import '../config/AppConfig.dart';
import '../config/HttpBasedConfig.dart';
import '../config/ConstConfig.dart';
import './ExceptionsHandlerManager.dart';
import './TestManager.dart';


class HttpManager extends ExceptionsHandlerManager{

  //1、通过静态方法 getInstance() 访问实例—————— getInstance() 构造、获取、返回实例
  /*通过工厂方法获取该类的实例，将实例对象按对应的方法返回出去
   *实例不存在时，调用命名构造方法获取一个新的实例 */
  static HttpManager getInstance(){
    _instance ??= HttpManager._internal();
    return _instance!;
  }

  //2、静态属性——该类的实例
  static HttpManager? _instance=HttpManager._internal();

  //4.1、创建一个 Dio 实例
  late Dio dio;

  //3、私有的命名构造函数，确保外部不能拿到它————初始化实例
  HttpManager._internal(){
    //4.2、从配置HttpBasedConfig类获取配置实例
    BaseOptions baseOptions= HttpBasedConfig().getBasedOptions;

    //4.3 初始化dio实例
    dio=Dio(baseOptions);

    /******************************插件拓展*************************************/
    //1.添加适配器
    dio.httpClientAdapter=AppConfig.httpClientAdapter;
    //2.重试请求插件
    dio.interceptors.add(AppConfig.getRetryInterceptor(dio));
    //3.添加ssl证书:需要更高版本的Android Sdk
    //dio.interceptors.add(CertificatePinningInterceptor(allowedSHAFingerprints))
    //4.添加缓存插件
    dio.interceptors.add(DioCacheInterceptor(options: AppConfig.cacheOptions));
    //5.添加日志log插件---- 仅dev环境依赖
    dio.interceptors.add(AppConfig.prettyDioLogger);
    //5.添加dio踪迹log插件talker---- 仅dev环境依赖
    dio.interceptors.add(AppConfig.talkerDioLogger);
  }

  //请求方法封装
  Future api(String url,{
    METHODS method=METHODS.GET,
    Map<String,dynamic>? parameters,
    Function? onProgress,
    CachePolicy?  policy}) async {
    /*
    * 参数说明：
    * parameters   Map       请求字段
    * onProgress   Function  请求进程回调函数
    * policy       enum      缓存策略 CachePolicy.x
    * method       enum      请求方法  METHODS.x
    * */

     //请求方法
    Response? response;
    try {
      switch(method){
        case METHODS.GET:
          response = await dio.get(
              url,
              queryParameters: parameters,
              onReceiveProgress: (int a, b)=>onProgress,
              options: AppConfig.cacheOptions.copyWith(policy: (policy==null)?AppConfig.cacheOptions.policy:policy).toOptions()
          );
          break;
        case METHODS.POST:
          response = await dio.post(
              url,
              data:parameters as Object,
              onSendProgress:(int a, b)=>onProgress,
              options: AppConfig.cacheOptions.copyWith(policy: (policy==null)?AppConfig.cacheOptions.policy:policy).toOptions()
          );

          break;
        default:
          print("位置方法名");
      }
      //打印输出
      //TestManager.textPrint(response!);

      return response?.data;
    } on DioException catch (e) {
      //调用异常处理工具
      HttpExceptionErr(e);
    }


  }
}




