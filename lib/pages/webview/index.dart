import 'dart:io';

import 'package:chnqoo_wallet/constants/config.dart';
import 'package:chnqoo_wallet/widgets/my_toolbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WebViewPageState();
  }
}

class _WebViewPageState extends State<WebViewPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey webViewKey = GlobalKey();
  final params = Get.find<WebViewParams>();

  InAppWebViewController? webViewController;
  InAppWebViewOptions webViewOptions =
      InAppWebViewOptions(useShouldOverrideUrlLoading: true);

  PullToRefreshController? pullToRefreshController;
  String url = "";
  double progress = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        // resizeToAvoidBottomInset: Platform.isIOS,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: MyToolBar(title: params.title, onBackPress: () => Get.back()),
        ),
        body: Container(
          height: double.infinity,
          // padding: EdgeInsets.symmetric(horizontal: Config.PAGE_PADDING),
          decoration: BoxDecoration(
              color: CupertinoColors.systemBrown.color.withOpacity(0.09)),
          // padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Expanded(
                  child: InAppWebView(
                initialUrlRequest: URLRequest(url: Uri.parse(params.source)),
                initialOptions:
                    InAppWebViewGroupOptions(crossPlatform: webViewOptions),
                onWebViewCreated: (controller) {
                  webViewController = controller;
                },
                onLoadStart: (controller, url) {},
                onLoadStop: (controller, url) {},
                shouldOverrideUrlLoading: (controller, navigationAction) async {
                  return NavigationActionPolicy.ALLOW;
                },
                onProgressChanged: (controller, progress) {},
              ))
            ],
          ),
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    webViewController?.clearCache();
  }
}

class WebViewParams extends GetxController {
  final String source;
  final String title;
  WebViewParams(this.title, this.source);
}
