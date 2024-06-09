import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

// 图片数据列表
List<Map> imageList = [
  {"url": "http://www.itying.com/images/flutter/1.png"},
  {"url": "http://www.itying.com/images/flutter/2.png"},
  {"url": "http://www.itying.com/images/flutter/3.png"},
  {"url": "http://www.itying.com/images/flutter/4.png"}
];

// 定义一个简单的 Tile 小部件
Widget Tile(int index) {
  return Container(
    width: double.infinity,
    color: Colors.blue,
    padding: const EdgeInsets.all(3),
    child: Center(child: Text(index.toString())),
  );
}

// 主页面内容组件
Widget Index() {
  return StaggeredGrid.count(
    crossAxisCount: 4,
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    children: [
      StaggeredGridTile.count(
        crossAxisCellCount: 4,
        mainAxisCellCount: 2,
        child: Swiper(
          index: 0,
          onTap: (index) {
            print(index);
          },
          indicatorLayout: PageIndicatorLayout.COLOR,
          duration: 300,
          autoplay: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              imageList[index]["url"],
              fit: BoxFit.fill,
            );
          },
          layout: SwiperLayout.DEFAULT,
          itemCount: imageList.length,
        ),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 2,
        mainAxisCellCount: 2,
        child: Tile(0),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 2,
        mainAxisCellCount: 1,
        child: Tile(1),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1,
        child: Tile(2),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1,
        child: Tile(3),
      ),
    ],
  );
}

class MobileTabView1 extends StatefulWidget {
  const MobileTabView1({Key? key}) : super(key: key);

  @override
  State<MobileTabView1> createState() => _MobileTabView1State();
}

class _MobileTabView1State extends State<MobileTabView1> {
  // 独立的 RefreshController
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  // 下拉刷新处理函数
  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  // 上拉加载处理函数
  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.loadComplete();
  }

  // 销毁时需要释放 RefreshController
  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: const WaterDropHeader(),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: Index(),
    );
  }
}
