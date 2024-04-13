import 'package:flutter/material.dart';
import 'package:chnqoo_wallet/widgets/my_image.dart';

class MyToolBar extends StatefulWidget {
  final String title;
  final onBackPress;
  MyToolBar({required this.title, required this.onBackPress});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyToolBarState();
  }
}

class MyToolBarState extends State<MyToolBar>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TabController _tabController = TabController(length: 3, vsync: this);
    return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black54.withOpacity(0.1),
              spreadRadius: 1,
              offset: Offset(0, 1), // 改变阴影的位置
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              // decoration: BoxDecoration(
              //   color: Theme.of(context).primaryColor.withOpacity(0.28),
              // ),
              height: MediaQuery.of(context).padding.top,
            ),
            Expanded(
                child: Container(
              // color: Theme.of(context).primaryColor.withOpacity(0.18),
              // padding: EdgeInsets.symmetric(horizontal: 12),
              // decoration: BoxDecoration(
              //     gradient: LinearGradient(colors: [
              //   Theme.of(context).primaryColor.withOpacity(0.38),
              //   Theme.of(context).primaryColor.withOpacity(0.618)
              // ])),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // 处理点击事件
                      widget.onBackPress();
                    },
                    behavior: HitTestBehavior.translucent, // 放大点击区域但不占用额外空间
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      child: Image.asset(
                        'assets/common_back.png',
                        height: 18,
                        width: 18,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 30,
                  )
                ],
              ),
            ))
          ],
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
