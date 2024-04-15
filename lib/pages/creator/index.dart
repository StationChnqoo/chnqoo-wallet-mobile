import 'dart:math';

import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:chnqoo_wallet/constants/bond.dart';
import 'package:chnqoo_wallet/constants/bond_news.dart';
import 'package:chnqoo_wallet/constants/config.dart';
import 'package:chnqoo_wallet/constants/get_stores.dart';
import 'package:chnqoo_wallet/constants/services.dart';
import 'package:chnqoo_wallet/constants/x.dart';
import 'package:chnqoo_wallet/widgets/my_toolbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

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
            Text(buildString()),
            SizedBox(
              height: 12,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Row(
                    children: [
                      OutlinedButton(onPressed: () {}, child: Text('参数设置')),
                      SizedBox(
                        width: 24,
                      ),
                      FilledButton(
                          onPressed: () {
                            Clipboard.setData(
                                ClipboardData(text: buildString()));
                          },
                          child: Text('复制 '))
                    ],
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }

  buildString() {
    String result = '';
    List<String> head = [
      '家人们，专业播报还是得交给专业的人，我花了一个星期的时间写了个脚本每天10:00 11:30 14:00 15:30准时为大家播报最新债券行情和咨询。',
      '创作不易，家人们点点关注点点赞。',
      '您的支持就是我创作的最大动力，ღ( ´･ᴗ･` )比心。'
    ];
    String bondString = '债券行情\n';
    for (int i = 0; i < bonds.length; i++) {
      Bond bond = bonds[i];
      bondString +=
          '${bond.f12}/${bond.f14} ${bond.f3 is String ? bond.f3 : bond.f3 > 0 ? '涨${bond.f3}%' : '跌${bond.f3}%'} 成交量：${x.toText(bond.f5)} 成交额：${x.toText(bond.f6)}\n';
    }
    String newsString = '债券资讯\n';
    for (int i = 0; i < min(5, news.length); i++) {
      BondNews bn = news[i];
      newsString += '${bn.time}\n${bn.title}\n\n${bn.detail}\n\n';
    }
    result = [head.join('\n'), '', bondString, newsString].join('\n').trim();
    return result;
  }

  initGetStores() {}

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
    initDatas();
    initNews();
  }
}
