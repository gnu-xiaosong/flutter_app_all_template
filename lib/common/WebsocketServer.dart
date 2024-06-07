/*
desc: 这是封装好的websocket服务端，作为中继服务器
 */

import 'dart:io';

class WebSocketServer {
  // IP地址
  InternetAddress? ip = InternetAddress.anyIPv4;

  // 端口port
  final int port;

  WebSocketServer({
    this.port = 1314,
  });
  // 初始化HttpServer服务
  late HttpServer _server;

  // websocket 连接的client客户端列表
  final List<WebSocket> _clients = [];

  // websocket server启动
  Future<void> start() async {
    // 绑定ip和端口
    _server = await HttpServer.bind(ip, port);
    print('WebSocket server running on ${_server.address}:${_server.port}');

    // 遍历处理与之连接的websocket client客户端
    await for (var request in _server) {
      if (WebSocketTransformer.isUpgradeRequest(request)) {
        //  判断接收到的请求是否是WebSocket升级请求。如果是的话，说明客户端希望将HTTP连接升级为WebSocket连接
        _handleWebSocket(request);
      } else {
        // 处理普通的HTTP请求
        _handleRegularHttpRequest(request);
      }
    }
  }

  // 处理websocket client客户端的请求
  void _handleWebSocket(HttpRequest request) async {
    WebSocket webSocket = await WebSocketTransformer.upgrade(request);
    print('WebSocket client connected.');
    // 连接成功添加进列表中
    _clients.add(webSocket);

    // 监听消息
    webSocket.listen((message) {
      print('Received message: $message');
      // ***************监听消息并处理**************
      this.messageHandler(webSocket, message);
      //****************监听消息并处理**************
    }, onDone: () {
      // websocket连接中断
      print('WebSocket client disconnected.');
      // ***************连接中断**************
      this.interruptHandler(webSocket);
      //****************连接中断**************
      // 移除当前中断的websocket
      _clients.remove(webSocket);
    });
  }

  void messageHandler(WebSocket webSocket, dynamic message) {
    /*
      desc: 对于监听到消息进行处理操作,用户继承该类并重写该方法来实现
      parameters:
          webSocket  WebSocket  中断的WebSocket
          message    dict  对象字典
     */

    // 所有客户端广播消息
    broadcast('$message');
  }

  void interruptHandler(WebSocket webSocket) {
    /*
      desc: 对于连接中断的处理操作,用户继承该类并重写该方法来实现
      parameters:
          webSocket  WebSocket  中断的WebSocket
     */

    print("$webSocket is interrupted !");
  }

  // 处理普通http请求
  void _handleRegularHttpRequest(HttpRequest request) {
    // 默认提示websocket请求
    request.response
      ..statusCode = HttpStatus.methodNotAllowed
      ..write('WebSocket connections only')
      ..close();
  }

  // server向client广播消息
  void broadcast(String message) {
    print('Broadcast message: $message');
    for (var client in _clients) {
      // 返回数据给client客户端
      client.add(message);
    }
  }

  // websocket server停止
  Future<void> stop() async {
    await _server.close();
    print('WebSocket server stopped.');
  }
}
