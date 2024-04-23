import 'dart:math';

import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:chnqoo_wallet/constants/bond.dart';
import 'package:chnqoo_wallet/constants/bond_news.dart';
import 'package:chnqoo_wallet/constants/config.dart';
import 'package:chnqoo_wallet/constants/get_stores.dart';
import 'package:chnqoo_wallet/constants/services.dart';
import 'package:chnqoo_wallet/constants/x.dart';
import 'package:chnqoo_wallet/pages/creator/widgets/thanks.dart';
import 'package:chnqoo_wallet/widgets/my_toolbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class CreatorPage extends StatefulWidget {
  const CreatorPage({super.key});

  @override
  State<CreatorPage> createState() => CreatorPageState();
}

class CreatorPageState extends State<CreatorPage> {
  ScrollController? swiper;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GetStores stores = Get.find<GetStores>();
  List<Bond> bonds = [];
  List<BondNews> news = [];
  List<CopyMessage> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyToolBar(title: '文案编辑', onBackPress: () => Get.back()),
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
            CreatorThanks(),
            SizedBox(
              height: 12,
            ),
            ...messages.asMap().entries.map((e) => Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: GestureDetector(
                    onTap: () {
                      e.value.checked = !e.value.checked;
                      setState(() {});
                    },
                    child: Card.outlined(
                      margin: EdgeInsets.zero,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Checkbox(
                                value: e.value.checked, onChanged: (value) {}),
                            Flexible(
                                child: Text(
                              e.value.value,
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black87),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
            Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  FilledButton(onPressed: onCopyPress, child: Text('复制 '))
                ],
                mainAxisAlignment: MainAxisAlignment.end,
              ),
            )
          ],
        )),
      ),
    );
  }

  onCopyPress() {
    String result = messages
        .where((element) => element.checked)
        .map((e) => e.value)
        .join('\n\n');
    Clipboard.setData(ClipboardData(text: result));
    x.toast('复制成功', '${(result.length / 1024).toStringAsFixed(2)}KB');
  }

  messageBuilder() {
    String bondString = '债券行情\n';
    for (int i = 0; i < bonds.length; i++) {
      Bond bond = bonds[i];
      bondString +=
          '${bond.f12}/${bond.f14} ${bond.f3 is String ? bond.f3 : bond.f3 > 0 ? '涨${bond.f3}%' : '跌${bond.f3}%'} 成交量：${x.toText(bond.f5)} 成交额：${x.toText(bond.f6)}\n';
    }
    messages.add(CopyMessage(checked: true, value: bondString.trim()));
    for (int i = 0; i < min(10, news.length); i++) {
      BondNews bn = news[i];
      messages.add(CopyMessage(
          checked: true, value: '${bn.time}\n${bn.title}\n\n${bn.detail}'));
    }
    setState(() {});
  }

  initGetStores() async {
    await initDatas();
    await initNews();
    messageBuilder();
  }

  initDatas() async {
    var result = await Services().selectEastMoneyBonds();
    var data = result['data'] as Map<String, dynamic>;
    //  List<dynamic> diff = json.decode(data['diff']).cast<Map<String, dynamic>>();
    // var diff = data['diff'] as Map<String, dynamic>;
    bonds = data['diff'].map<Bond>((json) => Bond.fromJson(json)).toList();
    setState(() {});
  }

  String findClassText(Bs4Element e, String class_) =>
      e.find('p', class_: class_)!.text.trim();
  initNews() async {
    var result = await Services().selectEastMoneyBondsNews();
    BeautifulSoup bs = BeautifulSoup(result.toString());
    var ul = bs.find('ul', class_: 'guidance_list guidance_325 active');
    var lis = ul!.findAll('li');
    news = lis
        .map<BondNews>((e) => BondNews(
            title: findClassText(e, 'title'),
            detail: findClassText(e, 'detail'),
            time: findClassText(e, 'time'),
            tags: []))
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

class CopyMessage {
  bool checked;
  String value;
  CopyMessage({required this.checked, required this.value});
}
