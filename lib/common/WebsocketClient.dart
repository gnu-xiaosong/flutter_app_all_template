/*
desc: 这是封装好的websocket客户端
 */
import 'dart:io';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebsocketClient {
  Uri? wsUrl;

  WebSocketChannel? channel;

  WebsocketClient({ip = "0.0.0.0", port = 1314, type = "ws"}) {
    this.wsUrl = Uri.parse('$type://$ip:$port');
  }

  // 连接websocketServer
  void connnect() async {
    try {
      // 开始连接
      channel = WebSocketChannel.connect(wsUrl!);
      await channel!.ready;
    } catch (e) {
      // 连接异常
      print(" connnect is error!");
      print("INFO:$e");

      // 中断程序
      exit(0);
    } finally {
      // 连接成功
      print("$channel is connected!");
    }

    // 监听信息
    channel!.stream.listen((message) {
      print("received: $message");
      // 处理监听信息
      listenMessageHandler(message);
    }, onError: (e) {
      // 连接错误
      print("connect is error!");
      print("INFO: $e");
    }, onDone: () {
      // websocket连接中断
      print('WebSocket client disconnected.');
      // ***************连接中断**************
      this.interruptHandler(channel!);
      //****************连接中断**************
    });
  }

  void interruptHandler(WebSocketChannel channel) {
    /*
      desc: 对于连接中断的处理操作,用户继承该类并重写该方法来实现
      parameters:
          channel  WebSocketChannel  中断的WebSocket
     */

    print("$channel is interrupted !");
  }

  // 处理监听的信息处理程序
  void listenMessageHandler(message) {
    // 发送信息给服务器
    print("Broadcast: $message");
    channel!.sink.add('received: $message');
    // 关闭
    // channel!.sink.close(status.goingAway);
  }
}
