import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chnqoo_wallet/constants/bing_wall_paper.dart';
import 'package:chnqoo_wallet/constants/config.dart';
import 'package:chnqoo_wallet/constants/get_stores.dart';
import 'package:chnqoo_wallet/constants/services.dart';
import 'package:chnqoo_wallet/mixin/lifecycle.dart';
import 'package:chnqoo_wallet/pages/home/widgets/menus.dart';
import 'package:chnqoo_wallet/pages/home/widgets/toolbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with Lifecycle {
  ScrollController? swiper;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GetStores stores = Get.find<GetStores>();

  onMinePress() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: HomeToolBar(),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: Config.PAGE_PADDING),
        decoration: BoxDecoration(
            color: CupertinoColors.systemBrown.color.withOpacity(0.09)),
        // padding: EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Obx(() => Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width * 9 / 16,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: CachedNetworkImageProvider(
                                stores.bingWallPaper.value.image_url,
                              ))),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width -
                              Config.PAGE_PADDING * 2,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12)),
                              color: Colors.black87.withOpacity(0.38)),
                          child: Column(
                            children: [
                              Text(
                                maxLines: 1,
                                stores.bingWallPaper.value.headline,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                maxLines: 3,
                                stores.bingWallPaper.value.description,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    overflow: TextOverflow.ellipsis),
                              )
                            ],
                          ),
                        ))
                  ],
                )),
            SizedBox(
              height: 12,
            ),
            HomeMenus()
          ],
        )),
      ),
    );
  }

  initGetStores() async {
    var result = await Services()
        .selectBingWallPaper((Random().nextDouble() * 365 * 2).toInt() + 1);
    stores.setBingWallPaper(BingWallPaper.fromJson(result));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer timer = Timer.periodic(Duration(seconds: 10), (timer) {
      initGetStores();
    });
  }

  @override
  void onShow() {
    // TODO: implement onShow
    super.onShow();
  }

  @override
  void onHide() {
    // TODO: implement onHide
    super.onHide();
  }
}
