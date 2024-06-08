/*
desc: 定义数据库表结构
 */
import 'package:drift/drift.dart';

// 定义 flutter_user 表
class User extends Table {
  IntColumn get id => integer().autoIncrement()(); // 自动递增的 ID 列
  TextColumn get name => text()(); // 名字列
  IntColumn get age => integer()(); // 年龄列
}
