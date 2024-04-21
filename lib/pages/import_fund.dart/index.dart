import 'package:chnqoo_wallet/constants/config.dart';
import 'package:chnqoo_wallet/constants/fund_group.dart';
import 'package:chnqoo_wallet/constants/get_stores.dart';
import 'package:chnqoo_wallet/constants/mock.dart';
import 'package:chnqoo_wallet/widgets/my_toolbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImportFundPage extends StatefulWidget {
  const ImportFundPage({super.key});

  @override
  State<ImportFundPage> createState() => ImportFundPageState();
}

class ImportFundPageState extends State<ImportFundPage> {
  ScrollController? swiper;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GetStores stores = Get.find<GetStores>();
  int index = 0;
  List<FundGroup> fundsGroups = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: MyToolBar(title: '基金导入', onBackPress: () => Get.back()),
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
              ...fundsGroups.asMap().entries.map((e) => GestureDetector(
                  onTap: () {
                    index = e.key;
                    // print('index: ${index} e.key: ${e.key}');
                    setState(() {});
                  },
                  child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: e.key == index
                                  ? Theme.of(context).primaryColor
                                  : Colors.transparent),
                          borderRadius: BorderRadius.circular(12)),
                      margin: EdgeInsets.only(bottom: 12),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            e.value.name,
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                          Text(
                            '${e.value.codes.length}只',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 14),
                          )
                        ],
                      )))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  FilledButton(
                      onPressed: () {
                        stores.setCompareFunds(fundsGroups[index].codes);
                        Get.back();
                      },
                      child: Text('导入'))
                ],
              )
            ],
          )),
        ));
  }

  initGetStores() {
    fundsGroups = Mock()
        .initFundGroups()
        .map<FundGroup>((e) => FundGroup.fromJson(e))
        .toList();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initGetStores();
  }
}
