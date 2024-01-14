/*
 * @Author: xskj
 * @Date: 2023-12-29 16:19:41
 * @LastEditors: xskj
 * @LastEditTime: 2023-12-30 12:42:13
 * @Description: home页 topTab切换标签tabview
 */

import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

//轮播图
// 轮播图片
List<Map> imageList = [
  {"url": "http://www.itying.com/images/flutter/1.png"},
  {"url": "http://www.itying.com/images/flutter/2.png"},
  {"url": "http://www.itying.com/images/flutter/3.png"},
  {"url": "http://www.itying.com/images/flutter/4.png"}
];

Widget Tile(int index) {
  return Container(
    width: double.infinity,
    color: Colors.blue,
    padding: const EdgeInsets.all(3),
    child: Center(child: Text(index.toString())),
  );
}

//主页面组件
Widget Index() {
  return StaggeredGrid.count(
    crossAxisCount: 4,
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    children: [
      StaggeredGridTile.count(
          crossAxisCellCount: 4,
          mainAxisCellCount: 2,
          child: new Swiper(
            //初始的时候下标位置
            index: 0,
            //当用户点击某个轮播的时候调用
            onTap: (index) {
              print(index);
            },
            //指示器
            indicatorLayout: PageIndicatorLayout.COLOR,
            //动画时间，单位是毫秒
            duration: 300,
            autoplay: true,
            //方向
            scrollDirection: Axis.horizontal,
            //item构建器
            itemBuilder: (BuildContext context, int index) {
              return new Image.network(
                imageList[index]["url"],
                fit: BoxFit.fill,
              );
            },
            //样式
            layout: SwiperLayout.DEFAULT,
            //item数量
            itemCount: imageList.length,
          )),
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
  //微光效果
  // return Shimmer.fromColors(
  //     baseColor: Colors.red,
  //     highlightColor: Colors.yellow,
  //     child: Center(child: Text("tabview 1")));
}

//刷新控制器获取控制器
RefreshController _refreshController = RefreshController(initialRefresh: false);
void _onRefresh() async {
  // monitor network fetch
  await Future.delayed(const Duration(milliseconds: 1000));
  // if failed,use refreshFailed()
  _refreshController.refreshCompleted();
}

void _onLoading() async {
  // monitor network fetch
  await Future.delayed(const Duration(milliseconds: 1000));
  // if failed,use loadFailed(),if no data return,use LoadNodata()
  // items.add((items.length + 1).toString());
  // if (mounted) setState(() {});
  _refreshController.loadComplete();
}

class MobileTabView1 extends StatefulWidget {
  const MobileTabView1({super.key});

  @override
  State<MobileTabView1> createState() => _MobileTabView1State();
}

class _MobileTabView1State extends State<MobileTabView1> {
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: const WaterDropHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: Index());
  }
}
