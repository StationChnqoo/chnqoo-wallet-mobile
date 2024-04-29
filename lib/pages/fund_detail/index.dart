import 'package:chnqoo_wallet/constants/config.dart';
import 'package:chnqoo_wallet/constants/get_stores.dart';
import 'package:chnqoo_wallet/pages/fund_detail/widgets/estimate.dart';
import 'package:chnqoo_wallet/widgets/my_toolbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FundDetailPage extends StatefulWidget {
  const FundDetailPage({super.key});

  @override
  State<FundDetailPage> createState() => FundDetailPageState();
}

class FundDetailPageState extends State<FundDetailPage> {
  ScrollController? swiper;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GetStores stores = Get.find<GetStores>();
  final params = Get.find<FundDetailParams>();
  String id = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: MyToolBar(title: '${id}', onBackPress: () => Get.back()),
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
              FundDetailEstimate(id: id)
            ],
          )),
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('id: ${params.id}');
    setState(() {
      id = params.id;
    });
  }
}

class FundDetailParams extends GetxController {
  final String id;

  FundDetailParams(this.id);
}
