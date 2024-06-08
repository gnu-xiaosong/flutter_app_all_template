/*
desc: 这是本地数据库存储类:利用sqlite3引擎，drift包
*/
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:app_template/database/tables/UserTable.dart';
// 创建 LocalStorage 类
part 'LocalStorage.g.dart'; // Drift 将生成这个文件

@DriftDatabase(tables: [User])
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection()) {
    print("初始化数据库");
  }

  @override
  int get schemaVersion => 1; // 设置数据库模式版本
}

// 打开数据库连接
LazyDatabase _openConnection() {
  // 数据库名
  String dbname = "app";

  // 打开数据库
  return LazyDatabase(() async {
    // Andriod内部存储
    final dbFolder = await getApplicationDocumentsDirectory();
    // 外部存储
    // 获取外部存储目录
    // final dbFolder = await getExternalStorageDirectory();
    final file = File(p.join(dbFolder.path, '$dbname.sqlite'));

    print("db location:$file");
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }
    return NativeDatabase(file);
  });
}
