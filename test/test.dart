// //测试api
// Future<void> getApiTest() async {
//   print("发起请求.........");
//   TestApi.testApi();
//   //AppModel appModel = ;
//   //print(appModel);
// }
//
// //通知调试函数
// void test1() {}

main() {
  var sqlite3;
  final database = sqlite3.open('App.db');

  // 创建一个名为 items 的表
  database.execute('''
    CREATE TABLE IF NOT EXISTS items (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      description TEXT
    )
  ''');

  // 插入一些数据
  database.execute('''
    INSERT INTO items (name, description)
    VALUES ('Item 1', 'Description of item 1')
  ''');

  // 查询数据
  final result = database.select('SELECT * FROM items');
  print(result);

  // 关闭数据库连接
  database.dispose();
}
