import 'package:chnqoo_wallet/widgets/my_image.dart';
import 'package:flutter/material.dart';

class HomeToolBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeToolBarState();
  }
}

class HomeToolBarState extends State<HomeToolBar>
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
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.38),
              ),
              height: MediaQuery.of(context).padding.top,
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Theme.of(context).primaryColor.withOpacity(0.38),
                Theme.of(context).primaryColor.withOpacity(0.618)
              ])),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyImage(
                      imageUrl: 'https://blog.cctv3.net/i.jpg',
                      width: 36.0,
                      height: 36.0,
                      borderRadius: BorderRadius.circular(18.0)),
                  Image.asset(
                    'assets/app_logo.png',
                    height: 48,
                    fit: BoxFit.fitWidth,
                  ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       '推荐',
                  //       style: TextStyle(
                  //           color: Colors.black87,
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.w500),
                  //     ),
                  //     SizedBox(
                  //       width: 16,
                  //     ),
                  //     Text(
                  //       '任务',
                  //       style: TextStyle(
                  //         color: Colors.black54,
                  //         fontSize: 18,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   width: 144,
                  //   child: TabBar(
                  //     dividerHeight: 0,
                  //     labelPadding: EdgeInsets.symmetric(horizontal: 3),
                  //     controller: _tabController,
                  //     tabs: [
                  //       ...['首页', '订单', '我的'].map((e) => Tab(
                  //             child: Text(
                  //               e,
                  //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  //             ),
                  //           ))
                  //     ],
                  //     labelColor: Theme.of(context).primaryColor,
                  //     unselectedLabelColor: Colors.black54,
                  //     // add it here
                  //     indicator: MaterialIndicator(
                  //       color: Theme.of(context).primaryColor,
                  //       bottomLeftRadius: 5,
                  //       bottomRightRadius: 5,
                  //       horizontalPadding: 4,
                  //       paintingStyle: PaintingStyle.stroke,
                  //     ),
                  //     // indicator: DotIndicator(
                  //     //   color: Colors.white,
                  //     //   distanceFromCenter: 16,
                  //     //   paintingStyle: PaintingStyle.fill,
                  //     // ),
                  //   ),
                  // ),
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 12,
                        ),
                        Image.asset(
                          'assets/home_email.png',
                          height: 24,
                          width: 24,
                          color: Colors.white,
                        )
                      ],
                    ),
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
