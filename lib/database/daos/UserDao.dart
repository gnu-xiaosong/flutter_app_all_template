/*
desc: UserDao类DAO操作: DAO类集中管理 CRUD 操作
*/
import 'package:app_template/database/LocalStorage.dart';
import 'package:app_template/database/daos/BaseDao.dart';
import '../../manager/GlobalManager.dart';
import '../tables/UserTable.dart';

class UserDao implements BaseDao<User> {
  // 查询数据
  Future<List> selectTest(item) async {
    // 获取database单例
    var db = GlobalManager.database;

    // 构建查询
    final query = db.select(db.user)..where((tbl) => tbl.name.equals(item));
    // 获取查询结果
    final result = await query.get();
    // 将查询结果转换为 UserData 的列表
    return result
        .map((row) => UserData(
              id: row.id,
              name: row.name,
              age: row.age,
            ))
        .toList();
  }

  // 插入数据
  Future<dynamic> insertTest() async {
    // 获取database单例
    var db = GlobalManager.database;

    // 构建查询
    final result = await db.batch((batch) {
      batch.insertAll(db.user, [
        UserCompanion.insert(name: "小红", age: 18),
        UserCompanion.insert(name: "小明", age: 20),
        UserCompanion.insert(name: "小张", age: 23),
        UserCompanion.insert(name: "小黄", age: 22),
        UserCompanion.insert(name: "小蔡", age: 21),
      ]);
    });

    return result;
  }

  // 更新数据
  Future<int> updateTest(item) async {
    // 获取database单例
    var db = GlobalManager.database;
    int result = 0;
    await db.update(db.user)
      ..where((tbl) => tbl.name.equals(item))
      ..write(const UserData(id: 100, name: "xskj", age: 18)).then((value) {
        print("update result: $value");
        result = value;
      });

    return result;
  }

  // 删除数据
  int deleteTest(item) {
    // 获取database单例
    var db = GlobalManager.database;
    // 删除条数
    int result = 0;
    db.delete(db.user)
      ..where((tbl) => tbl.name.equals(item))
      ..go().then((value) {
        print("delete data count: $value");
        result = value;
      });

    return result;
  }
}
